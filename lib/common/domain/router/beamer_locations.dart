import 'package:beamer/beamer.dart';
import 'package:flutter_q/_all.dart';

class BeamerLocations extends BeamLocation<BeamState> {
  BeamerLocations(RouteInformation routeInformation) : super(routeInformation);

  @override
  List<Pattern> get pathPatterns => [
        HomePage.routeName,
        MovieDetailsPage.routeName,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    final int? id = state.routeState as int?;

    return [
      const BeamPage(
        key: ValueKey('home-page'),
        title: 'Home',
        child: HomePage(),
      ),
      if (state.uri.path.contains(MovieDetailsPage.routeName) && id.hasValue)
        BeamPage(
          key: const ValueKey('movie-details'),
          title: 'Movie Details',
          child: MovieDetailsPage(id: id.value),
        ),
    ];
  }
}
