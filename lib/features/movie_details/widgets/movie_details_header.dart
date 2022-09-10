import 'package:flutter_q/_all.dart';

class MovieDetailsHeader extends StatelessWidget {
  const MovieDetailsHeader({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            movie.title.value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ),
        const Gap(20),
        FavoriteIcon(movie: movie),
      ],
    );
  }
}
