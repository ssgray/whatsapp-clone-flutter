import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScrollManager extends ChangeNotifier {
  static ScrollController controller = ScrollController();

  void scrollUp() {
    final double start = 0;

    controller.jumpTo(start);
  }
}
