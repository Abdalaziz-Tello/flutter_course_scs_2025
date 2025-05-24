// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
// !  dart data class generator 
// ? press this keys: ctrl + . 

class TestModel {

  String name;
  TestModel({
    required this.name,
  });

  TestModel copyWith({
    String? name,
  }) {
    return TestModel(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory TestModel.fromMap(Map<String, dynamic> map) {
    return TestModel(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TestModel.fromJson(String source) => TestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TestModel(name: $name)';

  @override
  bool operator ==(covariant TestModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
