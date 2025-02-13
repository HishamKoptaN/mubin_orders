// To parse this JSON data, do
//
//     final getBranchOrdersApiResModel = getBranchOrdersApiResModelFromJson(jsonString);

import 'dart:convert';

GetBranchOrdersApiResModel getBranchOrdersApiResModelFromJson(String str) =>
    GetBranchOrdersApiResModel.fromJson(json.decode(str));

String getBranchOrdersApiResModelToJson(GetBranchOrdersApiResModel data) =>
    json.encode(data.toJson());

class GetBranchOrdersApiResModel {
  bool? status;
  String? permission;
  List<Order>? orders;

  GetBranchOrdersApiResModel({
    this.status,
    this.permission,
    this.orders,
  });

  factory GetBranchOrdersApiResModel.fromJson(Map<String, dynamic> json) =>
      GetBranchOrdersApiResModel(
        status: json["status"],
        permission: json["permission"],
        orders: json["orders"] == null
            ? []
            : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "permission": permission,
        "orders": orders == null
            ? []
            : List<dynamic>.from(orders!.map((x) => x.toJson())),
      };
}

class Order {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? latitude;
  String? longitude;
  String? imageOne;
  String? imageTwo;
  String? video;
  String? place;
  int? branchId;
  int? clientId;

  Order({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.latitude,
    this.longitude,
    this.imageOne,
    this.imageTwo,
    this.video,
    this.place,
    this.branchId,
    this.clientId,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        imageOne: json["image_one"],
        imageTwo: json["image_two"],
        video: json["video"],
        place: json["place"],
        branchId: json["branch_id"],
        clientId: json["client_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "latitude": latitude,
        "longitude": longitude,
        "image_one": imageOne,
        "image_two": imageTwo,
        "video": video,
        "place": place,
        "branch_id": branchId,
        "client_id": clientId,
      };
}
