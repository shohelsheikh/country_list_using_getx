
import 'package:flutter/material.dart';

class ShowingWidget extends StatefulWidget {
  const ShowingWidget({
    Key? key,
    required this.widget,
    required this.isToast,
  }) : super(key: key);

  final Widget widget;
  final bool isToast;

  @override
  _ShowingWidgetState createState() => _ShowingWidgetState();
}

class _ShowingWidgetState extends State<ShowingWidget> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    if (widget.isToast) {
      return Positioned(
        bottom: 25,
        left: 20,
        right: 20,
        child: IgnorePointer(
          child: Material(
            color: Colors.transparent,
            child: Opacity(
              opacity: 1.0,
              child: widget.widget,
            ),
          ),
        ),
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: widget.widget,
      );
    }
  }
}
