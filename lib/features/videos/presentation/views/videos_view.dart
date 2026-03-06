import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/constant/app_strings.dart';
import 'package:taalam/core/theme/text_styles.dart';
import 'package:taalam/features/videos/data/repo/video_repo.dart';
import 'package:taalam/features/videos/presentation/cubit/video_cubit/video_cubit.dart';
import 'package:taalam/features/videos/presentation/views/widgets/video_item.dart';

class VideosView extends StatelessWidget {
  final String courseId;
  const VideosView({super.key, required this.courseId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VideoCubit(VideoRepo())..getVideos(courseId),
      child: BlocBuilder<VideoCubit, VideoState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: AppColors.scaffoldBg,
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              centerTitle: true,
              iconTheme: const IconThemeData(color: Colors.white),
              title: const Text(
                AppStrings.courseVideos,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            body: state is VideoLoading
                ? Center(child: CircularProgressIndicator())
                : state is VideoFailure
                ? Center(child: Text(state.error))
                : state is VideoSuccess
                ? state.videos.isEmpty
                      ? Center(child: Text(AppStrings.noVideosFound, style: AppTextStyles.styleNormal16,))
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: ListView.builder(
                            itemCount: state.videos.length,
                            itemBuilder: (context, index) {
                              return VideoItem(
                                videoModel: state.videos[index],
                                onPlayTap: () {},
                              );
                            },
                          ),
                        )
                : SizedBox(),
          );
        },
      ),
    );
  }
}
