import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class NavigatorBottomBarState extends Equatable {
  final String title;
  final int currentIndex;
  final List<Widget> pages;

  const NavigatorBottomBarState({
    required this.title,
    required this.currentIndex,
    required this.pages,
  });

  @override
  List<Object> get props => [title, currentIndex, pages];

  NavigatorBottomBarState copyWith({
    String? title,
    int? currentIndex,
    List<Widget>? pages,
  }) {
    return NavigatorBottomBarState(
      title: title ?? this.title,
      currentIndex: currentIndex ?? this.currentIndex,
      pages: pages ?? this.pages,
    );
  }
}
