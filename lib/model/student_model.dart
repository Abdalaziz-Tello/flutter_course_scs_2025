
class StudentModel {
  String name;
  num class_id;
  num parent_id;
  String profile_picture;
  num fees;

  StudentModel({required this.name, required this.class_id, required this.parent_id, required this.profile_picture, required this.fees});

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(name: json['name'], class_id: json['class_id'], parent_id: json['parent_id'], profile_picture: json['profile_picture'], fees: json['fees']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'class_id': class_id,
      'parent_id': parent_id,
      'profile_picture': profile_picture,
      'fees': fees,
    };
  }
}