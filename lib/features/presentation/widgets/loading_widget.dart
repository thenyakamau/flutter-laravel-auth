import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double height;
  const LoadingWidget({Key key, @required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
