class VideoModel {
  final String id;
  final String title;
  final String description;
  final String videoUrl;

  VideoModel({
    required this.id,
    required this.title,
    required this.description,
    required this.videoUrl,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    return VideoModel(
      id: json['id'],
      title: json['title'],
      description: json['desc'],
      videoUrl: json['video_url'],
    );
  }
}
