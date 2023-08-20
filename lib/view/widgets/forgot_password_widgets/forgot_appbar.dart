import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/constants/constant_color.dart';
import '../../../view_model/register/reset_password_view_model.dart';

class ForgotAppBarWidget extends StatelessWidget implements PreferredSizeWidget{

  const ForgotAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final resetPasswordViewModel = Provider.of<ResetPasswordViewModel>(context);
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
          resetPasswordViewModel.resetPasswordEditingCtrl.clear();
        },
        icon: Icon(
          Icons.arrow_back,
          color: AppColor.kIconColor,
          size: 20.sp,
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(70 / 100 * 75 );
}
