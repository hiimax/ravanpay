import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../res/import/import.dart';

class ChartsOrderbookTrades extends StatefulWidget {
  const ChartsOrderbookTrades({super.key});

  @override
  State<ChartsOrderbookTrades> createState() => _ChartsOrderbookTradesState();
}

class _ChartsOrderbookTradesState extends State<ChartsOrderbookTrades>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  int? index = 0;

  // int Index = 0;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  toggleTabs(int? value) {
    switch (value) {
      case 0:
        _tabController?.animateTo(0);
        break;
      case 1:
        _tabController?.animateTo(1);
        break;
      case 2:
        _tabController?.animateTo(2);
        break;
    }
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Consumer2<WebsocketProvider, ThemeProvider>(
        builder: (context, web, theme, _) {
          return Column(
            children: [
              Padding(
                padding: REdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: SizedBox(
                  width: double.infinity,
                  child: CupertinoSlidingSegmentedControl(
                    groupValue: index,
                    children: {
                      0: Text(
                        'Charts',
                        style: TextStyle(
                          fontSize: 14,
                          color: index == 0
                              ? context.designSystem?.ravenTextColor
                              : context.designSystem?.ravenSecondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      1: Text(
                        'Order Book',
                        style: TextStyle(
                          fontSize: 14,
                          color: index == 1
                              ? context.designSystem?.ravenTextColor
                              : context.designSystem?.ravenSecondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      2: Text(
                        'Recent Trades',
                        style: TextStyle(
                          fontSize: 14,
                          color: index == 2
                              ? context.designSystem?.ravenTextColor
                              : context.designSystem?.ravenSecondaryTextColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    },
                    onValueChanged: toggleTabs,
                  ),
                ),
              ),
              if (index == 0)
                Consumer<WebsocketProvider>(
                  builder: (context, web, child) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Time',
                            style: RavenTextStyle.size12.copyWith(
                              color:
                                  theme.isDarkTheme ? ravenWhite : ravenBlack,
                            ),
                          ),
                          Row(
                              children:
                                  List.generate(web.values.length, (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                  onTap: () {
                                    web.value = web.values[index];
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: theme.isDarkTheme &&
                                              web.value != web.values[index]
                                          ? Transparent
                                          : theme.isDarkTheme &&
                                                  web.value == web.values[index]
                                              ? ravenDarkSelectionColor
                                              : !theme.isDarkTheme &&
                                                      web.value ==
                                                          web.values[index]
                                                  ? greyColor
                                                  : Transparent,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(4),
                                      child: Text(
                                        web.values[index]
                                            .toString()
                                            .toUpperCase(),
                                        style: RavenTextStyle.size12.copyWith(
                                          color: theme.isDarkTheme
                                              ? ravenWhite
                                              : ravenBlack,
                                        ),
                                      ),
                                    ),
                                  )),
                            );
                          })),
                          const Icon(Icons.keyboard_arrow_down_outlined),
                          Image.asset('assets/images/Candle Chart 1.png'),
                          Text(
                            'Fx',
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              Expanded(
                child: Padding(
                  padding: REdgeInsets.all(16.0),
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      const Charts(),
                      const OrderBooks(),
                      RecentTrades(),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      );
    });
  }
}
