import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Brands extends Equatable {
  final int id;
  final String name;
  final String logo;
  final int top;

  Brands({
    @required this.id,
    @required this.name,
    @required this.logo,
    @required this.top,
  });

  @override
  List<Object> get props => [id, name, logo, top];
}
