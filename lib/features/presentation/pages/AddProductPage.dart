import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../injection.dart';
import '../bloc/add_products_bloc/addproduct_bloc.dart';
import '../widgets/add_products_wigdet/add_product_wigets.dart';
import '../widgets/loading_widget.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({Key key}) : super(key: key);

  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  AddproductBloc productBloc;
  List productSelections = [];
  @override
  void initState() {
    super.initState();
    productBloc = getIt<AddproductBloc>();
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
                return AddProductBody(
                  productBloc: productBloc,
                  productSelections: productSelections,
                );
              } else if (state is AddProductChooseCategoryState) {
                return AddProductSelectView(
                  listSelection: state.categories,
                  tap: (category) {
                    final selection = {
                      'title': 'category',
                      'name': category.name,
                      'id': category.id
                    };
                    setState(() {
                      productSelections.add(selection);
                    });
                    productBloc.add(
                      GetDisplaySubCategoriesEvent(category: category),
                    );
                  },
                  title: 'Categories',
                );
              } else if (state is AddProductChooseSubCategoryState) {
                return AddProductSelectView(
                  listSelection: state.subCategories,
                  tap: (subCategory) {
                    final selection = {
                      'title': 'sub_category',
                      'name': subCategory.name,
                      'id': subCategory.id
                    };
                    setState(() {
                      productSelections.add(selection);
                    });
                    productBloc.add(
                      GetDisplaySubSubCategoriesEvent(
                          subCategories: subCategory),
                    );
                  },
                  title: 'Sub Categories',
                );
              } else if (state is AddProductChooseSubSubCategoryState) {
                return AddProductSelectView(
                  listSelection: state.subSubCategories,
                  tap: (subsubCategory) {
                    final selection = {
                      'title': 'sub_sub_category',
                      'name': subsubCategory.name,
                      'id': subsubCategory.id
                    };
                    setState(() {
                      productSelections.add(selection);
                    });
                    print(productSelections);
                    productBloc.add(
                      GetDisplayBrandsEvent(subSubCategories: subsubCategory),
                    );
                  },
                  title: 'Sub Sub Categories',
                );
              } else if (state is AddProductChooseBrandState) {
                return AddProductSelectView(
                  listSelection: state.brands,
                  tap: null,
                  title: 'Brands',
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
