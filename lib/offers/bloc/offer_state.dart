// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'offer_bloc.dart';

@immutable
sealed class OfferState {}

final class OfferInitial extends OfferState {}


class LoadingOffer extends OfferState {}

class ErrorToFetchOffer extends OfferState {
  //TODO: add the error message as String 
}

class SuccessGrapOffers extends OfferState {
  // TODO: add the model here
  List<OfferModel> offers;
  SuccessGrapOffers({
    required this.offers,
  });
}
