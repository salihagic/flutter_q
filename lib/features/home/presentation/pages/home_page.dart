import 'package:flutter_q/_all.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer(
        builder: (context, ref, _) {
          final navigationState = ref.watch(navigationProvider);

          switch (navigationState.index) {
            case 0:
              return const PopularMoviesPage();
            case 1:
              return const FavoriteMoviesPage();
            default:
              return const Center(child: Text('Invalid navigation index'));
          }
        },
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
