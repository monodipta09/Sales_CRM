import 'package:flutter/cupertino.dart';

class BottomModalIos extends StatelessWidget {
  final double containerHeight;
  final Widget child;
  const BottomModalIos(
      {super.key, this.containerHeight = double.infinity, required this.child});

  @override
  Widget build(BuildContext context) {
    return CupertinoPopupSurface(
      isSurfacePainted: true,
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
          height: containerHeight,
          child: child,
        ),
      ),
    );
  }
}
