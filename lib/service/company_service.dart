import 'package:bloc_full_example/model/company_model.dart';
import 'package:dio/dio.dart';

class CompanyService {
 Dio dio = Dio();
  late Response response;
  String baseurl = "https://zamzaam.onrender.com/companies/?skip=0&limit=100";


 Future<List<CompanyModel>> getAllCompany()async{
  try {
    response = await dio.get(baseurl);
    List<CompanyModel> offers = [];
    for (var i = 0; i < response.data.length; i++) {
      offers.add(CompanyModel.fromJson(response.data[i]));
    }
    return offers;
  } catch (e) {
    print(e);
    return [];
  }
 } 
}