// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    String? email;
    String? password;
    String? firstName;
    String? lastName;

    UserModel({
        this.email,
        this.password,
        this.firstName,
        this.lastName,
    });

    UserModel copyWith({
        String? email,
        String? password,
        String? firstName,
        String? lastName,
    }) => 
        UserModel(
            email: email ?? this.email,
            password: password ?? this.password,
            firstName: firstName ?? this.firstName,
            lastName: lastName ?? this.lastName,
        );

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"] ?? "",
        password: json["password"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
    };
}
