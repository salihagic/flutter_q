// ignore_for_file: always_use_package_imports

import 'package:beamer/beamer.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_q/_all.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'main/app_environment.dart';
import 'theme/themes.dart' as themes;

Future<void> mainCommon(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  EnvInfo.initialize(environment);

  await Hive.initFlutter();
  final favoritesRepository = FavoritesRepositoryImpl();
  await favoritesRepository.init();
  final cacheHandler = CacheHandlerImpl();
  await cacheHandler.init();

  void runAppCallback() => runApp(ProviderScope(
        observers: [CustomProviderObserver()],
        overrides: [
          favoritesRepositoryProvider.overrideWithValue(favoritesRepository),
          cacheHandlerProvider.overrideWithValue(cacheHandler),
        ],
        child: const MyApp(),
      ));
  if (environment == AppEnvironment.PROD) {
    await SentryFlutter.init(
      (options) {
        options.dsn = 'DSN';
      },
      appRunner: runAppCallback,
    );
  } else {
    runAppCallback();
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final baseRouter = ref.watch(baseRouterProvider);
    return BeamerProvider(
      routerDelegate: baseRouter.routerDelegate as BeamerDelegate,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: EnvInfo.environment != AppEnvironment.PROD,
        title: EnvInfo.appTitle,
        theme: themes.primaryTheme,
        localizationsDelegates: const [
          S.delegate,
          ...GlobalMaterialLocalizations.delegates,
        ],
        routerDelegate: baseRouter.routerDelegate,
        routeInformationParser: baseRouter.routeInformationParser,
        routeInformationProvider: baseRouter.routeInformationProvider,
        builder: (context, child) {
          return ConnectivityContainer(
            child: BaseWidget(child: child ?? const SizedBox()),
          );
        },
      ),
    );
  }
}
