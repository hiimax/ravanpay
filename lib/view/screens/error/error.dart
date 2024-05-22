import 'package:raven/res/import/import.dart';

class CustomError extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const CustomError({
    super.key,
    required this.errorDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/dummy.png',
              scale: 1.5,
            ),
            const SizedBox(height: 30),

            const Text(
              'Oopse! ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
            const SizedBox(height: 10),
            const Text(
              ' Something went wrong!',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
            const SizedBox(height: 10),
            Text(
              kDebugMode
                  ? errorDetails.summary.toString()
                  : 'Oups! Something went wrong!',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: kDebugMode ? Colors.red : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 21),
            ),
            const SizedBox(height: 12),
            // const Text(
            //   kDebugMode
            //       ? 'https://docs.flutter.dev/testing/errors'
            //       : "We encountered an error and we've notified our engineering team about it. Sorry for the inconvenience caused.",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(color: Colors.black, fontSize: 14),
            // ),
          ],
        ),
      ),
    );
  }
}
