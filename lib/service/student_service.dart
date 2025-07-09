import 'package:dio/dio.dart';
import 'package:studnet_app/model/student_model.dart';
import 'package:studnet_app/service/classes_service.dart';

class StudentService {
  Dio dio =Dio();

  Future<bool> createStudent(StudentModel student) async {
    final response = await dio.post('https://school-managment-app-tqbh.onrender.com/admin/students', data: student.toJson()
    ,options: Options(
      headers: {
        'Authorization': 'Bearer $token',
      },
    )
    );
    return response.statusCode == 200;
  }
}