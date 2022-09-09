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
        child: Consumer(
          builder: (context, ref, child) {
            return ref.watch(favoriteMoviesProvider).when(
                  data: (data) => ListView.builder(
                    itemCount: data.items.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          MovieWidget(movie: data.items[index]),
                          const SizedBox(height: 20),
                        ],
                      );
                    },
                  ),
                  error: (error, stackTrace) => Container(),
                  loading: () => const Loader(),
                );
          },
        ),
      ),
    );
  }
}
