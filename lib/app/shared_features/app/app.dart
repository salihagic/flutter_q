import 'package:flutter_q/_all.dart';

final globalNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AnimatedFadeIn(
      child: _AppLayoutBuilder(),
    );
  }
}

class _AppLayoutBuilder extends StatelessWidget {
  const _AppLayoutBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final themeState = ref.watch(themeProvider);

        return ResponsiveLayoutBuilder(
          small: (_, __) => _App(theme: AppTheme.small, darkTheme: AppTheme.smallDark, themeMode: themeState.themeMode),
          medium: (_, __) => _App(theme: AppTheme.medium, darkTheme: AppTheme.mediumDark, themeMode: themeState.themeMode),
          large: (_, __) => _App(theme: AppTheme.large, darkTheme: AppTheme.largeDark, themeMode: themeState.themeMode),
        );
      },
    );
  }
}

class _App extends StatelessWidget {
  const _App({
    Key? key,
    required this.theme,
    required this.darkTheme,
    required this.themeMode,
  }) : super(key: key);

  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final localizationState = ref.watch(localizationProvider);

        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();

            return true;
          },
          child: MaterialApp(
            title: 'App',
            theme: theme,
            darkTheme: darkTheme,
            themeMode: themeMode,
            locale: localizationState.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            navigatorKey: globalNavigatorKey,
            debugShowCheckedModeBanner: false,
            builder: (context, child) {
              _setStatusBarAndSystemNavigationColors();

              return Consumer(
                builder: (context, ref, _) {
                  ref.listen(
                    errorHandlerProvider,
                    (_, __) {
                      final errorHandlerState = ref.watch(errorHandlerProvider);

                      if (errorHandlerState.showMessage) {
                        context.toast.showExceptionMessage(context.translations, errorHandlerState.exception!);
                      }
                    },
                  );

                  return ConnectivityContainer(child: child!);
                },
              );
            },
            onGenerateRoute: AppRouter.onGenerateRoute,
            initialRoute: AppRouter.rootRoute,
          ),
        );
      },
    );
  }
}

void _setStatusBarAndSystemNavigationColors() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF010510),
      statusBarColor: Color(0xFF0e1324),
    ),
  );
}
