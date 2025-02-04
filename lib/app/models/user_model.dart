class UserModel {
  final String id;
  final String name;
  final String email;
  final String? profileImage;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.profileImage,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json["id"],
      name: json["display_name"],
      email: json["email"],
      profileImage: json["images"].isNotEmpty ? json["images"][0]["url"] : null,
    );
  }
}
