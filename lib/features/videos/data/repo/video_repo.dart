import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:taalam/features/videos/data/model/video_model.dart';

class VideoRepo {
  final supabase = Supabase.instance.client;

  Future<Either<String, List<VideoModel>>> getVideos(String courseId) async {
    try {
      final res = await supabase
          .from('videos')
          .select()
          .eq('course_id', courseId);

      List<VideoModel> videos = [];

      for (var video in res) {
        videos.add(VideoModel.fromJson(video));
      }

      return right(videos);
    } on Exception catch (e) {
      return left(e.toString());
    }
  }
}
