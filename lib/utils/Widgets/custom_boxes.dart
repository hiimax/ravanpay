// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../Helpers/theme/zinari.dart';
//
// class CustomeBox extends StatelessWidget {
//   String imageasset;
//   String title;
//   Color color;
//   Color? imagecolor;
//    CustomeBox({Key? key, required this.title,required this.imageasset,required this.color, this.imagecolor}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       height: 115,
//       width: MediaQuery.of(context).size.width/2.5,
//       decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(10),
//           // boxShadow: [
//           //   BoxShadow(
//           //       color: Colors.black.withOpacity(.5),
//           //       blurRadius: 1,
//           //       offset: Offset(0, 0.5)
//           //   )
//           // ]
//       ),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               imageasset,
//               scale: 1.5,
//               color: imagecolor,
//             ),
//
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontFamily: "Helvetica Neue",
//                   fontWeight: FontWeight.w400,
//                   color:  Color(0xff1B0226),
//                   fontSize: 16.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// class CustomeBox1 extends StatelessWidget {
//   String imageasset;
//   String title;
//   Color color;
//    CustomeBox1({Key? key, required this.title,required this.imageasset,required this.color}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       height: 115,
//       width: MediaQuery.of(context).size.width,
//       decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.black,
//                 blurRadius: 8,
//                 offset: Offset(0, 1)
//             )
//           ]
//       ),
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               imageasset,
//               scale: 1.5,
//               color: Zinarihelper.zeenahwhite,
//             ),
//
//             SizedBox(
//               height: 10,
//             ),
//             Text(
//               title,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                   fontFamily: "Helvetica Neue",
//                   fontWeight: FontWeight.bold,
//                   color: Zinarihelper.zeenahwhite,
//                   fontSize: 17.0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
