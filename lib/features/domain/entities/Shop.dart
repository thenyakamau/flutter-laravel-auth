import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Shop extends Equatable {
  final String shop_name,
      shop_address,
      shop_number,
      allow_imports,
      bank_account,
      bank_name,
      bank_user_name,
      mpesa_number;

  Shop({
    @required this.shop_name,
    @required this.shop_address,
    @required this.shop_number,
    @required this.allow_imports,
    this.bank_account,
    this.bank_name,
    this.bank_user_name,
    @required this.mpesa_number,
  });

  @override
  List<Object> get props => [
        shop_name,
        shop_address,
        shop_number,
        mpesa_number,
        allow_imports,
        bank_name,
        bank_user_name,
        bank_account
      ];
}
