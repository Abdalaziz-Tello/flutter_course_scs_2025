import 'package:dio/dio.dart';
import 'package:intro_to_bloc/offers/model/offer_model.dart';

class OfferService {
  Dio dio = Dio();
  String url= "https://zamzaam.onrender.com/offers/?skip=0&limit=100";
  late Response response ;


 Future<List<OfferModel>> fetchOffer()async{
try {
  response = await dio.get(url);
  List<OfferModel> offers = List.generate(response.data.length, (index) => OfferModel.fromMap(response.data[index]),);
  return offers;
} catch (e) {
  print(e);
  return [];
}
  }
}