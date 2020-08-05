import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_auth/core/utils/Constants.dart';

import '../../../injection_container.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../widgets/auth_widgets/auth_widgets.dart';
import '../widgets/loading_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  AuthBloc authBloc;
  @override
  void initState() {
    super.initState();
    authBloc = sl<AuthBloc>();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: BlocProvider<AuthBloc>(
                create: (context) => authBloc,
                child: BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    if (state is AuthInitial) {
                      return RegisterBody(state: state, authBloc: authBloc);
                    } else if (state is AuthLoadedState) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) =>
                            Navigator.of(context).pushReplacementNamed('/home'),
                      );
                      return Container(color: Colors.white);
                    } else if (state is AuthErrorState) {
                      return RegisterBody(state: state, authBloc: authBloc);
                    } else if (state is AuthLoadingState) {
                      return LoadingWidget(height: height);
                    } else if (state is AuthCreateShopState) {
                      return Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            alignment: Alignment.center,
                            child: Text(
                              'Create Shop',
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
                                      labelText: "Shop Name",
                                      labelStyle: kLabelStyle,
                                      // errorText: widget.state.title == "name"
                                      //     ? widget.state.message
                                      //     : null,
                                      hintText: "Enter shop name",
                                      hintStyle: kHintTextStyle,
                                      prefixIcon: Icon(Icons.account_box),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        // name = value;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      labelText: "Shop Address",
                                      labelStyle: kLabelStyle,
                                      // errorText: widget.state.title == "name"
                                      //     ? widget.state.message
                                      //     : null,
                                      hintText: "Enter shop address",
                                      hintStyle: kHintTextStyle,
                                      prefixIcon: Icon(Icons.account_box),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        // name = value;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Row(
                                      children: <Widget>[
                                        // SvgPicture.asset(
                                        //   svgSrc,
                                        //   width: size.width * 0.18,
                                        // ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                              value: true,
                                              items: [
                                                DropdownMenuItem(
                                                  child: Text('Yes'),
                                                  value: true,
                                                ),
                                                DropdownMenuItem(
                                                  child: Text('No'),
                                                  value: false,
                                                )
                                              ],
                                              onChanged: (value) {},
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    } else {
                      return Container(color: Colors.white);
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    authBloc.close();
  }
}
