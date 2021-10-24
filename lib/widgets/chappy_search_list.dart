// import 'package:flutter/material.dart';
// import 'package:flutter_mobx/flutter_mobx.dart';
// import 'package:projects/modules/profile/models/profile.dart';
// import 'package:projects/widgets/chappy_list_tile.dart';
// import 'package:projects/widgets/chappy_title.dart';
//
// class ChappySearchList extends StatelessWidget {
//   final List<Profile> profiles;
//   final Function(String)? onSelected;
//
//   const ChappySearchList({Key? key, required this.profiles, this.onSelected}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 16),
//           const ChappyTitle(
//             title: 'Search profile',
//           ),
//           const SizedBox(height: 16),
//           Expanded(
//             child: ListView.builder(
//                 itemCount: profiles.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ChappyListTile(
//                     onPressed: () => onSelected!(profiles[index].uuid),
//                     leading: Image.network(
//                       'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
//                       width: 20,
//                     ),
//                     title: Text(profiles[index].name),
//                     trailing: Icon(
//                       Icons.arrow_forward_ios_outlined,
//                       size: 20,
//                       color: Colors.grey.shade400,
//                     ),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
