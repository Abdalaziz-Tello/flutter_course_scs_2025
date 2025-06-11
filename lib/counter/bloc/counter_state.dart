// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CounterState {}


class CounteInitl extends CounterState {}

class TheNumberHasBeenChanged extends CounterState {
  int counter;
  TheNumberHasBeenChanged({
    required this.counter,
  });
}

class CounterFailedToChange extends CounterState {
 int lastCounterValue;
  CounterFailedToChange({
    required this.lastCounterValue,
  });
}
