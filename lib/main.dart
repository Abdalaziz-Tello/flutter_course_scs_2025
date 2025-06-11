import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/counter/bloc/counter_event.dart';
import 'package:intro_to_bloc/counter/bloc/counter_manager.dart';
import 'package:intro_to_bloc/counter/bloc/counter_state.dart';
import 'package:intro_to_bloc/observer.dart';
import 'package:intro_to_bloc/offers/bloc/offer_bloc.dart';
import 'package:intro_to_bloc/offers/ui/offer_page.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => OfferBloc()..add(FetchOffers())),
        BlocProvider(create: (context) => CounterManager()),
      ],
      child: MaterialApp(home: OfferPage()),
    );
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocListener<CounterManager, CounterState>(
          listener: (context, state) {
            if (state is CounterFailedToChange) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Pleas Enter The Correct Value With Number not use Letters",
                  ),
                ),
              );
            }
          },
          child: TextField(
            onChanged: (value) {
              context.read<CounterManager>().add(
                SetNumberFromTextField(value: value),
              );
            },
          ),
        ),
        leading: IconButton(
          onPressed: () {
            context.read<CounterManager>().add(RestartToZero());
          },
          icon: Icon(Icons.exposure_zero),
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterManager, CounterState>(
          builder: (context, state) {
            if (state is TheNumberHasBeenChanged) {
              return Text(state.counter.toString());
            }
            if (state is CounterFailedToChange) {
              return Text(state.lastCounterValue.toString());
            }
            return CircularProgressIndicator();
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: Text("+"),
            onPressed: () {
              context.read<CounterManager>().add(Increament());
            },
          ),
          FloatingActionButton(
            child: Text("-"),
            onPressed: () {
              context.read<CounterManager>().add(Decreament());
            },
          ),
        ],
      ),
    );
  }
}
