import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intro_to_bloc/offers/bloc/offer_bloc.dart';

class OfferPage extends StatelessWidget {
  const OfferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<OfferBloc,OfferState>(
          listener: (context, state) {
            if (state is SuccessGrapOffers) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("The Data is Came Back",),backgroundColor: Colors.green,));
            }
          },
          builder:
        (context, state) {
          if (state is SuccessGrapOffers) {
            return ListView.builder(
              itemCount: state.offers.length,
              itemBuilder:(context, index) => ListTile(title: Text(state.offers[index].title),subtitle: Text(state.offers[index].description),),);
          } else {
            return CircularProgressIndicator();
          }
        },
         ),
      ),
    );
  }
}