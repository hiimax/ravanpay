import 'package:flutter/cupertino.dart';

import '../../../../res/import/import.dart';

class OpenOrderHistory extends StatefulWidget {
  const OpenOrderHistory({super.key});

  @override
  State<OpenOrderHistory> createState() => _OpenOrderHistoryState();
}

class _OpenOrderHistoryState extends State<OpenOrderHistory>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int? _selectedIndex = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  void toggleTabs(int? value) {
    setState(() {
      _selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Consumer2<WebsocketProvider, ThemeProvider>(
        builder: (context, web, theme, _) {
          return Container(
            height: 350,
            width: MediaQuery.of(context).size.width,
            color: theme.isDarkTheme ? raveneDarkColor : ravenWhite,
            child: Column(
              children: [
                const YMargin(16),
                SizedBox(
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl(
                    groupValue: _selectedIndex,
                    children: {
                      0: Text(
                        'Open Orders',
                        style: TextStyle(
                          fontSize: 14,
                          color: _selectedIndex == 0
                              ? context.designSystem?.ravenTextColor
                              : context.designSystem?.ravenSecondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      1: Text(
                        'Positions',
                        style: TextStyle(
                          fontSize: 14,
                          color: _selectedIndex == 1
                              ? context.designSystem?.ravenTextColor
                              : context.designSystem?.ravenSecondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      2: Text(
                        'Order History',
                        style: TextStyle(
                          fontSize: 14,
                          color: _selectedIndex == 2
                              ? context.designSystem?.ravenTextColor
                              : context.designSystem?.ravenSecondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    },
                    onValueChanged: toggleTabs,
                  ),
                ),
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        _selectedIndex == 0
                            ? 'No Open Orders'
                            : _selectedIndex == 1
                                ? 'No Positions'
                                : 'No Order History',
                        style: RavenTextStyle.size18.copyWith(
                          color: theme.isDarkTheme ? ravenWhite : ravenBlack,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const YMargin(20),
                      Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Id pulvinar nullam sit imperdiet pulvinar.',
                          textAlign: TextAlign.center,
                          style: RavenTextStyle.size14.copyWith(
                            color: theme.isDarkTheme ? ravenWhite : ravenBlack,
                            fontWeight: FontWeight.w400,
                          )),
                    ],
                  ),
                )),
              ],
            ),
          );
        },
      );
    });
  }
}
