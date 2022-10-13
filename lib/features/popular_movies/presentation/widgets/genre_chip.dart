import 'package:flutter_q/_all.dart';

class GenreChip extends StatelessWidget {
  final Genre genre;

  const GenreChip({
    Key? key,
    required this.genre,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.only(right: 5, bottom: 5),
      decoration: BoxDecoration(
        color: const Color(0xFFEC9B3E).withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Text(
        genre.name.value,
        style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 11),
      ),
    );
  }
}
