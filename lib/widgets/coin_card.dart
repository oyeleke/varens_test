import 'dart:math';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:varens_test/constants/colors.dart';
import 'package:varens_test/constants/font_family.dart';
import 'package:varens_test/models/coin.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:varens_test/pages/exchange_page.dart';

class CoinCard extends StatefulWidget {
  final Coin coin;
  final bool isExchange;

  CoinCard({Key? key, required this.coin, this.isExchange = true})
      : super(key: key);

  @override
  State<CoinCard> createState() => _CoinCardState();
}

class _CoinCardState extends State<CoinCard> {
  var random = Random(1);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      child: Container(
          color:
              widget.coin.isGrey ? AppColors.coinListGreyColor : Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
            child: WideCard(
              coin: widget.coin,
              isExchange: widget.isExchange,
            ),
          )),
    );
  }
}

class WideCard extends StatelessWidget {
  final Coin coin;
  final bool isExchange;
  List<_DummyData> data = [
    _DummyData('Jan', 35),
    _DummyData('Feb', 28),
    _DummyData('Mar', 34),
    _DummyData('Apr', 32),
    _DummyData('May', 40)
  ];

  WideCard({Key? key, required this.coin, this.isExchange = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildIconWithBG(coin.image),
        SizedBox(
          width: 16,
        ),
        Column(
          children: [
            Text(
              coin.name,
              style: TextStyle(
                  color: coin.color,
                  fontFamily: FontFamily.quicksand,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.normal),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              coin.percent,
              style: TextStyle(
                color: AppColors.textBlackColor.withAlpha(102),
                fontFamily: FontFamily.quicksand,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Spacer(),
        _buildGraph(coin.color),
        Spacer(),
        isExchange
            ? Column(
                children: [
                  Text(
                    "\$24,150.17",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: AppColors.textBlackColor,
                      fontFamily: FontFamily.quicksand,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Text(
                    coin.btc,
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      color: AppColors.textBlackColor.withAlpha(102),
                      fontFamily: FontFamily.quicksand,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            : OutlinedButton(
                onPressed: () {
                  showMaterialModalBottomSheet(
                    expand: false,
                    enableDrag: true,
                    isDismissible: true,
                    duration: const Duration(milliseconds: 400),
                    context: context,
                    builder: (context) => Exchange()
                  );
                },
                child: const Text(
                  "Change",
                  style: TextStyle(
                      color: AppColors.textPurpleColor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 10),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0))),
                    fixedSize: MaterialStateProperty.all<Size>(const Size(80, 25))),
              ),
      ],
    );
  }

  Widget _buildGraph(Color color) {
    return SizedBox(
      height: 35,
      width: 75,
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          //Initialize the spark charts widget
          child: SfSparkLineChart.custom(
            //Enable the trackball
            axisLineColor: Colors.transparent,
            trackball: const SparkChartTrackball(
                activationMode: SparkChartActivationMode.tap),
            //Enable marker
            marker: const SparkChartMarker(
                displayMode: SparkChartMarkerDisplayMode.none),
            //Enable data label

            labelDisplayMode: SparkChartLabelDisplayMode.none,
            xValueMapper: (int index) => data[index].year,
            yValueMapper: (int index) => data[index].sales,
            color: color,
            dataCount: 5,
          ),
        ),
      ),
    );
  }

  Widget _buildIconWithBG(Image image) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: coin.isGrey ? Colors.white : AppColors.coinListGreyColor,
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        Center(
          child: image,
        )
      ]),
    );
  }
}

class _DummyData {
  _DummyData(this.year, this.sales);

  final String year;
  final double sales;
}
