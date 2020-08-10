import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../bloc/home_bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc homeBloc;
  @override
  void initState() {
    super.initState();
    homeBloc = sl<HomeBloc>();
    homeBloc.add(GetDashBoardDetailsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text("Title"),
      ),
      body: SingleChildScrollView(
        child: BlocProvider<HomeBloc>(
          create: (context) => homeBloc,
          child: Container(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Navigator.of(context).pushNamed('/add_product'),
        label: Text("Add Product"),
        icon: Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    homeBloc.close();
  }
}
