import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../widgets/auth_widgets/auth_widgets.dart';
import '../widgets/loading_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      return LoginBody(state: state, authBloc: authBloc);
                    } else if (state is AuthLoadedState) {
                      WidgetsBinding.instance.addPostFrameCallback(
                        (_) =>
                            Navigator.of(context).pushReplacementNamed('/home'),
                      );
                      return Container(color: Colors.white);
                    } else if (state is AuthErrorState) {
                      return LoginBody(state: state, authBloc: authBloc);
                    } else if (state is AuthLoadingState) {
                      return LoadingWidget(height: height);
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
