import 'package:flutter/material.dart';

import '../../../../core/utils/Constants.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../button_widget.dart';
import 'change_auth_screens.dart';
import 'social_buttons.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key key, @required this.state, @required this.authBloc})
      : super(key: key);

  final state, authBloc;

  @override
  _RegisterBodyState createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  String name, email, phone, password, cPassword;
  @override
  void initState() {
    super.initState();
  }

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
                    errorText: widget.state.title == "name"
                        ? widget.state.message
                        : null,
                    hintText: "Enter name",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.account_box),
                  ),
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
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
                    errorText: widget.state.title == "email"
                        ? widget.state.message
                        : null,
                    hintText: "Enter email",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.email),
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
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Phone",
                    labelStyle: kLabelStyle,
                    errorText: widget.state.title == "number"
                        ? widget.state.message
                        : null,
                    hintText: "Enter Phone number",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.phone),
                  ),
                  onChanged: (value) {
                    setState(() {
                      phone = value;
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
                        : widget.state.title == 'cPassword'
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
                    errorText: widget.state.title == "cPassword"
                        ? widget.state.message
                        : null,
                    hintText: "Enter confirmation password",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.lock),
                  ),
                  onChanged: (value) {
                    setState(() {
                      cPassword = value;
                    });
                  },
                ),
              ),
              MyCustomButton(
                press: () => widget.authBloc.add(
                  RegisterEvent(
                    name: name,
                    email: email,
                    phone: phone,
                    password: password,
                    cPassword: cPassword,
                  ),
                ),
                title: 'Sign Up',
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
