part of 'counter_cubit.dart';


// this is where the state variables are declared??
  
class CounterState extends Equatable {
  final int counter;
  final bool? wasIncremented;
  const CounterState({
    required this.counter,
    this.wasIncremented,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        counter,
        wasIncremented,
      ];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'counter': counter,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counter: map['counter'] as int,
      wasIncremented:
          map['wasIncremented'] != null ? map['wasIncremented'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source) as Map<String, dynamic>);
}
