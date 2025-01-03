import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, navigationState) {
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
