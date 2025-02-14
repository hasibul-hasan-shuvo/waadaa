class OfferBannersResponse {
  String? status;
  List<OfferConfigList>? offerConfigList;

  OfferBannersResponse({
    this.status,
    this.offerConfigList,
  });

  factory OfferBannersResponse.fromJson(Map<String, dynamic> json) =>
      OfferBannersResponse(
        status: json["status"],
        offerConfigList: json["offer_config_list"] == null
            ? []
            : List<OfferConfigList>.from(json["offer_config_list"]!
                .map((x) => OfferConfigList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "offer_config_list": offerConfigList == null
            ? []
            : List<dynamic>.from(offerConfigList!.map((x) => x.toJson())),
      };
}

class OfferConfigList {
  String? title;
  String? subtitle;
  String? actionTitle;
  String? actionUrl;
  String? tagName;
  String? fileUrl;
  String? fileS3Key;
  String? fileExtension;
  String? bgImageUrl;
  String? bgImageS3Key;
  String? bgImageExtension;
  String? previewUrl;
  String? bgImagePreviewUrl;

  OfferConfigList({
    this.title,
    this.subtitle,
    this.actionTitle,
    this.actionUrl,
    this.tagName,
    this.fileUrl,
    this.fileS3Key,
    this.fileExtension,
    this.bgImageUrl,
    this.bgImageS3Key,
    this.bgImageExtension,
    this.previewUrl,
    this.bgImagePreviewUrl,
  });

  factory OfferConfigList.fromJson(Map<String, dynamic> json) =>
      OfferConfigList(
        title: json["title"],
        subtitle: json["subtitle"],
        actionTitle: json["action_title"],
        actionUrl: json["action_url"],
        tagName: json["tag_name"],
        fileUrl: json["file_url"],
        fileS3Key: json["file_s3_key"],
        fileExtension: json["file_extension"],
        bgImageUrl: json["bg_image_url"],
        bgImageS3Key: json["bg_image_s3_key"],
        bgImageExtension: json["bg_image_extension"],
        previewUrl: json["preview_url"],
        bgImagePreviewUrl: json["bg_image_preview_url"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subtitle": subtitle,
        "action_title": actionTitle,
        "action_url": actionUrl,
        "tag_name": tagName,
        "file_url": fileUrl,
        "file_s3_key": fileS3Key,
        "file_extension": fileExtension,
        "bg_image_url": bgImageUrl,
        "bg_image_s3_key": bgImageS3Key,
        "bg_image_extension": bgImageExtension,
        "preview_url": previewUrl,
        "bg_image_preview_url": bgImagePreviewUrl,
      };
}
