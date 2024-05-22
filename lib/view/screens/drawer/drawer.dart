import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../res/import/import.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Transparent,
        child: StatefulBuilder(builder: (context, setState) {
          return Consumer<ThemeProvider>(
            builder: (context, theme, child) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:
                      theme.isDarkTheme ? ravenDarkBackgroundColor : ravenWhite,
                ),
                child: Padding(
                  padding: REdgeInsets.all(4),
                  child: Column(
                    children: [
                      const YMargin(10),
                      const CustomTextFormField(
                        hintText: 'Search',
                        focusedBorderColor: ravenSecondaryTextColor,
                        errorBorderColor: ravenSecondaryTextColor,
                        enabledBorderColor: ravenSecondaryTextColor,
                        suffixIcon: Icon(
                          Icons.search,
                          color: ravenFountainblueColor,
                        ),
                      ),
                      Menus(
                        onTap: () {
                          theme.setSelected('Exchange');
                        },
                        title: 'Home',
                        bodyColor: theme.isDarkTheme &&
                                theme.selected == 'Exchange'
                            ? ravenWhite
                            : theme.isDarkTheme && theme.selected != 'Exchange'
                                ? ravenDarkBackgroundColor
                                : !theme.isDarkTheme &&
                                        theme.selected == 'Exchange'
                                    ? ravenGrey
                                    : ravenWhite,
                        textColor: theme.isDarkTheme ? ravenWhite : ravenBlack,
                      ),
                      Menus(
                        onTap: () {
                          theme.setSelected('Wallet');
                        },
                        title: 'Wallet',
                        bodyColor: theme.isDarkTheme &&
                                theme.selected == 'Wallet'
                            ? ravenWhite
                            : theme.isDarkTheme && theme.selected != 'Wallet'
                                ? ravenDarkBackgroundColor
                                : !theme.isDarkTheme &&
                                        theme.selected == 'Wallet'
                                    ? ravenGrey
                                    : ravenWhite,
                        textColor: theme.isDarkTheme ? ravenWhite : ravenBlack,
                      ),
                      Menus(
                        onTap: () {
                          theme.setSelected('Roqque Hub');
                        },
                        title: 'Settings',
                        bodyColor:
                            theme.isDarkTheme && theme.selected == 'Roqque Hub'
                                ? ravenWhite
                                : theme.isDarkTheme &&
                                        theme.selected != 'Roqque Hub'
                                    ? ravenDarkBackgroundColor
                                    : !theme.isDarkTheme &&
                                            theme.selected == 'Roqque Hub'
                                        ? ravenGrey
                                        : ravenWhite,
                        textColor: theme.isDarkTheme ? ravenWhite : ravenBlack,
                      ),
                      Menus(
                        onTap: () {
                          theme.setSelected('Log out');
                        },
                        title: 'Log out',
                        bodyColor: theme.isDarkTheme &&
                                theme.selected == 'Log out'
                            ? ravenWhite
                            : theme.isDarkTheme && theme.selected != 'Log out'
                                ? ravenDarkBackgroundColor
                                : !theme.isDarkTheme &&
                                        theme.selected == 'Log out'
                                    ? ravenGrey
                                    : ravenWhite,
                        textColor: theme.isDarkTheme ? ravenWhite : ravenBlack,
                      ),
                      Menus(
                          onTap: () {
                            theme.toggleTheme();
                          },
                          title: theme.isDarkTheme == true
                              ? 'Light Theme'
                              : 'Dark Theme',
                          bodyColor: theme.isDarkTheme
                              ? ravenDarkBackgroundColor
                              : ravenWhite,
                          textColor:
                              theme.isDarkTheme ? ravenWhite : ravenBlack)
                    ],
                  ),
                ),
              );
            },
          );
        }));
  }
}

class Menus extends StatelessWidget {
  const Menus({
    super.key,
    required this.onTap,
    required this.title,
    required this.bodyColor,
    required this.textColor,
  });
  final Function() onTap;
  final String title;
  final Color bodyColor;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: bodyColor,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Text(
                  title,
                  style: RavenTextStyle.size12.copyWith(color: textColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
