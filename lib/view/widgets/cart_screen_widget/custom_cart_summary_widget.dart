import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';

class CustomCartSummaryWidget extends StatelessWidget {
  const CustomCartSummaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25.h,
      width: double.infinity,
      child: BottomAppBar(
        padding: EdgeInsets.only(
          top: 1.5.h,
          bottom: 1.h,
          right: 1.5.h,
          left: 1.5.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Sub-Total : ',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '1000',
                  // '${cart.getCartTotalPrice()}',
                  //'${cart.cartSubPrice}',
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Shipping : ',
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '3',
                  // cart.shipping.toString(),
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              thickness: 1,
              color: AppColor.kMainColor,
              endIndent: 15.0,
              indent: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Price : ',
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '',
                  //'${cart.cartTotalPrices}',
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(AppColor.kMainColor),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)))),
                  minimumSize: MaterialStatePropertyAll(Size(150.0, 45.0)),
                  maximumSize: MaterialStatePropertyAll(Size(150.0, 45.0)),
                ),
                child: Text(
                  'Pay',
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
