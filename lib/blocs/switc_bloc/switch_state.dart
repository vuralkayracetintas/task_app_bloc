part of 'switch_bloc.dart';

class SwitchState extends Equatable {
  const SwitchState({required this.switchValue});

  final bool switchValue;

  @override
  List<Object> get props => [switchValue];

  Map<String, dynamic> toMap() {
    return {
      'switchValue': switchValue,
    };
  }

  factory SwitchState.fromMap(Map<String, dynamic> map) {
    return SwitchState(switchValue: map['switchValue']);
  }
}

class SwitchInitial extends SwitchState {
  const SwitchInitial({required bool switchValue})
      : super(switchValue: switchValue);
}
