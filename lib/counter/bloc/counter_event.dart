// ignore_for_file: public_member_api_docs, sort_constructors_first
abstract class CounterEvent {}



class Increament extends CounterEvent {}


class Decreament extends CounterEvent {}

class RestartToZero extends CounterEvent {

}

class SetNumberFromTextField extends CounterEvent {
  String value;
  SetNumberFromTextField({
    required this.value,
  });
}
