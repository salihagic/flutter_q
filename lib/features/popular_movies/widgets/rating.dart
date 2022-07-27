import 'package:flutter_q/_all.dart';

class Rating extends StatelessWidget {
  const Rating({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          AppIcons.star,
          color: Color(0xFFF2CF16),
          size: 13,
        ),
        const Gap(5),
        Text(
          '${(movie.voteAverage ?? 0).toString()} / 10 IMDb',
          style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
        ),
      ],
    );
  }
}
