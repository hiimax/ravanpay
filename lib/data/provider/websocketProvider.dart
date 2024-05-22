import 'package:http/http.dart' as http;
import 'package:raven/res/import/import.dart';
import 'package:web_socket_channel/io.dart';

class WebsocketProvider with ChangeNotifier {
  List<Candle> candles = [];
  String? _high;
  String? _low;
  String? _change;
  String? _open;
  String? _volB;
  String? _volU;
  String? value = '1h';

  String? get high => _high;
  String? get low => _low;
  String? get change => _change;
  String? get open => _open;
  String? get volB => _volB;
  String? get volU => _volU;

  Future<List<Candle>> fetchCandles() async {
    final channel = IOWebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@kline_1h'),
    );
    final completer = Completer<List<Candle>>();
    channel.stream.listen((message) {
      Future<List<Candle>> fetchCandles() async {
        final uri = Uri.parse(
            "https://api.binance.com/api/v3/klines?symbol=BTCUSDT&interval=$value");
        final res = await http.get(uri);
        ChartModel chartModel = ChartModel.fromJson(jsonDecode(message));
        _high = chartModel.k!.h;
        _low = chartModel.k!.l;
        _change = chartModel.k!.c;
        _open = chartModel.k!.o;
        _volB = chartModel.k!.v;
        _volU = chartModel.k!.V;

        notifyListeners();
        return (jsonDecode(res.body) as List<dynamic>)
            .map((e) => Candle.fromJson(e))
            .toList()
            .reversed
            .toList();
      }

      fetchCandles().then((value) {
        candles = value;
        notifyListeners();
      });
    }, onError: (error) {
      completer.completeError(error);
    });

    // Wait for the future to complete and return the result
    return completer.future;
  }

  final List _values = [
    '1h',
    '2h',
    '4h',
    '1d',
    '1w',
    '1M',
  ];

  List get values => _values;
}

enum LoadingState { loading, loaded, error }

class OrderBookProvider with ChangeNotifier {
  PartialBookDepth? _partialBookDepth;
  LoadingState _loadingState = LoadingState.loading;

  PartialBookDepth? get partialBookDepth => _partialBookDepth;
  LoadingState get loadingState => _loadingState;
  bool get isLoading => _loadingState == LoadingState.loading;
  fetchOrderBook() {
    print('object');
    final channel = IOWebSocketChannel.connect(
      Uri.parse('wss://stream.binance.com:9443/ws/btcusdt@depth5'),
    );
    final completer = Completer<PartialBookDepth>();
    channel.stream.listen((message) {
      final data = jsonDecode(message);
      _partialBookDepth = PartialBookDepth.fromJson(data);
      _loadingState = LoadingState.loaded;
      print(_partialBookDepth!.asks!.length);
      // completer.complete(_partialBookDepth);
      notifyListeners();
    }, onError: (error) {
      print(error);
      _loadingState = LoadingState.error;
      completer.completeError(error);
      notifyListeners();
    });
  }
}
