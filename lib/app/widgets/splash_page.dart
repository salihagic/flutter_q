import 'package:flutter_q/_all.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Center(
          child: Image.asset(AppAssets.images_splash_png, fit: BoxFit.fill),
        ),
      ),
    );
  }
}
