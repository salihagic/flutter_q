import 'package:flutter_q/_all.dart';

class BackArrow extends StatelessWidget {
  const BackArrow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.navigator.pop(),
      icon: const Icon(
        AppIcons.arrow_back,
        size: 10,
        color: Color(0xFFE4ECEF),
      ),
    );
  }
}
