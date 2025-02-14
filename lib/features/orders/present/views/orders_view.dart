import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_effect/shimmer_effect.dart';
import '../../../../helpers/responsive.dart';
import '../../../drawer/my_drawer.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrdersView extends StatefulWidget {
  OrdersView({Key? key});

  @override
  State<OrdersView> createState() => _OrdersViewState();
}

class _OrdersViewState extends State<OrdersView> {
  @override
  Widget build(BuildContext context) {
    // final homeController =
    //     Provider.of<OrdersViewProvider>(context, listen: false);
    @override
    void initState() {
      super.initState();
      // homeController.setCurrentIndex(0);
    }

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          t.home_title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      drawer: const MyDrawer(),
      body: Column(
        children: [
          // Expanded(
          //   flex: 1,
          //   child: BranchesWidget(width: width),
          // ),
          Expanded(
            flex: 6,
            child: Column(
              children: [
                // Expanded(
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: StreamBuilder(
                //       stream: FirebaseFirestore.instance
                //           .collection(targetBranch)
                //           .orderBy('order_id')
                //           .snapshots(),
                //       builder: (BuildContext context,
                //           AsyncSnapshot<QuerySnapshot> snapshot) {
                //         if (!snapshot.hasData) {
                //           return Center(
                //             child: ShimmerEffect(
                //               baseColor: Colors.white,
                //               highlightColor: Colors.green,
                //               child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment:
                //                     CrossAxisAlignment.center,
                //                 children: [
                //                   const Divider(
                //                     thickness: 6,
                //                     color: Colors.red,
                //                   ),
                //                   Text(
                //                     'Loading...',
                //                     textAlign: TextAlign.center,
                //                     style: TextStyle(
                //                       fontSize: 40,
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           );
                //         }
                //         if (snapshot.connectionState ==
                //             ConnectionState.waiting) {
                //           return Center(
                //             child: ShimmerEffect(
                //               baseColor: Colors.white,
                //               highlightColor: Colors.green,
                //               child: const Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment:
                //                     CrossAxisAlignment.center,
                //                 children: [
                //                   Divider(
                //                     thickness: 6,
                //                     color: Colors.red,
                //                   ),
                //                   Text(
                //                     'Loading...',
                //                     textAlign: TextAlign.center,
                //                     style: TextStyle(fontSize: 24),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           );
                //         } else {
                //           return Expanded(
                //             flex: 7,
                //             child: Stack(
                //               children: [
                // Expanded(
                //   flex: 7,
                //   child: ListView.builder(
                //     itemCount: snapshot.data!.docs.length,
                //     itemBuilder:
                //         (BuildContext context, int index) {
                //       // DocumentSnapshot document =
                //       //     snapshot.data!.docs[index];
                //       // String proId = document.id;
                //       return Expanded(
                //         child: Stack(
                //           children: [
                //             Container(
                //               height: height / 3,
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                     color: Colors.grey),
                //                 borderRadius:
                //                     const BorderRadius.all(
                //                   Radius.circular(15),
                //                 ),
                //               ),
                //               child: Card(
                //                 semanticContainer: true,
                //                 clipBehavior: Clip
                //                     .antiAliasWithSaveLayer,
                //                 color:
                //                     Get.theme.brightness ==
                //                             Brightness.dark
                //                         ? Get
                //                             .theme
                //                             .colorScheme
                //                             .surfaceVariant
                //                         : Get
                //                             .theme
                //                             .colorScheme
                //                             .surface,
                //                 child: Res.isMobile(context)
                //                     ? MobileOrdersViewWidget(
                //                         document: document,
                //                         proId: proId)
                //                     : DesktopWidget(
                //                         document: document,
                //                         proId: proId),
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // Selector<OrdersViewProvider, bool>(
                //   selector: (_, provider) =>
                //       provider.isLoading,
                //   builder: (context, isLoading, child) {
                //     if (isLoading) {
                //       return Center(
                //         child: Center(
                //           child: Expanded(
                //             flex: 2,
                //             child: Container(
                //               width: width / 3,
                //               height: height / 3,
                //               decoration: BoxDecoration(
                //                 border: Border.all(
                //                     color: const Color
                //                         .fromARGB(
                //                         0, 158, 158, 158)),
                //                 borderRadius:
                //                     const BorderRadius.all(
                //                   Radius.circular(15),
                //                 ),
                //               ),
                //               child: Container(
                //                 decoration: BoxDecoration(
                //                   border: Border.all(
                //                       color: Colors.black),
                //                   borderRadius:
                //                       const BorderRadius
                //                           .all(
                //                     Radius.circular(15),
                //                   ),
                //                 ),
                //                 child: const Row(
                //                   mainAxisAlignment:
                //                       MainAxisAlignment
                //                           .spaceEvenly,
                //                   children: [
                //                     MyText(
                //                       fieldName:
                //                           'جاري مشاركة الطلب ',
                //                       color: Colors.black,
                //                     ),
                //                     CircularProgressIndicator(),
                //                   ],
                //                 ),
                //               ),
                //             ),
                //           ),
                //         ),
                //       );
                //     } else {
                //       return const SizedBox.shrink();
                //     }
                //   },
                // ),
                //           ],
                //         ),
                //       );
                //     }
                //   },
                // ),
                // ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GestureDetectorWidget extends StatelessWidget {
  GestureDetectorWidget({
    super.key,
    required Null Function() onTap,
  });

  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: const BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: const Icon(
          Icons.location_on,
          color: Colors.green,
        ),
      ),
    );
  }
}
