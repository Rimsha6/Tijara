class AppUser {
  final String uid;
  final String username;
  final String phone;
  final String profileImageUrl;
  final DateTime joinedAt;

  AppUser({
    required this.uid,
    required this.username,
    required this.phone,
    required this.profileImageUrl,
    required this.joinedAt,
  });
}
