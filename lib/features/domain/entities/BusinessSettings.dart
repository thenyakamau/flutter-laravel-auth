import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BusinessSettings extends Equatable {
  final int id;
  final String type;
  final String value;
  final String createdAt;
  final String updatedAt;

  BusinessSettings({
    @required this.id,
    @required this.type,
    @required this.value,
    @required this.createdAt,
    @required this.updatedAt,
  });
  @override
  List<Object> get props => [id, type, value, createdAt, updatedAt];
}
