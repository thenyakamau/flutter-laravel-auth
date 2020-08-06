import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/Shop.dart';

part 'ShopModel.g.dart';

@JsonSerializable()
class ShopModel extends Shop {
  final String shop_name,
      shop_address,
      shop_number,
      allow_imports,
      bank_account,
      bank_name,
      bank_user_name,
      mpesa_number;

  ShopModel({
    @required this.shop_name,
    @required this.shop_address,
    @required this.shop_number,
    @required this.allow_imports,
    this.bank_account,
    this.bank_name,
    this.bank_user_name,
    @required this.mpesa_number,
  }) : super(
          shop_name: shop_name,
          shop_address: shop_address,
          shop_number: shop_number,
          mpesa_number: mpesa_number,
          allow_imports: allow_imports,
          bank_name: bank_name,
          bank_account: bank_account,
          bank_user_name: bank_user_name,
        );

  factory ShopModel.fromJson(Map<String, dynamic> json) =>
      _$ShopModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShopModelToJson(this);
}
