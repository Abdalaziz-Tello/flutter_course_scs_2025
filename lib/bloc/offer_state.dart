// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'offer_bloc.dart';

@immutable
sealed class OfferState {}

final class OfferInitial extends OfferState {}


class Success extends OfferState {
  List<OfferModel> offers;
  List<CompanyModel> company;
  Success({
    required this.company,
    required this.offers,
  });
}

class Error extends OfferState {}


class Loading extends OfferState {}

class NotFound extends OfferState {}

class ReFetchAll extends OfferState {}