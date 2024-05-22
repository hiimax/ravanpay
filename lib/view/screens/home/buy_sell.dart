import 'package:flutter/cupertino.dart';

import '../../../../res/import/import.dart';

class BuySellBottomSheet extends StatefulWidget {
  const BuySellBottomSheet({super.key});

  @override
  State<BuySellBottomSheet> createState() => _BuySellBottomSheetState();
}

class _BuySellBottomSheetState extends State<BuySellBottomSheet>
    with SingleTickerProviderStateMixin {
  int Index = 0;

  int? _selectedIndex = 0;

  bool _isChecked = false;
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController?.addListener(() {
      if (_tabController?.indexIsChanging != true) {
        toggleTabs(_tabController?.index);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  void toggleTabs(int? index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<WebsocketProvider, ThemeProvider>(
      builder: (context, web, theme, _) {
        return SizedBox(
          height: 700,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(children: [
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoSlidingSegmentedControl(
                      groupValue: _selectedIndex,
                      children: {
                        0: Text(
                          'Buy BTC',
                          style: TextStyle(
                            fontSize: 14,
                            color: _selectedIndex == 0
                                ? context.designSystem?.ravenTextColor
                                : context.designSystem?.ravenSecondaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        1: Text(
                          'Sell BTC',
                          style: TextStyle(
                            fontSize: 14,
                            color: _selectedIndex == 1
                                ? context.designSystem?.ravenTextColor
                                : context.designSystem?.ravenSecondaryTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      },
                      onValueChanged: toggleTabs,
                    ),
                  ),
                  const YMargin(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: theme.isDarkTheme
                              ? ravenDarkSelectionColor
                              : greyColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Limit',
                            style: RavenTextStyle.size14.copyWith(
                              color:
                                  theme.isDarkTheme ? ravenWhite : ravenBlack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Market',
                            style: RavenTextStyle.size14.copyWith(
                              color:
                                  theme.isDarkTheme ? ravenWhite : ravenBlack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Stop-Limit',
                            style: RavenTextStyle.size14.copyWith(
                              color:
                                  theme.isDarkTheme ? ravenWhite : ravenBlack,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const YMargin(20),
                  const FormFields(
                      title: 'Price', image: 'assets/images/u_info-circle.png'),
                  const YMargin(20),
                  const FormFields(
                      title: 'Amount',
                      image: 'assets/images/u_info-circle.png'),
                  const YMargin(20),
                  Container(
                      height: 40,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: ravenSecondaryTextColor,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(children: [
                                Text(
                                  'Type',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const XMargin(10),
                                Image.asset('assets/images/u_info-circle.png'),
                              ]),
                              Row(children: [
                                Text(
                                  'Good till cancelled',
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                const XMargin(10),
                                const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: ravenSecondaryTextColor,
                                ),
                              ]),
                            ]),
                      )),
                  const YMargin(20),
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (bool? newValue) {
                        setState(() {
                          _isChecked = newValue ?? false;
                        });
                      },
                    ),
                    const XMargin(5),
                    Text(
                      'Post Only',
                      style: RavenTextStyle.size12.copyWith(
                        color: theme.isDarkTheme
                            ? ravenWhite
                            : ravenSecondaryTextColor,
                      ),
                    ),
                    const XMargin(10),
                    Image.asset('assets/images/u_info-circle.png'),
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: RavenTextStyle.size12.copyWith(
                              color: theme.isDarkTheme
                                  ? ravenWhite
                                  : ravenSecondaryTextColor,
                            ),
                          ),
                          Text(
                            '0.00',
                            style: RavenTextStyle.size12.copyWith(
                              color: theme.isDarkTheme
                                  ? ravenWhite
                                  : ravenSecondaryTextColor,
                            ),
                          ),
                        ]),
                  ),
                  const YMargin(20),
                  Container(
                      height: 32,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        gradient: const LinearGradient(
                          colors: [
                            Color(0xff483BEB),
                            Color(0xffDD568D),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.3, 1.0],
                        ),
                      ),
                      child: Center(
                        child: Text(
                          _selectedIndex != 1 ? 'Buy BTC' : 'Sell BTC',
                          style: RavenTextStyle.size12.copyWith(
                            color: ravenWhite,
                          ),
                        ),
                      )),
                  const YMargin(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total account value',
                            style: RavenTextStyle.size12.copyWith(
                              color: theme.isDarkTheme
                                  ? ravenWhite
                                  : ravenSecondaryTextColor,
                            ),
                          ),
                          Row(children: [
                            Text(
                              'NGN',
                              style: RavenTextStyle.size12.copyWith(
                                color: theme.isDarkTheme
                                    ? ravenWhite
                                    : ravenSecondaryTextColor,
                              ),
                            ),
                            const XMargin(10),
                            const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: ravenSecondaryTextColor,
                            ),
                          ])
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '0.00',
                            style: RavenTextStyle.size12.copyWith(
                              color: theme.isDarkTheme
                                  ? ravenWhite
                                  : ravenSecondaryTextColor,
                            ),
                          ),
                        ]),
                  ),
                  const YMargin(20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Open Orders',
                            style: RavenTextStyle.size12.copyWith(
                              color: theme.isDarkTheme
                                  ? ravenWhite
                                  : ravenSecondaryTextColor,
                            ),
                          ),
                          Text(
                            'Available',
                            style: RavenTextStyle.size12.copyWith(
                              color: theme.isDarkTheme
                                  ? ravenWhite
                                  : ravenSecondaryTextColor,
                            ),
                          ),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '0.00',
                            style: RavenTextStyle.size12.copyWith(
                                color:
                                    theme.isDarkTheme ? ravenWhite : ravenBlack,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '0.00',
                            style: RavenTextStyle.size12.copyWith(
                              color:
                                  theme.isDarkTheme ? ravenWhite : ravenBlack,
                            ),
                          ),
                        ]),
                  ),
                  const YMargin(20),
                  const Row(children: [
                    SizedBox(
                      height: 32,
                      width: 80,
                      child: CustomButton2(
                        title: 'Deposit',
                        buttonColor: ravenFountainblueColor,
                        textColor: ravenWhite,
                        textSize: 14,
                      ),
                    ),
                  ]),
                  const YMargin(20),
                ]);
              },
            ),
          ),
        );
      },
    );
  }
}

class FormFields extends StatelessWidget {
  const FormFields({
    super.key,
    required this.title,
    required this.image,
  });

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 40,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            border: Border.all(
              color: ravenSecondaryTextColor,
            ),
            borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  const XMargin(10),
                  Image.asset(
                    image,
                  ),
                ]),
                const SizedBox(
                  width: 100,
                  child: CustomTextFormField(
                      // textStyle: RavenTextStyle.size16.copyWith(
                      //     fontWeight: FontWeight.w500,
                      //     color: theme.isDarkTheme
                      //         ? ravenWhite
                      //         : ravenBlack,
                      //     ),
                      hintText: '0.00 USD '),
                )
              ]),
        ));
  }
}
