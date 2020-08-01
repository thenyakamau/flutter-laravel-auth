import 'package:dartz/dartz.dart';

import '../../features/data/models/UserModel.dart';

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
        email: email,
        number: number,
        password: password,
      );
      return Right(user);
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
