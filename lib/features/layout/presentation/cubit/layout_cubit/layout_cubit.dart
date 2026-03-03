import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalam/features/layout/presentation/cubit/layout_cubit/layout_states.dart';

class LayoutCubit extends Cubit<LayoutNavBarState>{
  LayoutCubit() : super(InitialLayoutNavBarState());

  int currentIndex = 0;

  List<Widget> views = [
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    Container(color: Colors.green),
  ];

  changeIndex(int index) {
    currentIndex = index;
    emit(ChangeLayoutNavBarState());
  }
}