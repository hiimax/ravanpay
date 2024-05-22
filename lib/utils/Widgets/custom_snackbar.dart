import '../../res/import/import.dart';

showLoaderDialog(
    BuildContext context, String title, String message, Function() onpressed) {
  showDialog(
    barrierDismissible: true,
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(26.0))),
          content: Container(
              // key: key,
              height: 351,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ravenWhite,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Center(
                child: Column(children: [
                  const SizedBox(
                    height: 27,
                  ),
                  Image.asset(
                    'assets/images/dummy.png',
                    scale: 2,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    height: 36,
                  ),
                  CustomButton(
                    enabled: true,
                    title: 'OK',
                    onPressed: onpressed,
                  )
                ]),
              )),
        ),
      );
    },
  );
}

showInternetLoaderDialog(
    BuildContext context, String title, String message, Function() onpressed) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(26.0))),
          content: Container(
              // key: key,
              height: 351,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: ravenWhite,
                borderRadius: BorderRadius.circular(26),
              ),
              child: Center(
                child: Column(children: [
                  const SizedBox(
                    height: 27,
                  ),
                  const Icon(
                    Icons.signal_wifi_connected_no_internet_4,
                    size: 120,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      )),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                  const SizedBox(
                    height: 36,
                  ),
                  CustomButton(
                    enabled: true,
                    title: 'Retry',
                    onPressed: onpressed,
                  )
                ]),
              )),
        ),
      );
    },
  );
}
