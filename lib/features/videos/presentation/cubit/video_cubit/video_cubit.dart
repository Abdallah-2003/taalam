
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/features/videos/data/model/video_model.dart';
import 'package:taalam/features/videos/data/repo/video_repo.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  final VideoRepo videoRepo;
  VideoCubit(this.videoRepo) : super(VideoInitial());

  Future<void> getVideos(String courseId) async {
    emit(VideoLoading());
    final result = await videoRepo.getVideos(courseId);
    result.fold(
      (error) => emit(VideoFailure(error)),
      (videos) => emit(VideoSuccess(videos)),
    );
  }
}
