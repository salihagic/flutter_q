import 'package:flutter_q/_all.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: PopularMoviesPage());
  }
}
