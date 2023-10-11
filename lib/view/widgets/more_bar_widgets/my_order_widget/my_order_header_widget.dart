import 'package:flutter/material.dart';

import 'my_order_txt_widget.dart';

class MyOrderHeaderWidget extends StatelessWidget {
  final int headerLength;
  final List<String> textList;

  const MyOrderHeaderWidget(
      {super.key, required this.headerLength, required this.textList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: headerLength,
              itemBuilder: (context, index) {
                return MyOrderTxtWidget(
                  text: textList[index],
                );
              }),
        ],
      ),
    );
  }
}
