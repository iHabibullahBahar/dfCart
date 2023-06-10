class BannerModel {
  final int id;
  final String name;
  final String url;
  BannerModel({required this.id, required this.name, required this.url});
  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      name: json['name'],
      url: json['url'],
    );
  }
}
