part of 'switch__bloc.dart';

abstract class SwitchEvent {
  const SwitchEvent();

  @override
  List<Object> get props => [];
}

class SwitchOnEvent extends SwitchEvent{
  final BuildContext context;
  const SwitchOnEvent({required this.context});
}
class SwitchOffEvent extends SwitchEvent{
  final BuildContext context;
  const SwitchOffEvent({required this.context});
}
