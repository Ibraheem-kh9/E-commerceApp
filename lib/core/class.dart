import 'package:e_commerce_app/core/utils/constants/app_icons.dart';
import 'package:e_commerce_app/core/utils/constants/app_lottie_asset.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

import '../repo/status_request.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;

  const HandlingDataRequest({
    super.key,
    required this.statusRequest,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppLottieAsset.loading, width: 15.h, height: 15.h))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Image.asset(AppIcons.offlineIcon),
                    const Text('No Internet Connection')
                  ]))
            : statusRequest == StatusRequest.serverFailure
                ? Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Image.asset(AppIcons.serverFailureIcon),
                        const Text('No Internet Connection')
                      ]))
                : widget;
  }
}
