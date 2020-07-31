import 'package:flutter/material.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({
    Key key,
  }) : super(key: key);

  Widget _buildSocialButton(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(image: logo),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialButton(() => print("Login with facebook"),
              AssetImage('assets/icons/facebook.jpg')),
          _buildSocialButton(() => print("Login with google"),
              AssetImage('assets/icons/google.jpg')),
          _buildSocialButton(() => print("Login with twitter"),
              AssetImage('assets/icons/twitter.jpg'))
        ],
      ),
    );
  }
}
