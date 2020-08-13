import 'package:flutter/material.dart';

class ProductTagsView extends StatelessWidget {
  const ProductTagsView(
      {Key key, @required this.productTags, @required this.tap})
      : super(key: key);

  final List<String> productTags;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 3 / 1,
        children: List.generate(
          productTags.length,
          (index) {
            return GestureDetector(
              onTap: () {
                tap(index);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                height: 10,
                child: Text(
                  productTags[index],
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
