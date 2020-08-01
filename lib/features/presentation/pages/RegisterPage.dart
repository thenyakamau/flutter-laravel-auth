import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
