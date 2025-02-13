import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../generated/l10n.dart';
import '../../add_order/views/add_order_view.dart';
import '../../home/view/home_view.dart';
import 'bottom_navigate_state.dart';

class NavigatorBottomBarCubit extends Cubit<NavigatorBottomBarState> {
  NavigatorBottomBarCubit()
      : super(NavigatorBottomBarState(
          title: 'Home',
          currentIndex: 0,
          pages: [
            HomeView(),
            AddOrderView(),
          ],
        ));

  void setCurrentIndex(int index, BuildContext context) {
    switch (index) {
      case 0:
        emit(state.copyWith(
          title: S.of(context)!.home_title,
          currentIndex: index,
        ));
        break;
      case 1:
        emit(state.copyWith(
          title: S.of(context)!.add_order,
          currentIndex: index,
        ));
        break;
    }
  }
}
