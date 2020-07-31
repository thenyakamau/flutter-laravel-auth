import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class User extends Equatable {
  final String name;
  final String email;
  final String number;
  final String password;

  User({
    @required this.name,
    @required this.email,
    @required this.number,
    @required this.password,
  });
  @override
  List<Object> get props => [name, email, number, password];
}
