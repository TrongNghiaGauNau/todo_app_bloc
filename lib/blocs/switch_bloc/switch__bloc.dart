import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'switch__event.dart';
part 'switch__state.dart';

class SwitchBloc extends Bloc<SwitchEvent, SwitchState> {
  SwitchBloc() : super(const SwitchInitial(switchValue: false)) {
    on<SwitchOnEvent>((event, emit) {
        emit(const SwitchState(switchValue: true));
        ScaffoldMessenger.of(event.context).showSnackBar(
          const SnackBar(content: Text('Light mode ON')),
        );
    });
    on<SwitchOffEvent>((event, emit) {
      emit(const SwitchState(switchValue: false));
      ScaffoldMessenger.of(event.context).showSnackBar(
        const SnackBar(content: Text('Dark mode ON')),
      );
    });
  }
}
