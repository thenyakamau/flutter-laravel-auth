import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../features/data/models/Shop/ShopModel.dart';
import '../../features/data/models/User/UserModel.dart';

@lazySingleton
class CheckAuthentication {
  Either<List, UserModel> checkRegAuthentication(String name, String email,
      String number, String password, String cPassword) {
    if (name == null || name.length < 4) {
      return Left(["name", "Please input correct name format"]);
    } else if (email == null ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
      return Left(["email", "Please input correct email format"]);
    } else if (number == null ||
        !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(number)) {
      return Left(["number", "Please input correct phone number format"]);
    } else if (password == null || password.length < 6) {
      return Left(["password", "Please input correct password format"]);
    } else if (cPassword == null || cPassword != password) {
      return Left(["cPassword", "Please make sure passwords match"]);
    } else {
      var user = UserModel(
        name: name,
        email: email.toLowerCase(),
        number: number,
        password: password,
      );
      return Right(user);
    }
  }

  Either<List, ShopModel> checkShopAuthentiction(
    String shop_name,
    String shop_address,
    String shop_number,
    String mpesa_number,
    String allow_imports,
    String bank_name,
    String bank_user_name,
    String bank_account,
  ) {
    if (shop_name == null || shop_name.length < 4) {
      return Left(
        ["shop_name", "Please input a shop name with more than 4 characters"],
      );
    } else if (shop_address == null) {
      return Left(["shop_address", "Please input a shop address"]);
    } else if (shop_number == null || shop_number.length < 8) {
      return Left([
        "shop_number",
        "Please input a shop number with more than 8 characters"
      ]);
    } else if (mpesa_number == null || mpesa_number.length < 8) {
      return Left([
        "mpesa_number",
        "Please input a mpesa number with more than 8 characters"
      ]);
    } else {
      var shop = ShopModel(
          shop_name: shop_name,
          shop_address: shop_address,
          shop_number: shop_number,
          allow_imports: allow_imports,
          mpesa_number: mpesa_number,
          bank_name: bank_name,
          bank_account: bank_account,
          bank_user_name: bank_user_name);
      return Right(shop);
    }
  }

  Either<List, bool> checkLoginAuthentication(String email, String password) {
    if (email == null ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
      return Left(["email", "Please input correct email format"]);
    } else if (password == null || password.length < 6) {
      return Left(["password", "Please input correct password format"]);
    } else {
      return Right(true);
    }
  }
}
