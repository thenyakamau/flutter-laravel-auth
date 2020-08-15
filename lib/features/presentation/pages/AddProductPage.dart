import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_laravel_auth/features/presentation/widgets/loading_widget.dart';

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
    final height = MediaQuery.of(context).size.height;
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
                return AddProductBody(productBloc: productBloc);
              } else if (state is AddProductChooseCategoryState) {
                return AddProductSelectView(
                  listSelection: state.categories,
                  tap: (category) => productBloc.add(
                    GetDisplaySubCategoriesEvent(category: category),
                  ),
                  title: 'Categories',
                );
              } else if (state is AddProductChooseSubCategoryState) {
                return AddProductSelectView(
                  listSelection: state.subCategories,
                  tap: (subCategory) => productBloc.add(
                    GetDisplaySubSubCategoriesEvent(
                      subCategories: subCategory,
                    ),
                  ),
                  title: 'Sub Categories',
                );
              } else if (state is AddProductLoadingState) {
                return LoadingWidget(height: height);
              } else {
                return Container(color: Colors.white);
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    productBloc.close();
  }
}
