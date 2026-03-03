import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/core/constant/app_colors.dart';
import 'package:taalam/features/home/presentation/views/home_view.dart';
import 'package:taalam/features/layout/presentation/cubit/layout_cubit/layout_states.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(InitialLayoutNavBarState());

  int currentIndex = 0;

  List<Widget> views = [
    HomeView(),
    Container(color: Colors.yellow),
    Container(color: Colors.green),
  ];

  changeIndex(int index) {
    currentIndex = index;
    emit(ChangeLayoutNavBarState());
  }
}
