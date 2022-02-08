
import 'package:flutter/cupertino.dart';

class CoinListBG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final maxWidth = MediaQuery.of(context).size.width;
    final maxHeight = MediaQuery.of(context).size.height;

    return Container(
      width: maxWidth,
      height: maxHeight,
      child: Stack(
        children: [
          Container(
            width: maxWidth,
            height: maxHeight,
            decoration: const BoxDecoration(
              color: CupertinoColors.inactiveGray,
            ),
          ),
        ],
      ),
    );
  }
}