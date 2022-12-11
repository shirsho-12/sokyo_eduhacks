part of 'user.dart';

User _$UserFromJson(Map<String, dynamic> json) => User(
      userName: json['userName'] as String,
      userAvatarLink: json['userAvatarLink'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'userName': instance.userName,
      'userAvatarLink': instance.userAvatarLink,
      'name': instance.name,
    };
