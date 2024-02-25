class VillaBloksReponse {
    VillaBloksReponse({
        required this.statusCode,
        required this.message,
        required this.data,
    });

    final int? statusCode;
    final String? message;
    final List<Datum> data;

    factory VillaBloksReponse.fromJson(Map<String, dynamic> json){ 
        return VillaBloksReponse(
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
        required this.block,
        required this.villas,
    });

    final int? id;
    final String? block;
    final List<Villa> villas;

    factory Datum.fromJson(Map<String, dynamic> json){ 
        return Datum(
            id: json["id"],
            block: json["block"],
            villas: json["villas"] == null ? [] : List<Villa>.from(json["villas"]!.map((x) => Villa.fromJson(x))),
        );
    }

    Map<String, dynamic> toJson() => {
        "id": id,
        "block": block,
        "villas": villas.map((x) => x.toJson()).toList(),
    };

}

class Villa {
    Villa({
        required this.id,
        required this.code,
        required this.alamat,
        required this.description,
        required this.isRecommendation,
        required this.price,
        required this.thumbnail,
        required this.whatsappNumber,
        required this.subCategoryId,
        required this.facilities,
    });

    final int? id;
    final String? code;
    final String? alamat;
    final String? description;
    final bool? isRecommendation;
    final int? price;
    final String? thumbnail;
    final String? whatsappNumber;
    final String? subCategoryId;
    final List<Facility> facilities;

    factory Villa.fromJson(Map<String, dynamic> json){ 
        return Villa(
            id: json["id"],
            code: json["code"],
            alamat: json["alamat"],
            description: json["description"],
            isRecommendation: json["is_recommendation"],
            price: json["price"],
            thumbnail: json["thumbnail"],
            whatsappNumber: json["whatsapp_number"],
            subCategoryId: json["sub_category_id"],
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
        "thumbnail": thumbnail,
        "whatsapp_number": whatsappNumber,
        "sub_category_id": subCategoryId,
        "facilities": facilities.map((x) => x.toJson()).toList(),
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

    factory Facility.fromJson(Map<String, dynamic> json){ 
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
