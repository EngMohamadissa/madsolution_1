// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:freely/core/const.dart';
// import 'package:freely/core/utils/app_router.dart';

// class RowLoginBodyForget extends StatelessWidget {
//   const RowLoginBodyForget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 18),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               const Text(
//                 'Forget password',
//                 style: TextStyle(color: kPrimaryColorblack),
//               ),
//               const Icon(Icons.chevron_right),
//               InkWell(
//                 onTap: () {
//                   GoRouter.of(context).push(AppRouter.kForgetView);
//                 },
//                 child: const Text(
//                   'Click here',
//                   style: TextStyle(
//                     color: kPrimaryColorblack,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
