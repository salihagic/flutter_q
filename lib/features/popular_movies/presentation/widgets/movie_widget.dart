import 'package:flutter_q/_all.dart';

class MovieWidget extends StatelessWidget {
  final Movie movie;

  const MovieWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(movie.title);

    // return InkWell(
    //   // onTap: () =>
    //   //     context.navigator.pushNamed(MovieDetailsPage.route, arguments: movie),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       Hero(
    //         tag: 'movie-${movie.id}',
    //         child: CachedImage(
    //             width: context.screenWidth * 0.25,
    //             height: context.screenWidth * 0.25,
    //             url: movie.backdropPath
    //             //.toNetworkImageUrl(services.get<AppSettings>()),
    //             ),
    //       ),
    //       const Gap(20),
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               movie.title.value,
    //               style: const TextStyle(
    //                   fontWeight: FontWeight.w600, fontSize: 15),
    //             ),
    //             const Gap(10),
    //             Rating(movie: movie),
    //             const Gap(10),
    //             MovieGenres(movie: movie),
    //           ],
    //         ),
    //       ),
    //       const Gap(20),
    //       FavoriteIcon(movie: movie),
    //     ],
    //   ),
    // );
  }
}
