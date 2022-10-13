import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_q/_all.dart';

class ConnectivityContainer extends StatelessWidget {
  final Widget child;

  const ConnectivityContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, ref, _) {
          final connectivityState =
              ref.watch(connectivityStateNotifierProvider);

          return Column(
            children: [
              if (connectivityState == ConnectivityResult.none) ...{
                Material(
                  color: Colors.transparent,
                  child: Container(
                    color: Colors.red,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text('No internet connection'),
                      ],
                    ),
                  ),
                ),
              },
              Expanded(child: child),
            ],
          );
        },
      ),
    );
  }
}
