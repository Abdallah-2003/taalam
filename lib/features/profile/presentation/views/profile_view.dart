import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/core/routing/routes.dart';
import 'package:taalam/features/profile/data/repo/profile_repo.dart';
import 'package:taalam/features/profile/presentation/cubit/profile_cubit/profile_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(ProfileRepo())..getProfileData(),
      child: BlocListener<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoggedOut) {
            Navigator.pushNamed(context, AppRoutes.loginView);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.scaffoldBg,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Text("Profile", style: TextStyle(color: Colors.white)),
            centerTitle: true,
          ),
          body: BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              if (state is ProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ProfileFailure) {
                return Center(child: Text(state.error, style: const TextStyle(color: AppColors.primaryPurple)));
              } else if (state is ProfileSuccess) {
                return _buildProfileBody(context, state.name, state.email);
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildProfileBody(BuildContext context, String name, String email) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: AppColors.buttonBlue,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 30),
          _infoTile(Icons.person, "Name", name),
          const SizedBox(height: 15),
          _infoTile(Icons.email, "Email", email),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryPurple,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              ),
              onPressed: () => context.read<ProfileCubit>().logout(),
              child: const Text("Log Out", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1C42),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Icon(icon, color: AppColors.buttonBlue),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}