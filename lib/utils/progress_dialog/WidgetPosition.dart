import 'package:flutter/material.dart';

import 'ShowingWidget.dart';

class WidgetPosition {
  bool _isVisible = false;
  late OverlayEntry overlayEntry;

  void show({
    required BuildContext context,
    required WidgetBuilder externalBuilder,
    required bool isToast,
    Duration duration = const Duration(seconds: 2),
  }) async {
    if (_isVisible) {
      return;
    }

    _isVisible = true;

    OverlayState? overlayState = Overlay.of(context);

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) => ShowingWidget(
        widget: externalBuilder(context),
        isToast: isToast,
      ),
    );
    overlayState?.insert(overlayEntry);
  }

  hide() {
    if (_isVisible) {
      overlayEntry.remove();
      _isVisible = false;
    }
  }
}
