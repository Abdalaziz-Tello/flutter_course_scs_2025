import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/counter/bloc/counter_event.dart';
import 'package:intro_to_bloc/counter/bloc/counter_state.dart';

class CounterManager extends Bloc<CounterEvent, CounterState> {
  int counter = 0;
  CounterManager() : super(CounteInitl()) {
    on<Increament>((event, emit) {
      counter++;
      emit(TheNumberHasBeenChanged(counter: counter));
    });

    on<Decreament>((event, emit) {
      if (counter > 0){
         counter--;
      emit(TheNumberHasBeenChanged(counter: counter));
      }
      
    });

    on<RestartToZero>((event, emit) {
      counter = 0;
      emit(TheNumberHasBeenChanged(counter: counter));
    });

    on<SetNumberFromTextField>((event, emit) {
      try {
      int temp = int.parse(event.value);
      if(temp > 0){
        counter =temp;
      emit(TheNumberHasBeenChanged(counter: counter));
      }
  
      
        
      } catch (e) {
        print(e);
        emit(CounterFailedToChange(lastCounterValue: counter));
      }
    },);
  }
}
