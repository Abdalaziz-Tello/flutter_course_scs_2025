import 'package:bloc/bloc.dart';
import 'package:bloc_full_example/model/company_model.dart';
import 'package:bloc_full_example/model/offer_model.dart';
import 'package:bloc_full_example/service/company_service.dart';
import 'package:bloc_full_example/service/offer_service.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  List<OfferModel> offers = [];
  List<CompanyModel> company = [];
  List<OfferModel> resultOfOffers = [];
  OfferBloc() : super(OfferInitial()) {
    on<GetOffersAndCompany>((event, emit) async {
      emit(Loading());
      offers = await OfferService().getAllOffers();

      company = await CompanyService().getAllCompany();
      if (offers.isEmpty) {
        emit(Error());
      } else {
        emit(Success(offers: offers, company: company));
      }
    });

    on<FilterById>((event, emit) async {
      emit(Loading());
      // ! Replace with other function called GetOfferByCompany
      // List<OfferModel> offers = await OfferService().getAllOffers();
      offers = await OfferService().getOfferByCompanyId(id: event.id);
      company = await CompanyService().getAllCompany();
      if (offers.isEmpty) {
        emit(Error());
      } else {
        emit(Success(offers: offers, company: company));
      }
    });

    on<SearchByTitle>((event, emit) {
      if (event.word=="") {
        emit(ReFetchAll());
      }else {

      resultOfOffers = [];
      emit(Loading());
      for (var i = 0; i < offers.length; i++) {
        if (offers[i].title==event.word) {
          resultOfOffers.add(offers[i]);
        }
      }
      if (resultOfOffers.isNotEmpty) {
        
      emit(Success(company: company, offers: resultOfOffers));
      } else {
        emit(NotFound());
      }
      }
    },);
  }
}
