import 'package:flutter/material.dart';

import '../../../../core/utils/Constants.dart';
import '../../../domain/entities/CustomColors.dart';
import '../../bloc/add_products_bloc/addproduct_bloc.dart';
import '../button_widget.dart';
import 'add_product_color_view.dart';
import 'add_product_heading.dart';
import 'add_product_tag_view.dart';

class AddProductBody extends StatefulWidget {
  const AddProductBody({
    Key key,
    @required this.productBloc,
    @required this.productSelections,
  }) : super(key: key);

  final AddproductBloc productBloc;
  final List productSelections;

  @override
  _AddProductBodyState createState() => _AddProductBodyState();
}

class _AddProductBodyState extends State<AddProductBody>
    with AutomaticKeepAliveClientMixin {
  List<String> productTags = [];
  List<CustomColors> colorsList = [];
  bool colorsOption = false;
  final tagEditingController = TextEditingController();
  List selectionOptions;
  @override
  void initState() {
    super.initState();

    if (widget.productSelections.isNotEmpty) {
      selectionOptions = widget.productSelections;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ProductHeadings(title: "Add General"),
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
                    enableInteractiveSelection: false,
                    onTap: () {
                      FocusScope.of(context).requestFocus(new FocusNode());
                      widget.productBloc.add(GetDisplayCategoriesEvent());
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Product Category",
                      labelStyle: kLabelStyle,
                      // errorText: widget.state.title == "email"
                      //     ? widget.state.message
                      //     : null,
                      hintText: "Enter product category",
                      hintStyle: kHintTextStyle,
                      prefixIcon: Icon(Icons.account_box),
                    ),
                    // enabled: false,
                    onChanged: (value) {},
                  ),
                ),
                Row(
                  children: <Widget>[
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: "Product Sub Category",
                            labelStyle: kRLabelStyle,
                            // errorText: widget.state.title == "email"
                            //     ? widget.state.message
                            //     : null,
                            hintText: "Enter product sub category",
                            hintStyle: kRHintStyle,
                            prefixIcon: Icon(Icons.account_box),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            labelText: "Product Sub Sub Category",
                            labelStyle: kRLabelStyle,
                            // errorText: widget.state.title == "email"
                            //     ? widget.state.message
                            //     : null,
                            hintText: "Enter product sub sub category",
                            hintStyle: kRHintStyle,
                            prefixIcon: Icon(Icons.account_box),
                          ),
                          onChanged: (value) {},
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Product brand",
                      labelStyle: kLabelStyle,
                      // errorText: widget.state.title == "email"
                      //     ? widget.state.message
                      //     : null,
                      hintText: "Enter product brand",
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
                      labelText: "Product Tag (Press enter to add)",
                      labelStyle: kLabelStyle,
                      // errorText: widget.state.title == "email"
                      //     ? widget.state.message
                      //     : null,
                      hintText: "Enter product tag",
                      hintStyle: kHintTextStyle,
                    ),
                    textInputAction: TextInputAction.go,
                    controller: tagEditingController,
                    onSubmitted: (value) {
                      if (productTags.length < 5) {
                        setState(() {
                          productTags.add(value);
                        });
                      }
                      tagEditingController.clear();
                      print(productTags);
                    },
                  ),
                ),
                if (productTags.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10.0),
                    height: 110,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        ProductHeadings(title: "Product Tags(Tap to remove)"),
                        ProductTagsView(
                          productTags: productTags,
                          tap: (index) => _removeTag(index),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 2),
          Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ProductHeadings(title: "Add Views"),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  constraints: BoxConstraints(minHeight: 50),
                  decoration: BoxDecoration(
                    border: Border.all(
                      style: BorderStyle.solid,
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text("Add Images", style: kLabelStyle),
                      ),
                      // Flexible(
                      //   child: GridView.count(
                      //     crossAxisCount: 3,
                      //     childAspectRatio: 3 / 1,
                      //     children: List.generate(0, (index) => null),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Product video platform",
                      labelStyle: kLabelStyle,
                      // errorText: widget.state.title == "email"
                      //     ? widget.state.message
                      //     : null,
                      hintText: "Enter product video platform",
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
                      labelText: "Product video url",
                      labelStyle: kLabelStyle,
                      // errorText: widget.state.title == "email"
                      //     ? widget.state.message
                      //     : null,
                      hintText: "Enter product video url",
                      hintStyle: kHintTextStyle,
                      prefixIcon: Icon(Icons.account_box),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2),
          Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ProductHeadings(title: "Add Customer Options"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text("Colors", style: kLabelStyle),
                      ),
                      Switch(
                        value: colorsOption,
                        onChanged: (value) {
                          setState(() {
                            colorsOption = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
                if (colorsOption)
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: "Product Colors (Press enter to add)",
                        labelStyle: kLabelStyle,
                        // errorText: widget.state.title == "email"
                        //     ? widget.state.message
                        //     : null,
                        hintText: "Enter product colors",
                        hintStyle: kHintTextStyle,
                        prefixIcon: Icon(Icons.account_box),
                      ),
                      textInputAction: TextInputAction.go,
                      onSubmitted: (value) {},
                    ),
                  ),
                if (colorsList.isNotEmpty && colorsOption)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10.0),
                    height: 110,
                    decoration: BoxDecoration(
                      border: Border.all(
                        style: BorderStyle.solid,
                        color: Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: <Widget>[
                        ProductHeadings(title: "Product Colors(Tap to remove)"),
                        ProductColorView(
                          colorsList: colorsList,
                          tap: (index) => _removeColor(index),
                        )
                      ],
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Product units available",
                      labelStyle: kLabelStyle,
                      // errorText: widget.state.title == "email"
                      //     ? widget.state.message
                      //     : null,
                      hintText: "Enter product units available",
                      hintStyle: kHintTextStyle,
                      prefixIcon: Icon(Icons.account_box),
                    ),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2),
          Card(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                ProductHeadings(title: "Products Pricing"),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      labelText: "Product unit price",
                      labelStyle: kLabelStyle,
                      // errorText: widget.state.title == "email"
                      //     ? widget.state.message
                      //     : null,
                      hintText: "Enter product unit price",
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
                      labelText: "Product sale price",
                      labelStyle: kLabelStyle,
                      // errorText: widget.state.title == "email"
                      //     ? widget.state.message
                      //     : null,

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
                      labelText: "Product tax",
                      labelStyle: kLabelStyle,
                      // errorText: widget.state.title == "email"
                      //     ? widget.state.message
                      //     : null,
                      hintText: "Enter product tax",
                      hintStyle: kHintTextStyle,
                      prefixIcon: Icon(Icons.account_box),
                      suffixIcon:
                          IconButton(icon: Icon(Icons.add), onPressed: null),
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
                      labelText: "Product discount",
                      labelStyle: kLabelStyle,
                      // errorText: widget.state.title == "email"
                      //     ? widget.state.message
                      //     : null,
                      hintText: "Enter product discount",
                      hintStyle: kHintTextStyle,
                      prefixIcon: Icon(Icons.account_box),
                      suffixIcon:
                          IconButton(icon: Icon(Icons.add), onPressed: null),
                    ),
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: MyCustomButton(press: null, title: 'Add Product'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  _removeColor(int index) {
    setState(() {
      colorsList.removeAt(index);
    });
  }

  _removeTag(int index) {
    setState(() {
      productTags.removeAt(index);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
