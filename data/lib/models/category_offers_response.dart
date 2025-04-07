class CategoryOffersResponse {
  String? id;
  String? tagName;
  String? categoryIdAnnotated;
  String? actionTitle;
  String? actionUrl;
  String? fileUrl;
  String? fileS3Key;
  String? fileExtension;

  CategoryOffersResponse({
    this.id,
    this.tagName,
    this.categoryIdAnnotated,
    this.actionTitle,
    this.actionUrl,
    this.fileUrl,
    this.fileS3Key,
    this.fileExtension,
  });

  factory CategoryOffersResponse.fromJson(Map<String, dynamic> json) =>
      CategoryOffersResponse(
        id: json["id"],
        tagName: json["tag_name"],
        categoryIdAnnotated: json["category_id_annotated"],
        actionTitle: json["action_title"],
        actionUrl: json["action_url"],
        fileUrl: json["file_url"],
        fileS3Key: json["file_s3_key"],
        fileExtension: json["file_extension"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tag_name": tagName,
        "category_id_annotated": categoryIdAnnotated,
        "action_title": actionTitle,
        "action_url": actionUrl,
        "file_url": fileUrl,
        "file_s3_key": fileS3Key,
        "file_extension": fileExtension,
      };
}
