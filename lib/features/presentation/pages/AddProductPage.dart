import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection_container.dart';
import '../bloc/add_products_bloc/addproduct_bloc.dart';
import '../widgets/add_products_wigdet/add_product_wigets.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  AddproductBloc productBloc;
  @override
  void initState() {
    super.initState();
    productBloc = sl<AddproductBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("Add Product"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: BlocProvider<AddproductBloc>(
            create: (context) => productBloc,
            child: BlocBuilder<AddproductBloc, AddproductState>(
              builder: (context, state) {
                if (state is AddproductInitial) {
                  return AddProductBody();
                } else {
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
    productBloc.close();
  }
}
