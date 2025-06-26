class MyAd {
  final String userId;
  final String adId;
  final String title;
  final String price;
  final String description;
  final List<String> images;
  final String location;
  final int views;
  final DateTime createdAt;
  final bool isActive;
  final bool isApproved;

  MyAd({
    required this.userId,
    required this.adId,
    required this.title,
    required this.price,
    required this.description,
    required this.images,
    required this.location,
    this.views = 0,
    required this.createdAt,
    this.isActive = true,
    this.isApproved = true,
  });
}
