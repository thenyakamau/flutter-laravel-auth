import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../bloc/auth_bloc/auth_bloc.dart';
import '../widgets/loading_widget.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AuthBloc authBloc;
  @override
  void initState() {
    super.initState();
    authBloc = sl<AuthBloc>();
    authBloc.add(RefreshTokenEvent());
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider<AuthBloc>(
            create: (_) => authBloc,
            child: BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthInitial) {
                  return Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "assets/icons/e_commerce.jpg",
                          fit: BoxFit.fill,
                          width: 180,
                          height: 180,
                        ),
                      ),
                      LoadingWidget(height: (height * 0.25))
                    ],
                  );
                } else if (state is UnAuthenticatedState) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => Navigator.of(context).pushReplacementNamed('/login'),
                  );
                  return Container(color: Colors.white);
                } else if (state is AuthLoadedState) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => Navigator.of(context).pushReplacementNamed('/home'),
                  );
                  return Container(color: Colors.white);
                } else {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => Navigator.of(context).pushReplacementNamed('/home'),
                  );
                  return Container(color: Colors.white);
                }
              },
            )),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    authBloc.close();
  }
}
