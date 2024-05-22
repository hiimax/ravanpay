import '../../res/import/import.dart';

class OnBoardingButton extends StatelessWidget {
  const OnBoardingButton({
    super.key,
    this.onPressed,
    required this.icon,
  });

  final IconData icon;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Icon(
              icon,
              color: ravenWhite,
            ),
          )),
    );
  }
}

class CustomButtonWithIconRight extends StatelessWidget {
  const CustomButtonWithIconRight({
    super.key,
    this.title,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.textSize,
    this.showIcon = false,
    this.icon,
    this.radius,
  });

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final bool? showIcon;
  final double? textSize;
  final BorderRadius? radius;
  final Color? borderColor;
  final Widget? icon;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: radius ?? BorderRadius.circular(28)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title ?? '',
                  style: TextStyle(
                      fontFamily: "Helvetica Neue",
                      fontSize: textSize ?? 18,
                      fontWeight: FontWeight.bold,
                      color: textColor),
                ),
              ),
              // SizedBox(width: ,)
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    icon ?? const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton2 extends StatelessWidget {
  const CustomButton2({
    super.key,
    this.title,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.textSize,
  });

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final double? textSize;
  final Color? borderColor;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  title ?? '',
                  style: RavenTextStyle.size14.copyWith(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      this.title,
      this.loadingState = false,
      this.buttonColor,
      this.textColor,
      this.buttonTextSize,
      this.buttonRadius,
      this.textSize,
      this.enabled = true});

  final VoidCallback? onPressed;
  final double? textSize;
  final String? title;
  final bool enabled;
  final bool loadingState;
  final Color? buttonColor;
  final Color? textColor;
  final double? buttonTextSize;
  final BorderRadius? buttonRadius;

  @override
  Widget build(BuildContext context) {
    final textWidget = Text(
      "$title",
      textAlign: TextAlign.center,
      maxLines: 1,
      // overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontFamily: "Helvetica Neue",
          fontSize: textSize ?? 16,
          fontWeight: FontWeight.w700,
          color: textColor),
    );
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: loadingState
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : TextButton(
              onPressed: enabled ? onPressed : null,
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      enabled ? buttonColor : ravenGrey),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius:
                          buttonRadius ?? BorderRadius.circular(10)))),
              child: textWidget,
            ),
    );
  }
}

class CustomButtonWithIcon extends StatelessWidget {
  const CustomButtonWithIcon({
    super.key,
    this.title,
    this.borderradius,
    this.buttonColor,
    this.textColor,
    this.onPressed,
    this.borderColor,
    this.textSize,
    this.showIcon = false,
    this.icon,
  });

  final String? title;
  final Color? buttonColor;
  final Color? textColor;
  final bool? showIcon;
  final double? textSize;
  final Color? borderColor;
  final Widget? icon;
  final double? borderradius;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: borderradius == null
                ? BorderRadius.circular(10)
                : BorderRadius.circular(borderradius!)),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon ?? const SizedBox.shrink(),
              const SizedBox(
                width: 5,
              ),
              Text(
                title ?? '',
                style: TextStyle(
                  fontFamily: "Helvetica Neue",
                  fontSize: textSize ?? 16,
                  fontWeight: FontWeight.w700,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
