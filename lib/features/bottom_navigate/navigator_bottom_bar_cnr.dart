import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../generated/l10n.dart';
import '../../test_one.dart';
import '../home/view/home_view.dart';

class NavigatorBottomBarState {
  final String title;
  final int currentIndex;
  final List<Widget> pages;

  NavigatorBottomBarState({
    required this.title,
    required this.currentIndex,
    required this.pages,
  });
}

class NavigatorBottomBarCubit extends Cubit<NavigatorBottomBarState> {
  NavigatorBottomBarCubit()
      : super(
          NavigatorBottomBarState(
            title: 'Home',
            currentIndex: 0,
            pages: [
              FileUploadScreen(),
              const HomeView(),
            ],
          ),
        );

  void setCurrentIndex(int index, BuildContext context) {
    String title;
    switch (index) {
      case 0:
        title = S.of(context).home_title;
        break;
      case 1:
        title = S.of(context).add_order;
        break;
      default:
        title = S.of(context).home_title;
    }
    emit(
      NavigatorBottomBarState(
        title: title,
        currentIndex: index,
        pages: state.pages,
      ),
    );
  }
}
