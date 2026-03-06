part of 'video_cubit.dart';

sealed class VideoState {}

final class VideoInitial extends VideoState {}

final class VideoLoading extends VideoState {}

final class VideoFailure extends VideoState {
  final String error;

  VideoFailure(this.error);
}

final class VideoSuccess extends VideoState {
  final List<VideoModel> videos;

  VideoSuccess(this.videos);
}
