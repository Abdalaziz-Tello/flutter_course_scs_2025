import 'package:bloc_full_example/bloc/offer_bloc.dart';
import 'package:bloc_full_example/config/observer_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => OfferBloc()..add(GetOffersAndCompany()),
        ),
      ],
      child: MaterialApp(home: OfferPage()),
    );
  }
}

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            context.read<OfferBloc>().add(SearchByTitle(word: value));
          },
        ),
      ),
      body: Center(
        child: BlocConsumer<OfferBloc, OfferState>(
          listener: (context, state) {
            if (state is ReFetchAll) {
              context.read<OfferBloc>().add(GetOffersAndCompany());
            }
            if (state is NotFound) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Try Again")));
            }
          },
          builder: (context, state) {
            if (state is Success) {
              return Column(
                children: [
                  SizedBox(
                    height: 60,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.company.length +1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return InkWell(
                            onTap: () {
                              context.read<OfferBloc>().add(
                                GetOffersAndCompany(),
                              );
                            },
                            child: Chip(label: Text("All")),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                context.read<OfferBloc>().add(
                                  FilterById(
                                    id: state.company[index-1].id.toString(),
                                  ),
                                );
                              },
                              child: Chip(
                                label: Text(state.company[index-1].name),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      ),
                      itemCount: state.offers.length,
                      itemBuilder: (context, index) => Card(
                        child: Container(
                          child: Center(child: Text(state.offers[index].title)),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            } else  if(state is NotFound){

              return Text("Pleas Insert Your Title Right");
            }else {

              return LinearProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
