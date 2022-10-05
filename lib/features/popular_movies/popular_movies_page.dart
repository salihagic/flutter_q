import 'package:abstract_bloc/abstract_bloc.dart';
import 'package:abstract_bloc/extensions/_all.dart';
import 'package:flutter_q/_all.dart';

class PopularMoviesPage extends StatefulWidget {
  const PopularMoviesPage({Key? key}) : super(key: key);

  @override
  State<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends State<PopularMoviesPage> {
  final RefreshController _refreshController = RefreshController();

  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarAppLogo(),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                context.translations.popular,
                style: const TextStyle(color: Color(0xFFE4ECEF), fontSize: 22, fontWeight: FontWeight.w600),
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, _) {
                  final popularMoviesController = ref.read(popularMoviesProvider.notifier);
                  final popularMoviesState = ref.watch(popularMoviesProvider);

                  _refreshController.complete();

                  if (popularMoviesState.result.items.isEmpty) {
                    return Center(
                      child: Text(context.translations.there_are_no_popular_movies),
                    );
                  }

                  return SmartRefresher(
                    controller: _refreshController,
                    enablePullDown: true,
                    enablePullUp: true,
                    onRefresh: () => popularMoviesController.refresh(),
                    onLoading: () => popularMoviesController.loadMore(),
                    child: ListView.separated(
                      itemCount: popularMoviesState.result.items.length,
                      itemBuilder: (_, index) => MovieWidget(movie: popularMoviesState.result.items[index]),
                      separatorBuilder: (_, __) => const SizedBox(height: 20),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
