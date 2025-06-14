// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'offer_bloc.dart';

@immutable
sealed class OfferEvent {}


class GetOffersAndCompany extends OfferEvent {
  //
}

class FilterById extends OfferEvent {
  String id;
  FilterById({
    required this.id,
  });
}


class SearchByTitle extends OfferEvent {
  String word;
  SearchByTitle({
    required this.word,
  });
}
