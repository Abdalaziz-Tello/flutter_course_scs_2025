import 'package:meta/meta.dart';
import 'dart:convert';

class OfferModel {
    final String title;
    final String description;
    final num price;
    final num quantity;
    final num volume;
    final num id;
    final num companyId;
    final Company company;

    OfferModel({
        required this.title,
        required this.description,
        required this.price,
        required this.quantity,
        required this.volume,
        required this.id,
        required this.companyId,
        required this.company,
    });

    OfferModel copyWith({
        String? title,
        String? description,
        num? price,
        num? quantity,
        num? volume,
        num? id,
        num? companyId,
        Company? company,
    }) => 
        OfferModel(
            title: title ?? this.title,
            description: description ?? this.description,
            price: price ?? this.price,
            quantity: quantity ?? this.quantity,
            volume: volume ?? this.volume,
            id: id ?? this.id,
            companyId: companyId ?? this.companyId,
            company: company ?? this.company,
        );

    factory OfferModel.fromRawJson(String str) => OfferModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory OfferModel.fromJson(Map<String, dynamic> json) => OfferModel(
        title: json["title"],
        description: json["description"],
        price: json["price"],
        quantity: json["quantity"],
        volume: json["volume"],
        id: json["id"],
        companyId: json["company_id"],
        company: Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "price": price,
        "quantity": quantity,
        "volume": volume,
        "id": id,
        "company_id": companyId,
        "company": company.toJson(),
    };
}

class Company {
    final String name;
    final String description;
    final String contactInfo;
    final num rating;
    final num pricePerLiter;
    final num id;

    Company({
        required this.name,
        required this.description,
        required this.contactInfo,
        required this.rating,
        required this.pricePerLiter,
        required this.id,
    });

    Company copyWith({
        String? name,
        String? description,
        String? contactInfo,
        num? rating,
        num? pricePerLiter,
        num? id,
    }) => 
        Company(
            name: name ?? this.name,
            description: description ?? this.description,
            contactInfo: contactInfo ?? this.contactInfo,
            rating: rating ?? this.rating,
            pricePerLiter: pricePerLiter ?? this.pricePerLiter,
            id: id ?? this.id,
        );

    factory Company.fromRawJson(String str) => Company.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Company.fromJson(Map<String, dynamic> json) => Company(
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
