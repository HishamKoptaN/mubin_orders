import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

import '../../../helpers/responsive.dart';
import '../home_controller.dart';
import 'package:provider/provider.dart';

import 'widgets.dart';

class BranchesWidget extends StatelessWidget {
  const BranchesWidget({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: value.isArabic()
              ? value.branchArData.length
              : value.branchEnData.length,
          itemBuilder: (BuildContext context, int index) {
            var branch = value.isArabic()
                ? value.branchArData[index]
                : value.branchEnData[index];
            return SizedBox(
              width: Res.isMobile(context) ? width / 2.5 : width / 8,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () async {
                    value.setCurrentIndex(index);
                  },
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: width / 2,
                          color: Colors.green,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                flex: 1,
                                child: CircleAvatar(
                                  child: CountryFlag.fromCountryCode(
                                    branch['flag'],
                                    borderRadius: 120,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: MyText(
                                  fieldName: branch['name'],
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Divider(
                          thickness: 3,
                          color: index == value.currentIndex
                              ? Colors.red
                              : Colors.grey,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
