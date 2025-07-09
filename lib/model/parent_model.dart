// ignore_for_file: public_member_api_docs, sort_constructors_first
class ParentModel {
  String username;
  num id;

  ParentModel({required this.username, required this.id});

  factory ParentModel.fromJson(Map<String, dynamic> json) {
    return ParentModel(username: json['username'], id: json['id']);
  }
  
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'id': id,
    };
  }

  @override
  bool operator ==(covariant ParentModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.username == username &&
      other.id == id;
  }

  @override
  int get hashCode => username.hashCode ^ id.hashCode;
}  
