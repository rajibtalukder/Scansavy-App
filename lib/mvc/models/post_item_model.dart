class PostItemModel {
  String name;
  String category;
  String link;
  String tag;
  String imageUrl;

  PostItemModel({
    required this.name,
    required this.category,
    required this.link,
    required this.tag,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'category': category,
      'link': link,
      'tag': tag,
      'imageUrl': imageUrl,
    };
  }

  factory PostItemModel.fromMap(Map<String, dynamic> map) {
    return PostItemModel(
      name: map['name'],
      category: map['category'],
      link: map['link'],
      tag: map['tag'],
      imageUrl: map['imageUrl'],
    );
  }
}
