import 'package:flutter_q/_all.dart';

class BackArrow extends ConsumerWidget {
  const BackArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      onPressed: () => ref.pop(),
      icon: const Icon(
        AppIcons.arrow_back,
        size: 10,
        color: Color(0xFFE4ECEF),
      ),
    );
  }
}
