import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/core/utils/constants/constant_color.dart';
import 'package:e_commerce_app/view/widgets/more_bar_widgets/my_order_widget/my_order_btn_widget.dart';
import 'package:e_commerce_app/view/widgets/more_bar_widgets/my_order_widget/my_order_header_widget.dart';
import 'package:e_commerce_app/view/widgets/more_bar_widgets/my_order_widget/my_order_txt_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../view_model/more_bar_view_model/my_order_view_model.dart';
import '../../widgets/main_app_bar_widget/main_appbar_widget.dart';

class MyOrdersSc extends StatelessWidget {
  const MyOrdersSc({super.key});

  @override
  Widget build(BuildContext context) {
    final myOrdersViewModel = Provider.of<MyOrdersViewModel>(context);
    return Scaffold(
      appBar: const MainAppbarWidget(
        appbarTitle: 'My Orders',
      ),
      body: SafeArea(
        child: StreamBuilder(
          stream: myOrdersViewModel.fetOrderData(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Error Found in Connection',
                    style: TextStyle(fontSize: 15.sp),
                  ),
                );
              }
              if (snapshot.hasData) {
                var orderData = snapshot.data!.docs;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    DocumentSnapshot documentSnapshot = orderData[index];
                    Timestamp dateTime = documentSnapshot['date'];
                    return Container(
                      padding: EdgeInsets.only(top: 1.h, left: 2.h, right: 2.h),
                      margin: EdgeInsets.only(top: 1.h, left: 2.h, right: 2.h),
                      decoration: BoxDecoration(
                          color: AppColor.kMainColor.withOpacity(0.1),
                          borderRadius:
                              BorderRadius.all(Radius.circular(1.5.h))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyOrderHeaderWidget(
                                headerLength: myOrdersViewModel.txtOrder.length,
                                textList: myOrdersViewModel.txtOrder,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyOrderTxtWidget(
                                      text: DateFormat('yyyy-MM-dd').format(dateTime.toDate())),
                                   const MyOrderTxtWidget(text: 'Pending'),
                                  MyOrderTxtWidget(
                                      text: documentSnapshot['no of item'].toString()),
                                  MyOrderTxtWidget(
                                    text:
                                        '${documentSnapshot['total Amount']} \$',
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              MyOrderBtnWidget(
                                btnColor: AppColor.cancelColor.withOpacity(0.5),
                                btnText: 'Cancel Order',
                                onPressed: () {},
                              ),
                              MyOrderBtnWidget(
                                btnColor:
                                    AppColor.validateColor.withOpacity(0.8),
                                btnText: 'Edit Order',
                                onPressed: () {},
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                  itemCount: orderData.length,
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.none) {
              return const Center(
                child: Text('none of data'),
              );
            }
            return const Center(child: Text('Unknown Error'));
          },
        ),
      ),
    );
  }
}
