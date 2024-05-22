import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../res/import/import.dart';

final navigatorKey = GlobalKey<NavigatorState>();
var logger = Logger();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 1201),
      child: MultiProvider(
        providers: providers,
        child: Consumer<ThemeProvider>(
          builder: (context, provider, child) {
            return MaterialApp(
              builder: (BuildContext context, Widget? widget) {
                ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
                  return CustomError(errorDetails: errorDetails);
                };
                return widget!;
              },
              debugShowCheckedModeBanner: false,
              title: AppName,
              theme: provider.isDarkTheme
                  ? ThemeHelper.darkTheme
                  : ThemeHelper.lightTheme,
              initialRoute: '/',
              navigatorKey: navigatorKey,
              home: Builder(builder: (context) {
                SizeConfig.init(context);
                return const SplashScreen();
              }),
            );
          },
        ),
      ),
    );
  }
}
