import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class BusinessSettings extends Equatable {
  final int id;
  final String type;
  final String value;

  BusinessSettings({
    @required this.id,
    @required this.type,
    @required this.value,
  });
  @override
  List<Object> get props => [id, type, value];
}
