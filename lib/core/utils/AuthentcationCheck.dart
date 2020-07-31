import 'package:dartz/dartz.dart';

import '../../features/data/models/UserModel.dart';

class CheckAuthentication {
  Either<String, UserModel> checkRegAuthentication(String name, String email,
      String number, String password, String cPassword) {
    if (name == null || name.length < 4) {
      return Left("Please enter correct name format");
    } else if (email == null ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
      return Left("Please enter correct email format");
    } else if (number == null ||
        !RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)').hasMatch(number)) {
      return Left("Please enter correct number format");
    } else if (password == null || password.length < 6) {
      return Left("Please enter correct password format");
    } else if (cPassword == null || cPassword != password) {
      return Left("Please make sure password match");
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

  Either<String, bool> checkLoginAuthentication(String email, String password) {
    if (email == null ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(email)) {
      return Left("Please enter correct email format");
    } else if (password == null || password.length < 6) {
      return Left("Please enter correct password format");
    } else {
      return Right(true);
    }
  }
}
