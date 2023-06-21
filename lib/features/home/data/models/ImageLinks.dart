class ImageLinks {
  ImageLinks({
      required this.smallThumbnail,
      required this.thumbnail,});

  ImageLinks.fromJson(dynamic json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }
  late final String smallThumbnail;
  late final String thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['smallThumbnail'] = smallThumbnail;
    map['thumbnail'] = thumbnail;
    return map;
  }

}