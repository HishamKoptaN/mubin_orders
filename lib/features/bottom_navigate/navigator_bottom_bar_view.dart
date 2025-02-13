import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../generated/l10n.dart';
import '../drawer/my_drawer.dart';
import '../global_methods/global_methods.dart';
import 'bloc/bottom_navigate_bloc.dart';
import 'bloc/bottom_navigate_state.dart';

class NavigateBarView extends StatelessWidget {
  const NavigateBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigatorBottomBarCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title:
                BlocBuilder<NavigatorBottomBarCubit, NavigatorBottomBarState>(
              builder: (context, state) {
                return Text(
                  state.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ),
          drawer: const MyDrawer(),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.76,
                width: MediaQuery.of(context).size.width * 0.95,
                child: BlocBuilder<NavigatorBottomBarCubit,
                    NavigatorBottomBarState>(
                  builder: (context, state) {
                    return state.pages[state.currentIndex];
                  },
                ),
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: const BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child:
                  BlocBuilder<NavigatorBottomBarCubit, NavigatorBottomBarState>(
                builder: (context, state) {
                  return SalomonBottomBar(
                    curve: Curves.slowMiddle,
                    currentIndex: state.currentIndex,
                    backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                    onTap: (int index) {
                      context
                          .read<NavigatorBottomBarCubit>()
                          .setCurrentIndex(index, context);
                    },
                    items: [
                      SalomonBottomBarItem(
                        selectedColor: Colors.green,
                        unselectedColor: Colors.grey,
                        icon: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.black,
                                Colors.black,
                              ],
                            ).createShader(bounds);
                          },
                          child: const Icon(
                            Icons.home,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          S.of(context).home_title,
                          style: TextStyle(
                            fontSize: setFont(context, 12),
                          ),
                        ),
                      ),
                      SalomonBottomBarItem(
                        selectedColor: Colors.green,
                        unselectedColor: Colors.grey,
                        icon: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Colors.black, Colors.black],
                            ).createShader(bounds);
                          },
                          child: const Icon(
                            Icons.add_circle,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          S.of(context).add_order,
                          style: TextStyle(
                            fontSize: setFont(context, 12),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
