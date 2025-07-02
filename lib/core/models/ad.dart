// lib/models/ad.dart
class AdModel {
  final String title;
  final String price;
  final String description;
  final List <String> image;
  final String location;
  final String category;
  final int? views;
   final bool? isFavorite;
  final String? contact;

  AdModel({
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.location,
    required this.category,
    this.contact,
     this.views,
      this.isFavorite,
  });
}