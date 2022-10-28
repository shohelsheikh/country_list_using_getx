import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

typedef OnPress = Function();

class CommonButton extends StatefulWidget {
  final Color backgroundColor;
  final Color fontColor;
  final String title;
  final double? width;
  final double? height;
  final OnPress onPress;
  final EdgeInsetsGeometry? margin;

  const CommonButton(
      {Key? key,
      required this.backgroundColor,
      required this.fontColor,
      required this.title,
      this.width,
      this.height,
      required this.onPress,
      this.margin})
      : super(key: key);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        width: widget.width ?? 60.w,
        height: widget.height ?? 5.h,
        margin: widget.margin ?? EdgeInsets.zero,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
           10.w,
          ),
          color: widget.backgroundColor,
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            fontSize: 15.sp,
            color: widget.fontColor,
          ),
        ),
      ),
    );
  }
}
