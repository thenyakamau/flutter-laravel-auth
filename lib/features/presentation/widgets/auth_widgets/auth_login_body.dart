import 'package:flutter/material.dart';

import '../../../../core/utils/Constants.dart';
import '../button_widget.dart';
import 'change_auth_screens.dart';
import 'social_buttons.dart';

class LoginBody extends StatelessWidget {
  const LoginBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.asset(
            'assets/icons/e_commerce.jpg',
            fit: BoxFit.fill,
            width: 180,
            height: 180,
          ),
        ),
        Container(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Username",
                    labelStyle: kLabelStyle,
                    hintText: "Enter username",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.account_box),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Password",
                    labelStyle: kLabelStyle,
                    hintText: "Enter password",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: Text("Forgot Password", style: kLabelStyle),
              ),
              MyCustomButton(press: null, title: 'Log In'),
              Align(
                alignment: Alignment.center,
                child: Text(
                  '-OR-',
                  style: kLabelStyle,
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Sign in with',
                  style: kLabelStyle,
                ),
              ),
              SocialButtonsRow(),
              ChangeAuthScreen(
                title: "Don't have an account",
                toScreen: 'Sign Up',
                route: '/register',
              )
            ],
          ),
        )
      ],
    );
  }
}
