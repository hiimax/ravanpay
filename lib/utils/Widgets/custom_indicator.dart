import '../../res/import/import.dart';

class AppBarNavigation extends StatelessWidget {
  String title;
  String subtitle;
  Color? color;
  AppBarNavigation(
      {super.key, required this.title, required this.subtitle, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back)),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,

                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 11,
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class AppBarNavigation1 extends StatelessWidget {
  String title;
  String subtitle;
  Color? color;
  AppBarNavigation1(
      {super.key, required this.title, required this.subtitle, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,

                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 11,
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: color ,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

class AppBarNavigationWithoutPop extends StatelessWidget {
  String title;
  Widget? widget;
  AppBarNavigationWithoutPop({super.key, required this.title, this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            widget ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
