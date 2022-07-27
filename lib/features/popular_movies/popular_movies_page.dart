import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:flutter_q/_all.dart';

class PopularMoviesPage extends StatelessWidget {
  const PopularMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarAppLogo(),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        child: BlocProvider(
          create: (context) => services.get<PopularMoviesBloc>(),
          child: AbstractListBuilder<PopularMoviesBloc, PopularMoviesState>(
            header: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                context.translations.popular,
                style: const TextStyle(color: Color(0xFFE4ECEF), fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            onInit: (context) => context.read<PopularMoviesBloc>().add(PopularMoviesLoadEvent()),
            onRefresh: (context) => context.read<PopularMoviesBloc>().add(PopularMoviesRefreshEvent()),
            onLoadMore: (context) => context.read<PopularMoviesBloc>().add(PopularMoviesLoadMoreEvent()),
            itemBuilder: (context, popularMoviesState, index) {
              return MovieWidget(movie: popularMoviesState.items[index]);
            },
            separatorBuilder: (context, state, index) => const SizedBox(height: 20),
            noDataBuilder: (_, __, ___) => Center(
              child: Text(context.translations.there_are_no_popular_movies),
            ),
          ),
        ),
      ),
    );
  }
}
