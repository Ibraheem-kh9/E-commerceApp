import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/view_model/app_language_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../../core/utils/constants/constant_color.dart';
import '../../../core/utils/static_language.dart';

class ChangeLanguageSc extends StatelessWidget {
  const ChangeLanguageSc({super.key});

  @override
  Widget build(BuildContext context) {
    final appLanguage = Provider.of<AppLanguageViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.kMainColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            size: 20.sp,
          ),
        ),
        title: Consumer<AppLanguageViewModel>(builder: (context,not,child){
          return Text(
            AppLocale.of(context).getTranslated('titleSetting')!,
            //'${getLang(context, "titleSetting")}',
          );
        }),
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 15.sp,
          fontFamily: 'Times',
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
           Consumer<AppLanguageViewModel>(builder: (context, notify,child){
             return  Padding(
               padding: EdgeInsets.only(left: 1.5.h, top: 2.h,right: 1.5.h,bottom: 1.h),
               child: Text(
                 '${AppLocale.of(context).getTranslated('header')}',
                 style: TextStyle(
                     fontSize: 12.sp,
                     color: Colors.grey
                 ),
               ),
             );
           },
           ),
            Container(
              margin: EdgeInsets.only(top: 2.h, left: 1.2.h, right: 1.2.h,bottom: 1.h),
              decoration: BoxDecoration(
                color: AppColor.kMainColor.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(2.h)),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: language.length,
                itemBuilder: (context, index) {
                  return ListView(
                    shrinkWrap: true,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(

                              onTap: () {
                                if(language[index].id == 0){
                                  appLanguage.checkLanguageIndex(index);
                                  appLanguage.setLocale(Locale("ar" , "AR"));
                                }
                                else{
                                  appLanguage.checkLanguageIndex(index);
                                  appLanguage.setLocale(Locale("en" , "US"));
                                }

                              },
                              child: ListTile(
                                title: Text(
                                  language[index].foreignName!,
                                  style: TextStyle(
                                    fontFamily: 'Times',
                                    fontSize: 13.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  language[index].name!,
                                  style: TextStyle(
                                    fontFamily: 'Times',
                                    fontSize: 11.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                trailing: appLanguage.currentIdx == index ? Icon(Icons.done,color: Colors.black,) : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton(
                  onPressed: () {
                    //appLanguage.setLocale(Locale("en" ,"US"));
                     appLanguage.setLocale(Locale("en" ,"US"));
                    print('en');
                  },
                  child: Text('English'),
                ),
                TextButton(
                  onPressed: () {
                     appLanguage.setLocale(Locale("ar","AR"));
                    //appLanguage.setLocale(Locale("ar","AR"));
                    print('ar');
                  },
                  child: Text('العربي'),
                )
              ],
            ),
            TextButton(
              onPressed: () {
                appLanguage.clearShared();
                //appLanguage.setLocale(Locale("ar","AR"));
                print('cleat');
              },
              child: Text('Clear'),
            ),
          ],
        ),
      ),
    );
  }
}
