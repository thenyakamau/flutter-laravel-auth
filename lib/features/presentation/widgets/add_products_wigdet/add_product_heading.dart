import 'package:flutter/material.dart';

import '../../../../core/utils/Constants.dart';

class ProductHeadings extends StatelessWidget {
  const ProductHeadings({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          title,
          style: kLabelStyle,
        ),
      ),
    );
  }
}
