// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  int? totalSize;
  String? limit;
  String? offset;
  List<Message>? message;

  MessageModel({
    this.totalSize,
    this.limit,
    this.offset,
    this.message,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        totalSize: json["total_size"],
        limit: json["limit"],
        offset: json["offset"],
        message: json["message"] == null
            ? []
            : List<Message>.from(
                json["message"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_size": totalSize,
        "limit": limit,
        "offset": offset,
        "message": message == null
            ? []
            : List<dynamic>.from(message!.map((x) => x.toJson())),
      };
}

class Message {
  int? id;
  int? userId;
  int? sellerId;
  dynamic adminId;
  dynamic deliveryManId;
  String? message;
  int? sentByCustomer;
  int? sentBySeller;
  dynamic sentByAdmin;
  dynamic sentByDeliveryMan;
  int? seenByCustomer;
  int? seenBySeller;
  dynamic seenByAdmin;
  dynamic seenByDeliveryMan;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? shopId;
  SellerInfo? sellerInfo;

  Message({
    this.id,
    this.userId,
    this.sellerId,
    this.adminId,
    this.deliveryManId,
    this.message,
    this.sentByCustomer,
    this.sentBySeller,
    this.sentByAdmin,
    this.sentByDeliveryMan,
    this.seenByCustomer,
    this.seenBySeller,
    this.seenByAdmin,
    this.seenByDeliveryMan,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.shopId,
    this.sellerInfo,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        userId: json["user_id"],
        sellerId: json["seller_id"],
        adminId: json["admin_id"],
        deliveryManId: json["delivery_man_id"],
        message: json["message"],
        sentByCustomer: json["sent_by_customer"],
        sentBySeller: json["sent_by_seller"],
        sentByAdmin: json["sent_by_admin"],
        sentByDeliveryMan: json["sent_by_delivery_man"],
        seenByCustomer: json["seen_by_customer"],
        seenBySeller: json["seen_by_seller"],
        seenByAdmin: json["seen_by_admin"],
        seenByDeliveryMan: json["seen_by_delivery_man"],
        status: json["status"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        shopId: json["shop_id"],
        sellerInfo: json["seller_info"] == null
            ? null
            : SellerInfo.fromJson(json["seller_info"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "seller_id": sellerId,
        "admin_id": adminId,
        "delivery_man_id": deliveryManId,
        "message": message,
        "sent_by_customer": sentByCustomer,
        "sent_by_seller": sentBySeller,
        "sent_by_admin": sentByAdmin,
        "sent_by_delivery_man": sentByDeliveryMan,
        "seen_by_customer": seenByCustomer,
        "seen_by_seller": seenBySeller,
        "seen_by_admin": seenByAdmin,
        "seen_by_delivery_man": seenByDeliveryMan,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "shop_id": shopId,
        "seller_info": sellerInfo?.toJson(),
      };
}

class SellerInfo {
  int? id;
  String? fName;
  String? lName;
  String? phone;
  String? image;
  String? email;
  String? password;
  String? status;
  dynamic rememberToken;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic bankName;
  dynamic branch;
  dynamic accountNo;
  dynamic holderName;
  String? authToken;
  dynamic salesCommissionPercentage;
  dynamic gst;
  String? cmFirebaseToken;
  String? posStatus;
  List<Shop>? shops;

  SellerInfo({
    this.id,
    this.fName,
    this.lName,
    this.phone,
    this.image,
    this.email,
    this.password,
    this.status,
    this.rememberToken,
    this.createdAt,
    this.updatedAt,
    this.bankName,
    this.branch,
    this.accountNo,
    this.holderName,
    this.authToken,
    this.salesCommissionPercentage,
    this.gst,
    this.cmFirebaseToken,
    this.posStatus,
    this.shops,
  });

  factory SellerInfo.fromJson(Map<String, dynamic> json) => SellerInfo(
        id: json["id"],
        fName: json["f_name"],
        lName: json["l_name"],
        phone: json["phone"],
        image: json["image"],
        email: json["email"],
        password: json["password"],
        status: json["status"],
        rememberToken: json["remember_token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        bankName: json["bank_name"],
        branch: json["branch"],
        accountNo: json["account_no"],
        holderName: json["holder_name"],
        authToken: json["auth_token"],
        salesCommissionPercentage: json["sales_commission_percentage"],
        gst: json["gst"],
        cmFirebaseToken: json["cm_firebase_token"],
        posStatus: json["pos_status"],
        shops: json["shops"] == null
            ? []
            : List<Shop>.from(json["shops"]!.map((x) => Shop.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "f_name": fName,
        "l_name": lName,
        "phone": phone,
        "image": image,
        "email": email,
        "password": password,
        "status": status,
        "remember_token": rememberToken,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "bank_name": bankName,
        "branch": branch,
        "account_no": accountNo,
        "holder_name": holderName,
        "auth_token": authToken,
        "sales_commission_percentage": salesCommissionPercentage,
        "gst": gst,
        "cm_firebase_token": cmFirebaseToken,
        "pos_status": posStatus,
        "shops": shops == null
            ? []
            : List<dynamic>.from(shops!.map((x) => x.toJson())),
      };
}

class Shop {
  int? id;
  String? sellerId;
  String? name;
  String? address;
  String? contact;
  String? image;
  dynamic vacationStartDate;
  dynamic vacationEndDate;
  dynamic vacationNote;
  String? vacationStatus;
  String? temporaryClose;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? banner;

  Shop({
    this.id,
    this.sellerId,
    this.name,
    this.address,
    this.contact,
    this.image,
    this.vacationStartDate,
    this.vacationEndDate,
    this.vacationNote,
    this.vacationStatus,
    this.temporaryClose,
    this.createdAt,
    this.updatedAt,
    this.banner,
  });

  factory Shop.fromJson(Map<String, dynamic> json) => Shop(
        id: json["id"],
        sellerId: json["seller_id"],
        name: json["name"],
        address: json["address"],
        contact: json["contact"],
        image: json["image"],
        vacationStartDate: json["vacation_start_date"],
        vacationEndDate: json["vacation_end_date"],
        vacationNote: json["vacation_note"],
        vacationStatus: json["vacation_status"],
        temporaryClose: json["temporary_close"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "seller_id": sellerId,
        "name": name,
        "address": address,
        "contact": contact,
        "image": image,
        "vacation_start_date": vacationStartDate,
        "vacation_end_date": vacationEndDate,
        "vacation_note": vacationNote,
        "vacation_status": vacationStatus,
        "temporary_close": temporaryClose,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "banner": banner,
      };
}
