import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../utils/app_colors.dart';

class SettingsTabWidget extends StatelessWidget {
  const SettingsTabWidget({
    super.key,
    required this.onTap,
    required this.title,
    required this.icon,
  });

  final Function onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color:  AppColors.black.withOpacity(0.1),
              blurRadius: .5,
              spreadRadius: .5,
            )
          ],
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade300,
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                  child: FaIcon(
                    icon,
                    color:  AppColors.black.withOpacity(0.6),
                    size: 16,
                  ),
                ),
                const Gap(10),
                Text(
                  title,
                  style: TextStyle(
                    color:  AppColors.black.withOpacity(0.6),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            // FaIcon(
            //   Storage.getString('language') == 'en'
            //       ? FontAwesomeIcons.angleRight
            //       : FontAwesomeIcons.angleLeft,
            //   color: black.withOpacity(0.6),
            // ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:gap/gap.dart';

// class SettingsTabWidget extends StatelessWidget {
//   const SettingsTabWidget({
//     super.key,
//     required this.onTap,
//     required this.title,
//     required this.icon,
//   });

//   final Function onTap;
//   final String title;
//   final IconData icon;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () => onTap(),
//       child: Container(
//         padding: const EdgeInsets.all(15),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: const [
//             BoxShadow(
//               color: Colors.black,
//               blurRadius: .5,
//               spreadRadius: .5,
//             )
//           ],
//           border: Border(
//             bottom: BorderSide(
//               color: Colors.grey.shade300,
//               width: 1,
//             ),
//           ),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 SizedBox(
//                   width: 20,
//                   child: FaIcon(
//                     icon,
//                     color: Colors.black,
//                     size: 16,
//                   ),
//                 ),
//                 const Gap(10),
//                 Text(
//                   title,
//                   style: const TextStyle(
//                     color: Colors.black,
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
