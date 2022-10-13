import 'package:flutter_q/_all.dart';

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.theme.bottomNavigationBarTheme.backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: AppBottomNavigationBarItem(
              icon: AppIcons.movies_tab,
              label: S.current.movies,
              index: 0,
            ),
          ),
          Expanded(
            child: AppBottomNavigationBarItem(
              icon: AppIcons.favorites_tab,
              label: S.current.favorites,
              index: 1,
            ),
          ),
        ],
      ),
    );
  }
}
