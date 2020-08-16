import 'package:flutter/material.dart';

import '../../../../core/utils/Constants.dart';

class AddProductSelectView extends StatelessWidget {
  const AddProductSelectView({
    Key key,
    @required this.listSelection,
    @required this.tap,
    @required this.title,
  }) : super(key: key);

  final listSelection;
  final Function tap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Text(
              title,
              style: kLabelStyle,
            ),
          ),
          Divider(),
          Flexible(
            child: ListView.separated(
              itemCount: listSelection?.length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () => tap(listSelection[index]),
                  title: Text(listSelection[index].name),
                  trailing: Icon(Icons.chevron_right),
                );
              },
              separatorBuilder: (context, index) => Divider(),
            ),
          ),
        ],
      ),
    );
  }
}
