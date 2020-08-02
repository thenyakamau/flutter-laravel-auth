import 'package:flutter/material.dart';

import '../loading_widget.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: height / 2,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset(
              "assets/icons/e_commerce.jpg",
              fit: BoxFit.fill,
              width: 200,
              height: 200,
            ),
          ),
        ),
        Container(
          height: height / 2,
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          child: LoadingWidget(height: (height * 0.25)),
        )
      ],
    );
  }
}
