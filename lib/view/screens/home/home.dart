import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../../res/import/import.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, theme, child) {
        return Scaffold(
          appBar: CustomAppbar(
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const XMargin(15),
                  Image.asset(theme.isDarkTheme
                      ? 'assets/images/darkLogomark.png'
                      : 'assets/images/Logomark.png'),
                  const XMargin(10),
                  Image.asset(
                    'assets/images/Logotype.png',
                    color: theme.isDarkTheme ? ravenWhite : ravenBlack,
                  ), // Add Spacer widget
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 15,
                    backgroundColor:
                        theme.isDarkTheme ? raveneDarkColor : ravenWhite,
                    child: Image.asset(
                      'assets/images/81.png',
                    ),
                  ),
                  const XMargin(10),
                  Image.asset('assets/images/Line.png'),
                  const XMargin(10),
                  Builder(builder: (ctx) {
                    return InkWell(
                      onTap: () {
                        Scaffold.of(ctx).openEndDrawer();
                      },
                      child: Image.asset('assets/images/menu-alt-1.png'),
                    );
                  }),
                  const XMargin(15),
                ],
              )
            ],
          ),
          body: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                const YMargin(8),
                Consumer2<WebsocketProvider, ThemeProvider>(
                  builder: (context, web, theme, _) {
                    return Container(
                      height: 150,
                      padding: const EdgeInsets.all(16),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: context.designSystem?.containerBg,
                        border: Border.all(
                          width: 1,
                          color: context.designSystem?.cardStrokeColor ??
                              Colors.transparent,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset('assets/images/Group 237550.png'),
                              const XMargin(10),
                              Text(
                                'BTC/USDT',
                                style: RavenTextStyle.size18.copyWith(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const XMargin(20),
                              const Icon(Icons.keyboard_arrow_down_outlined),
                              const XMargin(27),
                              Text(
                                '\$${NumberFormat('#,##0').format(double.parse(web.open ?? '00'))}',
                                style: RavenTextStyle.size18.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: web.open?.contains('-') ?? false
                                      ? ravenSellColor
                                      : ravenBuyColor,
                                ),
                              ),
                            ],
                          ),
                          const YMargin(16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                flex: 3,
                                child: ChangeParams(
                                  value:
                                      '${NumberFormat('###.00').format(double.parse(web.change ?? '00'))} ${decimalValue(web.change ?? '00.00')}',
                                  change: '24h change',
                                  icon: Icons.access_time,
                                  valueColor: web.change?.contains('-') ?? false
                                      ? ravenSellColor
                                      : ravenBuyColor,
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 48.sp,
                                  child: VerticalDivider(
                                    color: context
                                        .designSystem?.ravenSecondaryTextColor
                                        ?.withOpacity(0.3),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: ChangeParams(
                                  value:
                                      '${NumberFormat('###.00').format(double.parse(web.high ?? '00'))} ${decimalValue(web.high ?? '00.00')}',
                                  change: '24h high',
                                  icon: Icons.arrow_upward_outlined,
                                  valueColor: web.high?.contains('-') ?? false
                                      ? ravenSellColor
                                      : ravenBuyColor,
                                ),
                              ),
                              Flexible(
                                child: SizedBox(
                                  height: 48.sp,
                                  child: VerticalDivider(
                                    color: context
                                        .designSystem?.ravenSecondaryTextColor
                                        ?.withOpacity(0.3),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 3,
                                child: ChangeParams(
                                  value:
                                      '${NumberFormat('###.00').format(double.parse(web.low ?? '00'))} ${decimalValue(web.low ?? '00.00')}',
                                  change: '24h low',
                                  icon: Icons.arrow_downward_outlined,
                                  valueColor: web.low?.contains('-') ?? false
                                      ? ravenSellColor
                                      : ravenBuyColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const YMargin(8),
                // const YMargin(10),
                Container(
                    height: 1000,
                    decoration: BoxDecoration(
                      color: context.designSystem?.containerBg,
                      border: Border.all(
                        width: 1,
                        color: context.designSystem?.cardStrokeColor ??
                            Colors.transparent,
                      ),
                    ),
                    child: const ChartsOrderbookTrades()),
                // const YMargin(10),
                // SizedBox(height: 550.h, child: const OpenOrderHistory()),
              ],
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            height: 64,
            color: context.designSystem?.ravenBackgroundColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: 32,
                  child: CustomButton2(
                    buttonColor: ravenBuyColor,
                    borderColor: ravenBuyColor,
                    textColor: ravenWhite,
                    title: 'Buy',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const BuySellBottomSheet();
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2.3,
                  height: 32,
                  child: CustomButton2(
                    buttonColor: ravenSellColor,
                    borderColor: ravenSellColor,
                    textColor: ravenWhite,
                    title: 'Sell',
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        builder: (BuildContext context) {
                          return const BuySellBottomSheet();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          endDrawer: Container(
            height: 290,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: theme.isDarkTheme ? raveneDarkColor : ravenWhite,
            ),
            child: const SideMenu(),
          ),
        );
      },
    );
  }
}

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        YMargin(3),
      ],
    );
  }
}

class ChangeParams extends StatelessWidget {
  const ChangeParams({
    super.key,
    required this.change,
    required this.value,
    required this.icon,
    required this.valueColor,
  });

  final String change;
  final String value;
  final IconData icon;
  final Color valueColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(icon,
                size: 16, color: context.designSystem?.ravenSecondaryTextColor),
            const XMargin(5),
            Text(
              change,
              style: RavenTextStyle.size12.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const YMargin(8),
        Text(
          value,
          style: RavenTextStyle.size12.copyWith(
            fontWeight: FontWeight.w500,
            color: valueColor,
          ),
        ),
        const XMargin(10),
      ],
    );
  }
}
