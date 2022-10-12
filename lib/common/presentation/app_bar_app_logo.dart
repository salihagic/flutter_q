import 'package:flutter/material.dart';
import 'package:flutter_q/common/presentation/app_icons.dart';

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
