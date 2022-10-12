import 'package:beamer/beamer.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_q/features/home/presentation/home_page.dart';

class BeamerLocations extends BeamLocation<BeamState> {
  BeamerLocations(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<Pattern> get pathPatterns => [
        HomePage.routeName,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      const BeamPage(
        key: ValueKey('home-page'),
        title: 'Home',
        child: HomePage(),
      ),
    ];
  }
}
