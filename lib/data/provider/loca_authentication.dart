import 'package:raven/res/import/import.dart';

class ThemeProvider with ChangeNotifier {
  bool _isDarkTheme = false;

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  String _selected = 'none';

  String get selected => _selected;

  void setSelected(String value) {
    _selected = value;
    notifyListeners();
  }
}
