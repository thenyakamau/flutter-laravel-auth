import 'package:flutter/material.dart';

import '../../../core/utils/Constants.dart';

class AddProductPage extends StatelessWidget {
  const AddProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Product Name",
                    labelStyle: kLabelStyle,
                    // errorText: widget.state.title == "email"
                    //     ? widget.state.message
                    //     : null,
                    hintText: "Enter product name",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.account_box),
                  ),
                  onChanged: (value) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    labelText: "Product Name",
                    labelStyle: kLabelStyle,
                    // errorText: widget.state.title == "email"
                    //     ? widget.state.message
                    //     : null,
                    hintText: "Enter product name",
                    hintStyle: kHintTextStyle,
                    prefixIcon: Icon(Icons.account_box),
                  ),
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
