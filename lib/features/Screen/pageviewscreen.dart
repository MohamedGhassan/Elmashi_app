import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ealmashi/features/Screen/onborder/onborder1.dart';
import 'package:ealmashi/features/Screen/onborder/onborder3.dart';

import 'onborder/onborder2.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int _currentIndex = 0;
  late PageController controller;

  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int num1;

    return PageView(
      onPageChanged: (val) {
        setState(() {
          _currentIndex = val;
        });
      },

      /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      scrollDirection: Axis.horizontal,
      controller: controller,
      children: <Widget>[
        OnBorder1(_currentIndex),
        OnBorder2(_currentIndex),
        OnBorder3(_currentIndex),
      ],
    );
  }
}
