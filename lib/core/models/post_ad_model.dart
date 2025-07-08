class PostAdModel {
  String? userId;
  String? productName;
  String? userName;
  String? userEmail;
  String? productPrice;
  String? category;
  String? condition;
  String? contactNumber;
  String? location;
  double? latitude;
  double? longitude;
  String? description;
  String? views;
  String? adId;
  String? imageUrl;

  PostAdModel({
    this.userId,
    this.productName,
    this.userName,
    this.userEmail,
    this.productPrice,
    this.category,
    this.condition,
    this.contactNumber,
    this.location,
    this.latitude,
    this.longitude,
    this.description,
    this.views,
    this.adId,
    this.imageUrl,
  });

  factory PostAdModel.fromJson(Map<String, dynamic> json) {
    return PostAdModel(
      userId: json['userId'],
      productName: json['productName'],
      userName: json['userName'],
      userEmail: json['userEmail'],
      productPrice: json['productPrice'],
      category: json['category'],
      condition: json['condition'],
      contactNumber: json['contactNumber'],
      location: json['location'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      description: json['description'],
      views: json['views'],
      adId: json['adId'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'productName': productName,
      'userName': userName,
      'userEmail': userEmail,
      'productPrice': productPrice,
      'category': category,
      'condition': condition,
      'contactNumber': contactNumber,
      'location': location,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
      'views': views,
      'adId': adId,
      'imageUrl': imageUrl,
      'createdAt': DateTime.now().toIso8601String(),
    };
  }
}
