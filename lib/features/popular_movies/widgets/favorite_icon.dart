import 'package:flutter_q/_all.dart';

class FavoriteIcon extends ConsumerWidget {
  const FavoriteIcon({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: ref.watch(favoriteMoviesProvider).when(
            data: (data) {
              bool isSelected = data.items.any((x) => x.id == movie.id);

              return Icon(
                isSelected ? AppIcons.bookmark_checked : AppIcons.bookmark_empty,
                color: isSelected ? const Color(0xFFEC9B3E) : const Color(0xFFE4ECEF),
                size: 18,
              );
            },
            error: (error, stackTrace) => Container(),
            loading: () => Container(),
          ),
      onTap: () => ref.read(favoriteMoviesProvider.notifier).toggle(movie),
    );
  }
}
