import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class CustomColors extends Equatable {
  final int id;
  final String name;
  final String code;

  CustomColors({@required this.id, @required this.name, @required this.code});

  @override
  List<Object> get props => [id, code, name];
}
