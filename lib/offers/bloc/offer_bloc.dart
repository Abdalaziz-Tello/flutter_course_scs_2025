import 'package:bloc/bloc.dart';
import 'package:intro_to_bloc/offers/model/offer_model.dart';
import 'package:intro_to_bloc/offers/service/offer_service.dart';
import 'package:meta/meta.dart';

part 'offer_event.dart';
part 'offer_state.dart';

class OfferBloc extends Bloc<OfferEvent, OfferState> {
  OfferBloc() : super(OfferInitial()) {
    on<FetchOffers>((event, emit)async {
      emit(LoadingOffer());
      List<OfferModel> offers = await OfferService().fetchOffer();
      if (offers.isNotEmpty) {
      emit(SuccessGrapOffers(offers: offers));
        
      }else {
      emit(ErrorToFetchOffer());

      }
    });
  }
}
