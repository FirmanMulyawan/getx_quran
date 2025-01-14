// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// import 'package:get/get.dart';

// import '../../../../component/config/app_const.dart';
// import '../../../../component/config/app_style.dart';
// import '../../../data/models/ayat.dart' as ayat;
// import '../../../data/models/juzz.dart' as juzz;
// import '../controllers/detail_juz_controller.dart';

// class DetailJuzView extends GetView<DetailJuzController> {
//   final juzz.JuzzQuran detailJuzz = Get.arguments["juz"];
//   final List<ayat.Surah> allSurahInThisJuzz = Get.arguments["surah"];

//   DetailJuzView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Juzz ${detailJuzz.juz}'),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(20),
//         itemCount: detailJuzz.verses?.length,
//         itemBuilder: (context, index) {
//           if (detailJuzz.verses?.isEmpty == true || detailJuzz.verses == null) {
//             return const Center(child: Text("Tidak ada data"));
//           }

//           juzz.Verses? ayat = detailJuzz.verses?[index];
//           if (index != 0) {
//             if (ayat?.number?.inSurah == 1) {
//               controller.index++;
//             }
//           }

//           return Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: AppStyle.purpleLight2.withOpacity(0.3),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             margin: const EdgeInsets.only(right: 10),
//                             height: 40,
//                             width: 40,
//                             decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage(Get.isDarkMode
//                                       ? AppConst.imageListDark
//                                       : AppConst.imageList),
//                                   fit: BoxFit.contain),
//                             ),
//                             child:
//                                 Center(child: Text("${ayat?.number?.inSurah}")),
//                           ),
//                           Text(
//                             allSurahInThisJuzz[controller.index]
//                                     .name
//                                     ?.transliteration
//                                     ?.id ??
//                                 "",
//                             style: const TextStyle(
//                               fontStyle: FontStyle.italic,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                               onPressed: () {},
//                               icon: const Icon(Icons.bookmark_add_outlined)),
//                           IconButton(
//                               onPressed: () {},
//                               icon: const Icon(Icons.play_arrow))
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const Gap(20),
//               Padding(
//                 padding: const EdgeInsets.only(left: 20),
//                 child: Text(
//                   "${ayat?.text?.arab}",
//                   style: const TextStyle(fontSize: 25),
//                 ),
//               ),
//               const Gap(10),
//               Text(
//                 "${ayat?.text?.transliteration?.en}",
//                 textAlign: TextAlign.end,
//                 style:
//                     const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
//               ),
//               const Gap(25),
//               Text(
//                 "${ayat?.translation?.id}",
//                 textAlign: TextAlign.justify,
//                 style: const TextStyle(fontSize: 18),
//               ),
//               const Gap(50)
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
