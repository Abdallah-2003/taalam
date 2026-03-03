class CoursesModel {
  final String id;
  final String title;
  final String desc;
  final num price;
  final String imageUrl;


  CoursesModel({
    required this.id,
    required this.desc,
    required this.title,
    required this.price,
    required this.imageUrl,
  });

  factory CoursesModel.fromJson(Map<String, dynamic> json) {
    return CoursesModel(
      id: json['id'] ,
      title: json['title'],
      desc: json['desc'],
      price: json['price'],
      imageUrl: json['image'],
    );
  }
}