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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                S.current.favorites,
                style: const TextStyle(
                  color: Color(0xFFE4ECEF),
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Expanded(
              child: Consumer(
                builder: (context, ref, child) {
                  return ref.watch(favoriteMoviesStateNotifierProvider).when(
                        initial: () => Container(),
                        other: (_) => Container(),
                        data: (items) => ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                MovieWidget(movie: items[index]),
                                const SizedBox(height: 20),
                              ],
                            );
                          },
                        ),
                        error: (_) => Container(),
                        loading: () => const Loader(),
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
