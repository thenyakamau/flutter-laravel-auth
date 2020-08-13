import 'package:flutter/material.dart';

import '../../../../core/utils/HexColorConverter.dart';
import '../../../domain/entities/CustomColors.dart';

class ProductColorView extends StatelessWidget {
  const ProductColorView({
    Key key,
    @required this.colorsList,
    @required this.tap,
  }) : super(key: key);

  final List<CustomColors> colorsList;
  final Function tap;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 3 / 1,
        children: List.generate(
          colorsList?.length,
          (index) {
            return GestureDetector(
              onTap: () {
                tap(index);
              },
              child: Container(
                color: HexColor(colorsList[index].code),
                padding: EdgeInsets.all(10),
                height: 10,
                child: Text(
                  colorsList[index].name,
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
