import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

Future main(args) async {
  await Startup.configure();

  BlocOverrides.runZoned(
    () => runApp(const App()),
    blocObserver: AppBlocObserver(),
  );
}
