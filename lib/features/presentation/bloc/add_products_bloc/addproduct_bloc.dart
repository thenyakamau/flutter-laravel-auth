import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'addproduct_event.dart';
part 'addproduct_state.dart';

class AddproductBloc extends Bloc<AddproductEvent, AddproductState> {
  AddproductBloc() : super(AddproductInitial());

  @override
  Stream<AddproductState> mapEventToState(
    AddproductEvent event,
  ) async* {
    if (event is GetDisplayColorsEvent) {}
  }
}
