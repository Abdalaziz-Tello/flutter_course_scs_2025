import 'package:bloc_full_example/model/offer_model.dart';
import 'package:dio/dio.dart';

class OfferService {
  Dio dio = Dio();
  late Response response;
  String baseurl = "https://zamzaam.onrender.com/offers/?skip=0&limit=100";


 Future<List<OfferModel>> getAllOffers()async{
  try {
    response = await dio.get(baseurl);
    List<OfferModel> offers = [];
    for (var i = 0; i < response.data.length; i++) {
      offers.add(OfferModel.fromJson(response.data[i]));
    }
    return offers;
  } catch (e) {
    print(e);
    return [];
  }
 }

 Future<List<OfferModel>> getOfferByCompanyId({required String id})async{
  try {
    response = await dio.get("https://zamzaam.onrender.com/companies/$id/offers/?skip=0&limit=100");
    List<OfferModel> offers = [];
    for (var i = 0; i < response.data.length; i++) {
      offers.add(OfferModel.fromJson(response.data[i]));
    }
    return offers;
  } catch (e) {
    print(e);
    return [];
  }
 }

}