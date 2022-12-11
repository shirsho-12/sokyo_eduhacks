part 'user.g.dart';

/// {@template user}
/// User description
/// {@endtemplate}
class User {
  /// {@macro user}
  const User({
    required this.userName,
    required this.userAvatarLink,
    required this.name,
  });

  /// Creates a User from Json map
  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);

  factory User.fromAppWrite(Map<String, dynamic> data) {
    return User(
      userName: data['name'],
      userAvatarLink: data['userAvatarLink'],
      name: data['name'],
    );
  }

  /// A description for userName
  final String userName;

  /// A description for userAvatarLink
  final String userAvatarLink;

  /// A description for name
  final String name;

  /// Creates a Json map from a User
  Map<String, dynamic> toJson() => _$UserToJson(this);

  static const dummy = User(
    userName: '@shirsho',
    userAvatarLink: 'assets/images/face.jpg',
    name: 'Shirshajit',
  );
}
