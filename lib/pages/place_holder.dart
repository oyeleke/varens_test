import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:varens_test/constants/colors.dart';
import 'package:varens_test/constants/font_family.dart';

class Exchange_Place extends StatelessWidget {
  const Exchange_Place({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.inactiveGray,
      child: Column(
        children: [
          Container(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60, left: 25, right: 25),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        IconButton(onPressed: () {}, icon: buildCircularIcon()),
                        const Spacer(),
                        Text(
                          "Exchange",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: FontFamily.quicksand,
                              fontSize: 30,
                              color: AppColors.textBlackColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 80),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget buildCircularIcon() {
    return Container(
      height: 59,
      width: 59,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 1, color: Colors.black.withAlpha(10))),
      child: Center(
        child: Icon(
          Icons.arrow_back_rounded,
          color: Colors.black,
          size: 23,
        ),
      ),
    );
  }
}
