
import 'package:dio/dio.dart';
import 'package:studnet_app/model/class_model.dart';

String token = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhZG1pbiIsInJvbGUiOiJhZG1pbiIsImV4cCI6MTc1MjA3NDk0Mn0.AagnxAMVnx63K2xial-oYwhA7vJ7bfL9SSHJorY1RRk';

class ClassesService {
  Dio dio =Dio();


  Future<List<ClassModel>> getClasses() async {
    final response = await dio.get('https://school-managment-app-tqbh.onrender.com/admin/classes'
    ,options: Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    )
    );
    List<ClassModel> classes =List.generate(response.data.length, (index) => ClassModel.fromJson(response.data[index]));
    return classes;
  }
}