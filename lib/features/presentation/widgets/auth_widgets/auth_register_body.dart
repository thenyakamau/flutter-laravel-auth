import 'package:flutter/material.dart';

import '../../../../core/utils/Constants.dart';
import '../button_widget.dart';
import 'change_auth_screens.dart';
import 'social_buttons.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          alignment: Alignment.center,
          child: Text(
            "Sign Up",
            style: kHeadingTextStyle,
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
                    labelText: "Name",
                    labelStyle: kLabelStyle,
                    hintText: "Enter name",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.account_box),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Email",
                    labelStyle: kLabelStyle,
                    hintText: "Enter email",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.email),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Phone",
                    labelStyle: kLabelStyle,
                    hintText: "Enter Phone number",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.phone),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Confirm Password",
                    labelStyle: kLabelStyle,
                    hintText: "Enter confirmation password",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.lock),
                  ),
                ),
              ),
              MyCustomButton(press: null, title: 'Sign Up'),
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
                  'Sign up with',
                  style: kLabelStyle,
                ),
              ),
              SocialButtonsRow(),
              ChangeAuthScreen(
                title: "Already have an account",
                toScreen: 'Sign in',
                route: '/login',
              )
            ],
          ),
        )
      ],
    );
  }
}
