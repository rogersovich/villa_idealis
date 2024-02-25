class VillaResponse {
  VillaResponse({
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final int? statusCode;
  final String? message;
  final Data? data;

  factory VillaResponse.fromJson(Map<String, dynamic> json) {
    return VillaResponse(
      statusCode: json["statusCode"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.subCategoryId,
    required this.thumbnail,
    required this.description,
    required this.alamat,
    required this.whatsappNumber,
    required this.price,
    required this.code,
    required this.isRecommendation,
    required this.subCategory,
    required this.facility,
    required this.galleries,
  });

  final int? id;
  final String? subCategoryId;
  final String? thumbnail;
  final String? description;
  final String? alamat;
  final String? whatsappNumber;
  final int? price;
  final String? code;
  final bool? isRecommendation;
  final SubCategory? subCategory;
  final List<Facility> facility;
  final List<Gallery> galleries;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"],
      subCategoryId: json["sub_category_id"],
      thumbnail: json["thumbnail"],
      description: json["description"],
      alamat: json["alamat"],
      whatsappNumber: json["whatsapp_number"],
      price: json["price"],
      code: json["code"],
      isRecommendation: json["is_recommendation"],
      subCategory: json["sub_category"] == null
          ? null
          : SubCategory.fromJson(json["sub_category"]),
      facility: json["facility"] == null
          ? []
          : List<Facility>.from(
              json["facility"]!.map((x) => Facility.fromJson(x))),
      galleries: json["galleries"] == null
          ? []
          : List<Gallery>.from(
              json["galleries"]!.map((x) => Gallery.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "sub_category_id": subCategoryId,
        "thumbnail": thumbnail,
        "description": description,
        "alamat": alamat,
        "whatsapp_number": whatsappNumber,
        "price": price,
        "code": code,
        "is_recommendation": isRecommendation,
        "sub_category": subCategory?.toJson(),
        "facility": facility.map((x) => x.toJson()).toList(),
        "galleries": galleries.map((x) => x.toJson()).toList(),
      };
}

class Facility {
  Facility({
    required this.id,
    required this.value,
    required this.fasilitasId,
    required this.icon,
    required this.title,
  });

  final int? id;
  final String? value;
  final String? fasilitasId;
  final String? icon;
  final String? title;

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: json["id"],
      value: json["value"],
      fasilitasId: json["fasilitas_id"],
      icon: json["icon"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "fasilitas_id": fasilitasId,
        "icon": icon,
        "title": title,
      };
}

class Gallery {
  Gallery({
    required this.id,
    required this.image,
  });

  final int? id;
  final String? image;

  factory Gallery.fromJson(Map<String, dynamic> json) {
    return Gallery(
      id: json["id"],
      image: json["image"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}

class SubCategory {
  SubCategory({
    required this.id,
    required this.title,
  });

  final int? id;
  final String? title;

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      id: json["id"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
      };
}
