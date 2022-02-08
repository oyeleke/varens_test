import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:varens_test/constants/assets_constants.dart';
import 'package:varens_test/constants/colors.dart';
import 'package:varens_test/constants/font_family.dart';
import 'package:varens_test/models/coin.dart';
import 'package:varens_test/pages/exchange_page.dart';
import 'package:varens_test/widgets/coin_card.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class GraphPage extends StatelessWidget {
  bool _isCandleStick = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 47,
          ),
          _buildFirstRow(),
          SizedBox(
            height: 47,
          ),
          _buildTitleText(),
          SizedBox(
            height: 27,
          ),
          CoinCard(
            coin: coinsList[0],
            isExchange: false,
          ),
          SizedBox(
            height: 26,
          ),
          _buildGraphTimeOptions(),
          SizedBox(
            height: 23,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                height: 360, width: double.infinity, child: _buildGraph()),
          ),
          SizedBox(
            height: 39,
          ),
          _buildButtons(),
          SizedBox(
            height: 30,
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "About",
                style: TextStyle(
                    color: AppColors.textBlackColor,
                    fontSize: 16,
                    fontFamily: FontFamily.quicksand,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
                textAlign: TextAlign.right,
              ),
            ),
            Spacer()
          ]),
          SizedBox(
            height: 8,
          ),
          _buildDummyText(),
          SizedBox(
            height: 30,
          ),
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Text(
                "Markets Stats",
                style: TextStyle(
                    color: AppColors.textBlackColor,
                    fontSize: 16,
                    fontFamily: FontFamily.quicksand,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
                textAlign: TextAlign.right,
              ),
            ),
            Spacer()
          ]),
          SizedBox(
            height: 9,
          ),
          _buildMarketStatsRows(
              true, Assets.market_cap, "Market Cap", "41,228.00 BTC"),
          _buildMarketStatsRows(
              false, Assets.volume, "Volume (24 h)", "\$12,999.00"),
          _buildMarketStatsRows(
              true, Assets.available_supply, "Available Supply", "9,771.64")
        ],
      ),
    );
  }

  Widget _buildFirstRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Row(
        children: [
          buildCircularIcon(Assets.dummy_image),
          const Spacer(),
          buildCircularIcon(Assets.four_dots)
        ],
      ),
    );
  }

  Widget _buildTitleText() {
    return Column(
      children: [
        _buildPriceText(),
        SizedBox(
          height: 8,
        ),
        _buildSmallerPrices(),
      ],
    );
  }

  Widget _buildButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        children: [
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.lightPeachColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  fixedSize: MaterialStateProperty.all<Size>(Size(147, 61))),
              child: Text(
                "Sell",
                style: TextStyle(
                    fontFamily: FontFamily.quicksand,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: AppColors.hintTextColor),
              )),
          const Spacer(),
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      AppColors.deepGreenColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0))),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(147, 61))),
              child: Text(
                "BUY",
                style: TextStyle(
                    fontFamily: FontFamily.quicksand,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: Colors.white),
              )),
        ],
      ),
    );
  }

  Widget _buildGraphTimeOptions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "24H",
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                fontFamily: FontFamily.quicksand,
                color: AppColors.deepGreenColor,
                fontStyle: FontStyle.normal),
          ),
          Spacer(),
          _buildTimeOptionsString("1W"),
          Spacer(),
          _buildTimeOptionsString("1M"),
          Spacer(),
          _buildTimeOptionsString("1Y"),
          Spacer(),
          _buildTimeOptionsString("All"),
          Spacer(),
          Image.asset(Assets.setting,
              color: this._isCandleStick
                  ? AppColors.textBlackColor
                  : AppColors.deepGreenColor)
        ],
      ),
    );
  }

  Widget _buildTimeOptionsString(String text) {
    return Text(
      text,
      style: TextStyle(
          color: AppColors.textBlackColor.withAlpha(104),
          fontSize: 14,
          fontFamily: FontFamily.quicksand,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal),
    );
  }

  Widget _buildPriceText() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "123.342,62",
          style: TextStyle(
              fontFamily: FontFamily.quicksand,
              fontSize: 38,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: AppColors.textBlackColor),
        ),
        SizedBox(
          width: 8,
        ),
        Container(
          margin: EdgeInsets.only(bottom: 6),
          child: Text("USD",
              style: TextStyle(
                  fontFamily: FontFamily.quicksand,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  fontStyle: FontStyle.normal,
                  color: AppColors.textBlackColor.withAlpha(102))),
        )
      ],
    );
  }

  Widget _buildSmallerPrices() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "\$123.342,62",
          style: TextStyle(
              fontFamily: FontFamily.quicksand,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              color: AppColors.textgreenColor),
        ),
        SizedBox(
          width: 4,
        ),
        Text("+8.1%",
            style: TextStyle(
                fontFamily: FontFamily.quicksand,
                fontSize: 12,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
                color: AppColors.textBlackColor.withAlpha(102)))
      ],
    );
  }

  Widget _buildDummyText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Text(
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mattis posuere non tellus dictum at. Integer eget sed amet nisi, elit odio.",
        textAlign: TextAlign.start,
        softWrap: true,
        maxLines: 3,
        style: TextStyle(
          height: 2,
          color: AppColors.textBlackColor,
          fontFamily: FontFamily.quicksand,
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }

  Widget _buildMarketStatsRows(
      bool isGrey, String imageString, String title, String value) {
    return Container(
      color: isGrey ? AppColors.coinListGreyColor : Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 18),
        child: Row(
          children: [
            Image.asset(imageString),
            SizedBox(
              width: 14,
            ),
            Text(title,
                style: TextStyle(
                    fontFamily: FontFamily.quicksand,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    color: AppColors.textBlackColor)),
            Spacer(),
            Text(value,
                style: TextStyle(
                    fontFamily: FontFamily.quicksand,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    color: AppColors.textBlackColor.withAlpha(155))),
          ],
        ),
      ),
    );
  }

  Widget buildCircularIcon(String image) {
    return SizedBox(
      height: 41,
      width: 41,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(width: 1, color: Colors.black.withAlpha(10))),
        child: Center(child: Image.asset(image)),
      ),
    );
  }

  Widget _buildGraph() {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: charts.LineChart(_createRandomData(),
          defaultRenderer:
              charts.LineRendererConfig(includeArea: true, stacked: true),
          animate: false),
    );
  }

  static List<charts.Series<LinearSales, num>> _createRandomData() {
    final random = Random();

    final myFakeDesktopData = [
      LinearSales(0, random.nextInt(100)),
      LinearSales(1, random.nextInt(100)),
      LinearSales(2, random.nextInt(100)),
      LinearSales(3, random.nextInt(100)),
    ];

    return [
      charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: myFakeDesktopData,
      ),
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
