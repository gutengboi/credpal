// import 'package:flutter/material.dart';
//
// class MerchantItem extends StatelessWidget {
//   final String name;
//   final String imageUrl;
//   final bool isAsset;
//
//   const MerchantItem({
//     super.key,
//     required this.name,
//     required this.imageUrl,
//     this.isAsset = true,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Stack(
//           children: [
//             Container(
//               width: 65,
//               height: 75,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: const Color(0xFFFE2B5E),
//                 image: DecorationImage(
//                   image: isAsset ? AssetImage(imageUrl) : NetworkImage(imageUrl) as ImageProvider,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Positioned(
//               top: 0,
//               right: 2,
//               child: Container(
//                 width: 15,
//                 height: 15,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   border: Border.all(color: Colors.white, width: 2),
//                   shape: BoxShape.circle,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 6),
//         Text(
//           name,
//           style: const TextStyle(fontSize: 12),
//           textAlign: TextAlign.center,
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class MerchantItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final bool isAsset;
  final bool showStatusIndicator;

  const MerchantItem({
    super.key,
    required this.name,
    required this.imageUrl,
    this.isAsset = true,
    this.showStatusIndicator = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: 65,
              height: 75,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFFFE2B5E),
                image: DecorationImage(
                  image: isAsset ? AssetImage(imageUrl) : NetworkImage(imageUrl) as ImageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            if (showStatusIndicator)
              Positioned(
                top: 5,
                right: 2,
                child: Container(
                  width: 16,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    border: Border.all(color: Colors.white, width: 3),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}