import 'package:intl/intl.dart';

import '../../../../res/import/import.dart';

class Charts extends StatefulWidget {
  const Charts({super.key});

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  void initState() {
    Future.delayed(Duration.zero).then((value) {
      final web = Provider.of<WebsocketProvider>(context, listen: false);
      web.fetchCandles();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<WebsocketProvider, ThemeProvider>(
      builder: (context, web, theme, _) {
        return Stack(
          children: [
            Candlesticks(
              candles: web.candles,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/arrowLine.png'),
                  const XMargin(10),
                  Text(
                    'BTC/USD',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const XMargin(20),
                  Customtext(
                    title: 'O ',
                    titlestyle: Theme.of(context).textTheme.subtitle1,
                    subtextstyle: Theme.of(context).textTheme.subtitle2,
                    subtext: NumberFormat('###0.00')
                        .format(double.parse(web.open ?? '00.00')),
                  ),
                  const XMargin(5),
                  Customtext(
                    title: 'H ',
                    titlestyle: Theme.of(context).textTheme.subtitle1,
                    subtextstyle: Theme.of(context).textTheme.subtitle2,
                    subtext: NumberFormat('###0.00')
                        .format(double.parse(web.high ?? '00.00')),
                  ),
                  const XMargin(5),
                  Customtext(
                    title: 'L ',
                    titlestyle: Theme.of(context).textTheme.subtitle1,
                    subtextstyle: Theme.of(context).textTheme.subtitle2,
                    subtext: NumberFormat('###0.00')
                        .format(double.parse(web.low ?? '00.00')),
                  ),
                  const XMargin(5),
                  Customtext(
                    title: 'C ',
                    titlestyle: Theme.of(context).textTheme.subtitle1,
                    subtextstyle: Theme.of(context).textTheme.subtitle2,
                    subtext: NumberFormat('###0.00')
                        .format(double.parse(web.change ?? '00.00')),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 390),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Customtext(
                    title: 'Vol(BTC): ',
                    titlestyle: Theme.of(context).textTheme.subtitle1,
                    subtextstyle: Theme.of(context).textTheme.headline4,
                    subtext: NumberFormat('###0.00')
                        .format(double.parse(web.volB ?? '00.00')),
                  ),
                  const XMargin(20),
                  Customtext(
                    title: 'Vol(USDT): ',
                    titlestyle: Theme.of(context).textTheme.subtitle1,
                    subtextstyle: Theme.of(context).textTheme.headline4,
                    subtext: NumberFormat('###0.00')
                        .format(double.parse(web.volU ?? '00.00')),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

Customtext({
  required String title,
  required String subtext,
  required TextStyle? titlestyle,
  required TextStyle? subtextstyle,
}) {
  return RichText(
    text: TextSpan(
      children: [
        TextSpan(
          text: title,
          style: titlestyle,
        ),
        TextSpan(
          text: subtext,
          style: subtextstyle,
        ),
      ],
    ),
  );
}
