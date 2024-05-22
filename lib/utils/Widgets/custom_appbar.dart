import '../../../res/import/import.dart';



class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar(
      {super.key,
        this.actions = const [],
        this.isTransparent = false,
        this.leading,
        this.title,
        this.callback,
        this.subtitle,
        this.bottom,
        this.automaticallyImplyLeading = false});

  final List<Widget> actions;
  final Widget? leading;
  final String? title;
  final VoidCallback? callback;
  final String? subtitle;
  final bool? isTransparent;
  final bool automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;

  @override
  _CustomAppbarState createState() => _CustomAppbarState();
  @override
  Size get preferredSize => const Size.fromHeight(90);
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        centerTitle: true,
        bottom: widget.bottom,
        leadingWidth: 100,
        leading: widget.automaticallyImplyLeading
            ?  Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 24),
            child: GestureDetector(
                onTap: widget.callback?? () {
                  Navigator.pop(context);
                },
                child: Image.asset('backbutton')),
          ),
        )
            : null,
        automaticallyImplyLeading: widget.automaticallyImplyLeading,
        title: const Padding(
          padding: EdgeInsets.only(top: 28.0),
          child: Text(
            "",
          ),
        ),
        // centerTitle: true,
        actions: [
          ...widget.actions,
        ]);
  }
}
