// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OfferModel {
  String title;
  String description;
  OfferModel({
    required this.title,
    required this.description,
  });

  OfferModel copyWith({
    String? title,
    String? description,
  }) {
    return OfferModel(
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
    };
  }

  factory OfferModel.fromMap(Map<String, dynamic> map) {
    return OfferModel(
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfferModel.fromJson(String source) => OfferModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'OfferModel(title: $title, description: $description)';

  @override
  bool operator ==(covariant OfferModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.description == description;
  }

  @override
  int get hashCode => title.hashCode ^ description.hashCode;
}
