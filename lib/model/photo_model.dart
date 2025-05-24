// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auth_dummy/model/user_model.dart';

class PhotoModel {
  int id;
  int albumId;
  String title;
  String url;
  String thumbnailUrl;
  PhotoModel({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  static PhotoModel fromMap(Map<String, dynamic> map) {
    return PhotoModel(
      id: map['id'],
      albumId: map['albumId'],
      title: map['title'],
      url: map['url'],
      thumbnailUrl: map['thumbnailUrl'],
    );
  }
}
