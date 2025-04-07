class ImageResponse {
  ImageResponse.fromJson(dynamic json) {
    id = json['id'];
    isActive = json['is_active'];
    url = json['url'];
  }
  String? id;
  bool? isActive;
  String? url;
}
