import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/features/home/presentation/views/home_view.dart';
import 'package:taalam/features/layout/presentation/cubit/layout_cubit/layout_states.dart';
import 'package:taalam/features/my_courses/presentation/views/my_courses_view.dart';
import 'package:taalam/features/profile/presentation/views/profile_view.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialLayoutNavBarState());

  int currentIndex = 0;

  List<Widget> views = [
    HomeView(),
    MyCoursesView(),
    ProfileView(),
  ];

  changeIndex(int index) {
    currentIndex = index;
    emit(ChangeLayoutNavBarState());
  }
}
