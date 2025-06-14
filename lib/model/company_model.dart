import 'package:meta/meta.dart';
import 'dart:convert';

class CompanyModel {
    final String name;
    final String description;
    final String contactInfo;
    final num rating;
    final num pricePerLiter;
    final num id;

    CompanyModel({
        required this.name,
        required this.description,
        required this.contactInfo,
        required this.rating,
        required this.pricePerLiter,
        required this.id,
    });

    CompanyModel copyWith({
        String? name,
        String? description,
        String? contactInfo,
        num? rating,
        num? pricePerLiter,
        num? id,
    }) => 
        CompanyModel(
            name: name ?? this.name,
            description: description ?? this.description,
            contactInfo: contactInfo ?? this.contactInfo,
            rating: rating ?? this.rating,
            pricePerLiter: pricePerLiter ?? this.pricePerLiter,
            id: id ?? this.id,
        );

    factory CompanyModel.fromRawJson(String str) => CompanyModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        name: json["name"],
        description: json["description"],
        contactInfo: json["contact_info"],
        rating: json["rating"],
        pricePerLiter: json["price_per_liter"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "contact_info": contactInfo,
        "rating": rating,
        "price_per_liter": pricePerLiter,
        "id": id,
    };
}
