// // To parse this JSON data, do
// //
// //     final checkApiRes = checkApiResFromJson(jsonString);

// import 'dart:convert';

// CheckApiRes checkApiResFromJson(String str) =>
//     CheckApiRes.fromJson(json.decode(str));

// String checkApiResToJson(CheckApiRes data) => json.encode(data.toJson());

// class CheckApiRes {
//   bool? status;
//   User? user;

//   CheckApiRes({
//     this.status,
//     this.user,
//   });

//   factory CheckApiRes.fromJson(Map<String, dynamic> json) => CheckApiRes(
//         status: json["status"],
//         user: json["user"] == null ? null : User.fromJson(json["user"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "user": user?.toJson(),
//       };
// }

// class User {
//   int? id;
//   String? status;
//   String? onlineOffline;
//   String? token;
//   String? name;
//   String? username;
//   String? email;
//   String? image;
//   String? comment;
//   int? role;
//   String? createdAt;
//   String? updatedAt;
//   DateTime? createdDate;

//   User({
//     this.id,
//     this.status,
//     this.onlineOffline,
//     this.token,
//     this.name,
//     this.username,
//     this.email,
//     this.image,
//     this.comment,
//     this.role,
//     this.createdAt,
//     this.updatedAt,
//     this.createdDate,
//   });

//   factory User.fromJson(Map<String, dynamic> json) => User(
//         id: json["id"] ?? 0,
//         status: json["status"] ?? "",
//         onlineOffline: json["online_offline"] ?? "",
//         token: json["token"] ?? "",
//         name: json["name"] ?? "",
//         username: json["username"] ?? "",
//         email: json["email"] ?? "",
//         image: json["image"] ?? "",
//         comment: json["comment"] ?? "",
//         role: json["role"] ?? "",
//         createdAt: json["created_at"] ?? "",
//         updatedAt: json["updated_at"] ?? "",
//         createdDate: json["created_date"] == null
//             ? null
//             : DateTime.parse(
//                 json["created_date"] ?? "",
//               ),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "status": status,
//         "online_offline": onlineOffline,
//         "token": token,
//         "name": name,
//         "username": username,
//         "email": email,
//         "image": image,
//         "comment": comment,
//         "role": role,
//         "created_at": createdAt,
//         "updated_at": updatedAt,
//         "created_date":
//             "${createdDate!.year.toString().padLeft(4, '0')}-${createdDate!.month.toString().padLeft(2, '0')}-${createdDate!.day.toString().padLeft(2, '0')}",
//       };
// }
