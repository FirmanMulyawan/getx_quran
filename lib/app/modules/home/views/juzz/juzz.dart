import '../../../../../component/config/app_const.dart';
import '../../../../../component/config/app_style.dart';
import 'package:flutter/material.dart';

class JuzzView extends StatelessWidget {
  const JuzzView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppConst.imageList))),
            child: Center(
                child: Text(
              "${index + 1}",
              style: const TextStyle(
                color: AppStyle.purpleDark,
              ),
            )),
          ),
          title: Text(
            " Juzz ${index + 1}",
            style: const TextStyle(
              color: AppStyle.purpleDark,
            ),
          ),
        );
      },
    );
  }
}
