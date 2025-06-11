part of 'offer_bloc.dart';

@immutable
sealed class OfferEvent {}


class FetchOffers extends OfferEvent {}