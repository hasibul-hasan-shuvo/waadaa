class HeroBannersResponse {
  String? id;
  String? title;
  String? subtitle;
  String? actionTitle;
  String? actionUrl;
  String? fileUrl;
  String? fileS3Key;
  String? fileExtension;
  String? brandIconUrl;
  String? brandIconS3Key;
  String? filePreviewUrl;
  String? brandIconPreviewUrl;

  HeroBannersResponse({
    this.id,
    this.title,
    this.subtitle,
    this.actionTitle,
    this.actionUrl,
    this.fileUrl,
    this.fileS3Key,
    this.fileExtension,
    this.brandIconUrl,
    this.brandIconS3Key,
    this.filePreviewUrl,
    this.brandIconPreviewUrl,
  });

  factory HeroBannersResponse.fromJson(Map<String, dynamic> json) =>
      HeroBannersResponse(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        actionTitle: json["action_title"],
        actionUrl: json["action_url"],
        fileUrl: json["file_url"],
        fileS3Key: json["file_s3_key"],
        fileExtension: json["file_extension"],
        brandIconUrl: json["brand_icon_url"],
        brandIconS3Key: json["brand_icon_s3_key"],
        filePreviewUrl: json["file_preview_url"],
        brandIconPreviewUrl: json["brand_icon_preview_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "subtitle": subtitle,
        "action_title": actionTitle,
        "action_url": actionUrl,
        "file_url": fileUrl,
        "file_s3_key": fileS3Key,
        "file_extension": fileExtension,
        "brand_icon_url": brandIconUrl,
        "brand_icon_s3_key": brandIconS3Key,
        "file_preview_url": filePreviewUrl,
        "brand_icon_preview_url": brandIconPreviewUrl,
      };
}
