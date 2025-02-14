import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../drawer/my_drawer.dart';
import '../global_methods/global_methods.dart';
import 'bloc/home_bloc.dart';
import 'bloc/home_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });
  static const String routeName = "HomeView";

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: BlocBuilder<HomeCubit, HomeState>(
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
                child: BlocBuilder<HomeCubit, HomeState>(
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
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  return SalomonBottomBar(
                    curve: Curves.slowMiddle,
                    currentIndex: state.currentIndex,
                    backgroundColor: const Color.fromARGB(0, 255, 255, 255),
                    onTap: (int index) {
                      context.read<HomeCubit>().setCurrentIndex(index, context);
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
                          t.home_title,
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
                          t.add_order,
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
