import 'package:flutter/cupertino.dart';
import 'package:varens_test/constants/assets_constants.dart';
import 'package:varens_test/constants/colors.dart';

class Coin {
  Image image;
  String percent;
  String amount;
  String name;
  String btc;
  bool isGrey;
  Color color;

  Coin({
    required this.image,
    this.percent = "-1.32%",
    this.amount = "\$24,150.17",
    this.btc = "2.73 BTC",
    required this.name,
    required this.isGrey,
    this.color = AppColors.defaultCoinColor
  });
}

List<Coin> coinsList = [
  Coin(image: Image.asset(Assets.btc_icon), name: "BTC", isGrey: true, color: AppColors.btcCoinColor),
  Coin(image: Image.asset(Assets.eth_icon), name: "ETH", isGrey: false),
  Coin(image: Image.asset(Assets.xrp_icon), name: "XRP", isGrey: true, color: AppColors.xrpCoinColor),
  Coin(image: Image.asset(Assets.btc_icon), name: "LTC", isGrey: false),
  Coin(image: Image.asset(Assets.btc_icon), name: "BTC", isGrey: true, color: AppColors.btcCoinColor),
  Coin(image: Image.asset(Assets.eth_icon), name: "ETH", isGrey: false),
  Coin(image: Image.asset(Assets.xrp_icon), name: "XRP", isGrey: true, color: AppColors.xrpCoinColor),
  Coin(image: Image.asset(Assets.btc_icon), name: "LTC", isGrey: false),
  Coin(image: Image.asset(Assets.btc_icon), name: "BTC", isGrey: true, color: AppColors.btcCoinColor),
  Coin(image: Image.asset(Assets.eth_icon), name: "ETH", isGrey: false),
  Coin(image: Image.asset(Assets.xrp_icon), name: "XRP", isGrey: true, color: AppColors.xrpCoinColor),
  Coin(image: Image.asset(Assets.btc_icon), name: "LTC", isGrey: false),
];