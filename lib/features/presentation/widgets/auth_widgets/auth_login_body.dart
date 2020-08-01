import 'package:flutter/material.dart';

import '../../../../core/utils/Constants.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../button_widget.dart';
import 'change_auth_screens.dart';
import 'social_buttons.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key key, @required this.state, @required this.authBloc})
      : super(key: key);

  final state, authBloc;

  @override
  _LoginBodyState createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  String email, password;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(vertical: 30),
          alignment: Alignment.center,
          height: 180,
          width: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage('assets/icons/e_commerce.jpg'),
              fit: BoxFit.fill,
            ),
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
                    errorText: widget.state.title == "email"
                        ? widget.state.message
                        : null,
                    hintText: "Enter username",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.account_box),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
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
                    errorText: widget.state.title == "password"
                        ? widget.state.message
                        : null,
                    hintText: "Enter password",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.lock),
                  ),
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomRight,
                child: Text("Forgot Password", style: kLabelStyle),
              ),
              MyCustomButton(
                press: () => widget.authBloc
                    .add(LoginEvent(email: email, password: password)),
                title: 'Log In',
              ),
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
