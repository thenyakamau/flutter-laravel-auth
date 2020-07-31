import 'package:flutter/material.dart';

class ChangeAuthScreen extends StatelessWidget {
  final String title, toScreen, route;

  const ChangeAuthScreen({
    Key key,
    @required this.title,
    @required this.toScreen,
    @required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacementNamed(route),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
          text: title,
          style: TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.w400),
        ),
        TextSpan(
          text: '  $toScreen',
          style: TextStyle(
              color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold),
        )
      ])),
    );
  }
}
