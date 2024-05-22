import 'package:intl/intl.dart';

import '../../../../res/import/import.dart';

class OrderBooks extends StatelessWidget {
  const OrderBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<WebsocketProvider, ThemeProvider>(
      builder: (context, web, theme, _) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32, 
                        color: theme.isDarkTheme
                            ? ravenDarkSelectionColor
                            : greyColor,
                        child: Center(
                          child: Image.asset('assets/images/Frame 980.png'),
                        ),
                      ),
                      const XMargin(10),
                      Container(
                        height: 32,
                        width: 32,
                        color: Transparent,
                        child: Center(
                          child: Image.asset('assets/images/Frame 979.png'),
                        ),
                      ),
                      const XMargin(10),
                      Container(
                        height: 32,
                        width: 32,
                        color: Transparent,
                        child: Center(
                          child: Image.asset('assets/images/Frame 978.png'),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 32,
                    width: 64,
                    color:
                        theme.isDarkTheme ? ravenDarkSelectionColor : greyColor,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '10',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                          const Icon(Icons.keyboard_arrow_down_rounded),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Amount',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Total',
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Consumer<OrderBookProvider>(builder: (context, orderBook, child) {
              return Column(
                children: [
                  orderBook.isLoading
                      ? const CircularProgressIndicator()
                      : OrderBookDepth(
                          isBid: true,
                          orderBook: orderBook.partialBookDepth?.asks ?? []),
                ],
              );
            }),
            const YMargin(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  NumberFormat('###.00').format(double.parse(web.open ?? '00')),
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const XMargin(10),
                const Icon(
                  Icons.arrow_upward_outlined,
                  color: ravenBuyColor,
                  size: 20,
                ),
                const XMargin(10),
                Text(
                  NumberFormat('###.00').format(double.parse(web.low ?? '00')),
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.headline2,
                ),
              ],
            ),
            const YMargin(20),
            Consumer<OrderBookProvider>(builder: (context, orderBook, child) {
              return Column(
                children: [
                  orderBook.isLoading
                      ? const CircularProgressIndicator()
                      : OrderBookDepth(
                          isBid: false,
                          orderBook: orderBook.partialBookDepth?.bids ?? []),
                ],
              );
            }),
            const OpenOrderHistory(),
          ],
        );
      },
    );
  }
}

class OrderBookDepth extends StatefulWidget {
  const OrderBookDepth({
    super.key,
    required this.orderBook,
    required this.isBid,
  });

  final List<List<String>>? orderBook;
  final bool isBid;

  @override
  State<OrderBookDepth> createState() => _OrderBookDepthState();
}

class _OrderBookDepthState extends State<OrderBookDepth> {
  List<int> randomVolumes = List.generate(5, (index) => Random().nextInt(100));

  @override
  void initState() {
    randomizeVolumes();
    super.initState();
  }

  void randomizeVolumes() {
    if (mounted) {
      setState(() {
        randomVolumes = List.generate(5, (index) => Random().nextInt(50));
      });
      Future.delayed(
        const Duration(
          seconds: 1,
        ),
        () {
          randomizeVolumes();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 20,
            child: Row(
              children: [
                const Spacer(
                  flex: 2,
                ),
                Flexible(
                  flex: 100 - randomVolumes[index],
                  child: Container(),
                ),
                Flexible(
                  flex: randomVolumes[index],
                  child: Container(
                    color: (!widget.isBid
                            ? context.designSystem?.ravenBuyColor
                            : context.designSystem?.ravenVoltColor)
                        ?.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.orderBook?[index][0] ?? '',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                widget.orderBook?[index][1] ?? '',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.headline6,
              ),
              Text(
                widget.orderBook?[index][1] ?? '',
                textAlign: TextAlign.end,
                style: Theme.of(context).textTheme.headline6,
              ),
            ],
          ),
        ],
      ),
      separatorBuilder: (context, index) => const YMargin(4),
      itemCount: widget.orderBook?.length ?? 0,
      shrinkWrap: true,
    );
  }
}
