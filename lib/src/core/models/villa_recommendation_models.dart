class VillaRecommendationsReponse {
    VillaRecommendationsReponse({
        required this.statusCode,
        required this.message,
        required this.data,
    });

    final int? statusCode;
    final String? message;
    final List<Datum> data;

    factory VillaRecommendationsReponse.fromJson(Map<String, dynamic> json){ 
        return VillaRecommendationsReponse(
            statusCode: json["statusCode"],
            message: json["message"],
            data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": data.map((x) => x.toJson()).toList(),
    };

}

class Datum {
    Datum({
        required this.id,
        required this.code,
        required this.alamat,
        required this.description,
        required this.isRecommendation,
        required this.price,
        required this.subCategoryId,
        required this.thumbnail,
        required this.whatsappNumber,
        required this.subCategory,
        required this.facilities,
    });

    final int? id;
    final String? code;
    final String? alamat;
    final String? description;
    final bool? isRecommendation;
    final int? price;
    final String? subCategoryId;
    final String? thumbnail;
    final String? whatsappNumber;
    final SubCategory? subCategory;
    final List<Facility> facilities;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            id: json["id"],
            code: json["code"],
            alamat: json["alamat"],
            description: json["description"],
            isRecommendation: json["is_recommendation"],
            price: json["price"],
            subCategoryId: json["sub_category_id"],
            thumbnail: json["thumbnail"],
            whatsappNumber: json["whatsapp_number"],
            subCategory: json["sub_category"] == null ? null : SubCategory.fromJson(json["sub_category"]),
            facilities: json["facilities"] == null ? [] : List<Facility>.from(json["facilities"]!.map((x) => Facility.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "code": code,
        "alamat": alamat,
        "description": description,
        "is_recommendation": isRecommendation,
        "price": price,
        "sub_category_id": subCategoryId,
        "thumbnail": thumbnail,
        "whatsapp_number": whatsappNumber,
        "sub_category": subCategory?.toJson(),
        "facilities": facilities.map((x) => x.toJson()).toList(),
    };

}

class Facility {
    Facility({
        required this.id,
        required this.value,
        required this.facilityId,
        required this.icon,
        required this.title,
    });

    final int? id;
    final String? value;
    final int? facilityId;
    final String? icon;
    final String? title;

    factory Facility.fromJson(Map<String, dynamic> json){ 
        return Facility(
            id: json["id"],
            value: json["value"],
            facilityId: json["facility_id"],
            icon: json["icon"],
            title: json["title"],
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "facility_id": facilityId,
        "icon": icon,
        "title": title,
    };

}

class SubCategory {
    SubCategory({
        required this.id,
        required this.title,
    });

    final int? id;
    final String? title;

    factory SubCategory.fromJson(Map<String, dynamic> json){ 
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
