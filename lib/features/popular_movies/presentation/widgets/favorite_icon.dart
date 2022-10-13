import 'package:flutter_q/_all.dart';

class FavoriteIcon extends ConsumerWidget {
  final Movie movie;

  const FavoriteIcon({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      child: ref.watch(favoriteMoviesStateNotifierProvider).when(
            initial: () => Container(),
            other: (_) => Container(),
            data: (items) {
              bool isSelected = items.any((x) => x.id == movie.id);

              return Icon(
                isSelected
                    ? AppIcons.bookmark_checked
                    : AppIcons.bookmark_empty,
                color: isSelected
                    ? const Color(0xFFEC9B3E)
                    : const Color(0xFFE4ECEF),
                size: 18,
              );
            },
            error: (_) => Container(),
            loading: () => Container(),
          ),
      onTap: () =>
          ref.read(favoriteMoviesStateNotifierProvider.notifier).toggle(movie),
    );
  }
}
