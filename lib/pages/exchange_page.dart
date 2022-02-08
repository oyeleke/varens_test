import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:varens_test/constants/assets_constants.dart';
import 'package:varens_test/constants/colors.dart';
import 'package:varens_test/constants/font_family.dart';
import 'package:varens_test/models/coin.dart';
import 'package:varens_test/widgets/coin_card.dart';

class Exchange extends StatelessWidget {
  const Exchange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: CupertinoColors.inactiveGray,
        child: Stack(children: [
          SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
               buildExchangeRow(),
                SizedBox(height:60),
                Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15)),
                  ),
                  child: Column(
                    children: [
                      _buildConvertTo(),
                      const SizedBox(height: 6,),
                      _buildList()
                    ],
                  ),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget _buildList(){
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
      itemCount: coinsList.length,
        itemBuilder: (
        BuildContext context, int index){
      final coin = coinsList[index];
      return CoinCard(coin: coin);
    });
  }

  Widget buildExchangeRow(){
    return Container(
      padding: const EdgeInsets.only(top: 60, left: 25, right: 25),
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
    );
  }

  Widget _buildConvertTo(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      child: Row(children: [
        Text(
          "Convert to",
          style: TextStyle(
              color: AppColors.textBlackColor,
              fontFamily: FontFamily.quicksand,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal),
        ),

        Spacer(),

        Image.asset(Assets.close_square)
      ]),
    );
  }

  Widget buildCircularIcon() {
    return SizedBox(
      height: 79,
      width: 79,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: Colors.black.withAlpha(10))),
        child: const Center(
          child: Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
            size: 23,
          ),
        ),
      ),
    );
  }
}
