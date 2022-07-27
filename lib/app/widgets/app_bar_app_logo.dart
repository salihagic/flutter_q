import 'package:flutter_q/_all.dart';

class AppBarAppLogo extends StatelessWidget {
  const AppBarAppLogo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Icon(
      AppIcons.logo,
      color: Color(0xFFEC9B3E),
    );
  }
}
