// ignore_for_file: public_member_api_docs, sort_constructors_first
class ClassModel {
  String name;
  num teacher_id;
  num id;

  ClassModel({required this.name, required this.teacher_id, required this.id});

  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(name: json['name'], teacher_id: json['teacher_id'], id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'teacher_id': teacher_id,
      'id': id,
    };
  }

  @override
  bool operator ==(covariant ClassModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.teacher_id == teacher_id &&
      other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ teacher_id.hashCode ^ id.hashCode;
}
