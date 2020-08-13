import 'package:flutter/material.dart';

import '../widgets/add_products_wigdet/add_product_wigets.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({Key key}) : super(key: key);

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
        child: AddProductBody(),
      ),
    );
  }
}
