import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class FavoriteMoviesPage extends StatelessWidget {
  const FavoriteMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarAppLogo(),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        child: AbstractListBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
          header: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              context.translations.favorites,
              style: const TextStyle(color: Color(0xFFE4ECEF), fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          onInit: (context) => context.read<FavoriteMoviesBloc>().add(FavoriteMoviesLoadEvent()),
          enableRefresh: false,
          enableLoadMore: false,
          itemBuilder: (context, favoriteMoviesState, index) {
            return MovieWidget(movie: favoriteMoviesState.items[index]);
          },
          separatorBuilder: (_, __, ___) => const SizedBox(height: 20),
          noDataBuilder: (_, __, ___) => Center(
            child: Text(context.translations.there_are_no_favorites_yet),
          ),
        ),
      ),
    );
  }
}
