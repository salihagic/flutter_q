import 'package:flutter_q/_all.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
        padding: const EdgeInsets.fromLTRB(
          20.0,
          20.0,
          20.0,
          0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                S.current.popular,
                style: const TextStyle(
                  color: Color(0xFFE4ECEF),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Consumer(
              builder: (context, ref, _) {
                final popularMoviesState =
                    ref.watch(popularMoviesStateNotifierProvider);
                final popularMoviesSearchModel =
                    ref.watch(popularMoviesFiltersStateNotifierProvider);

                ref.listen(
                  popularMoviesStateNotifierProvider,
                  (_, __) => _refreshController.complete(),
                );

                return popularMoviesState.when(
                  initial: () => Container(),
                  loading: () => const BaseLoadingIndicator(),
                  data: (items) {
                    if (items.isEmpty) {
                      return Center(
                        child: Text(S.current.there_are_no_popular_movies),
                      );
                    }

                    return Expanded(
                      child: SmartRefresher(
                        controller: _refreshController,
                        enablePullDown: true,
                        enablePullUp: true,
                        onRefresh: () {
                          popularMoviesSearchModel.reset();
                          ref
                              .read(popularMoviesFiltersStateNotifierProvider
                                  .notifier)
                              .update(popularMoviesSearchModel);
                          ref
                              .read(popularMoviesStateNotifierProvider.notifier)
                              .refresh(popularMoviesSearchModel);
                        },
                        onLoading: () {
                          popularMoviesSearchModel.increment();
                          ref
                              .read(popularMoviesFiltersStateNotifierProvider
                                  .notifier)
                              .update(popularMoviesSearchModel);
                          ref
                              .read(popularMoviesStateNotifierProvider.notifier)
                              .loadMore(popularMoviesSearchModel);
                        },
                        child: ListView.separated(
                          itemCount: items.length,
                          itemBuilder: (_, index) => MovieWidget(
                            movie: items[index],
                          ),
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 20),
                        ),
                      ),
                    );
                  },
                  other: (_) => Container(),
                  error: (_) => Container(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
