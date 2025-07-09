
import 'package:dio/dio.dart';
import 'package:studnet_app/model/parent_model.dart';
import 'package:studnet_app/service/classes_service.dart';

class ParentService {
  Dio dio =Dio();


  Future<List<ParentModel>> getParents() async {
    final response = await dio.get('https://school-managment-app-tqbh.onrender.com/admin/users/parents'
    ,options: Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    )
    );
    List<ParentModel> classes =List.generate(response.data.length, (index) => ParentModel.fromJson(response.data[index]));
    return classes;
  }
}