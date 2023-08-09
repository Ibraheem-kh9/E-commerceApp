import 'package:e_commerce_app/utils/constants/app_icons.dart';
import 'package:e_commerce_app/view/widgets/more_bar_widgets/setting_update_psd_widget.dart';
import 'package:e_commerce_app/view_model/setting_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constants/constant_color.dart';

class UpdateUserPasswordSc extends StatelessWidget {
  const UpdateUserPasswordSc({super.key});

  @override
  Widget build(BuildContext context) {
    final settingViewModel = Provider.of<SettingViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back,color: AppColor.kIconColor,size: 19.sp,)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 3.h),
              child: Text(
                'Update User Password!',
                style: TextStyle(fontSize: 20.sp, color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 2.h, right: 2.h, top: 3.h,bottom: 3.h),
              child: Text(
                'Please make sure to enter the current password correctly, after that please enter the new password!',
                style: TextStyle(fontSize: 12.sp, color: Colors.black54),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h, bottom: 5.h),
              child: Image.asset(
                AppIcons.changePasswordIcon,
                width: 10.h,
                height: 15.h,
                color: AppColor.kMainColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 3.5.h, left: 3.5.h),
              child: SizedBox(
                height: 8.9.h,
                child: SettingUpdatePsdWidget(
                  textEditingCtrl: settingViewModel.currentPasswordCtrl,
                  textInputType: TextInputType.visiblePassword,
                  hintText: 'Enter Current Password',
                  formIcon: Icons.lock_outline,
                  //suffixWidget: ,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 3.5.h, left: 3.5.h),
              child: SizedBox(
                height: 8.9.h,
                child: SettingUpdatePsdWidget(
                  textEditingCtrl: settingViewModel.newPasswordCtrl,
                  textInputType: TextInputType.visiblePassword,
                  hintText: 'Enter New Password',
                  formIcon: Icons.lock_outline,
                  //suffixWidget: ,
                ),
              ),
            ),
            Align(
                child: ElevatedButton(
              onPressed: () async{
                await settingViewModel.changePsd();
              },
              style: ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(20.h, 5.h)),
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(2.h),
                  ),
                ),
                backgroundColor: const MaterialStatePropertyAll(AppColor.validateColor)
              ),
              child: Text(
                'Save',
                style: TextStyle(fontSize: 14.sp),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
