import 'package:flutter_q/_all.dart';

class AppBottomNavigationBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final int index;

  const AppBottomNavigationBarItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        final navigationController = ref.watch(navigationProvider.notifier);
        final navigationState = ref.watch(navigationProvider);

        final isSelected = navigationState.index == index;
        final color = isSelected ? context.theme.bottomNavigationBarTheme.selectedItemColor : context.theme.bottomNavigationBarTheme.unselectedItemColor;

        return InkWell(
          onTap: () => navigationController.changeIndex(index: index),
          child: Column(
            children: [
              Container(
                height: 3,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                color: isSelected ? context.theme.bottomNavigationBarTheme.selectedItemColor : context.theme.bottomNavigationBarTheme.backgroundColor,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      color: color,
                      size: 20,
                    ),
                    const Gap(15),
                    Text(
                      label,
                      style: TextStyle(
                        color: color,
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
