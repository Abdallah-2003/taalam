class VideoModel {
  final String id;
  final String title;
  final String description;
  final String videoUrl;
  final String videoImageUrl;

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
    required this.videoImageUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      title: json['title'],
      description: json['desc'],
      videoUrl: json['video_url'],
      videoImageUrl: json['video_image_url'],
    );
  }
}
