import 'package:flutter/material.dart';

class AddProductSelectView extends StatelessWidget {
  const AddProductSelectView({
    Key key,
    @required this.productBloc,
    @required this.listSelection,
  }) : super(key: key);

  final productBloc, listSelection;

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          ListView.builder(itemCount: listSelection?.length, itemBuilder: null),
    );
  }
}
