import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view/widgets/secondary_appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import '../../core/utils/constants/constant_color.dart';
import '../../view_model/item_category_view_model.dart';

class CategoryItemOrderSc extends StatelessWidget {
  final ProductModel? product;
  final String? categoryItemName;
  const CategoryItemOrderSc({Key? key, this.product, this.categoryItemName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final itemCatViewModel =
        Provider.of<ItemCategoryViewModel>(context, listen: true);
    //  Product data = ModalRoute.of(context)!.settings.arguments as Product;
    return Scaffold(
      appBar: SecondaryAppbarWidget(
        appbarLeading: categoryItemName,
        appbarTitle: product!.brand,
      ),
      backgroundColor: AppColor.kBackgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Order Images Slider----------------------------------------------
            CarouselSlider.builder(
              itemCount: product!.images!.length,
              itemBuilder: (context, index, i) {
                return CachedNetworkImage(
                  imageUrl: product!.images![index],
                  fit: BoxFit.cover,
                  errorWidget: (context, image, dynamic) {
                    return Image.asset(
                      'assets/images/no_image_available.jpg',
                    );
                  },
                );
              },
              options: CarouselOptions(
                onPageChanged: (idx, _) {
                  itemCatViewModel.setImageIndex(idx);
                },
                viewportFraction: 1,
                initialPage: context.read<ItemCategoryViewModel>().currentIdx,
                enableInfiniteScroll: false,
                enlargeFactor: 0.2,
                height: 44.h,
                autoPlay: false,
                // enlargeCenterPage: true,
              ),
            ),
            Consumer<ItemCategoryViewModel>(
              builder: (context, notify, child) {
                return Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: [
                    ...List.generate(
                      product!.images!.length,
                      (index) => Container(
                        decoration: BoxDecoration(
                          color: notify.currentIdx != index
                              ? AppColor.kMainColor
                              : AppColor.kIconColor,
                          shape: BoxShape.circle,
                        ),
                        margin: EdgeInsets.all(10),
                        height: 1.h,
                        width: 1.h,
                      ),
                    )
                  ],
                );
              },
            ),

            Padding(
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top:0),
              //padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 2.h),
              child: Text(
                product!.brand!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 0),
              //padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 2.h),
              child: Text(
                product!.title!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 0),
              //padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h, top: 3.h),
              child: Text(
                product!.description!,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 10.sp,
                  color: Colors.black87,
                ),
              ),
            ),

            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(
                top: 2.h,
              ),
              padding: EdgeInsets.only(left: 1.5.h, right: 1.5.h),
              height: 7.h,
              decoration:
                  const BoxDecoration(color: AppColor.backgroundPageViewColor),
              child: Text(
                '${product!.price!} \$',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 12.5.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 2.h,right: 2.h),
              height: 9.h,
              decoration: BoxDecoration(
                color: AppColor.backgroundPageViewColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                      onPressed: (){},
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(AppColor.kMainColor),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(1.h)))),
                      fixedSize: MaterialStateProperty.all(Size(39.h, 4.h))
                    ),
                      child: Text('Add To Cart',style: TextStyle(fontSize: 12.sp),),
                  ),
                  ElevatedButton(
                      onPressed: (){

                      },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                      elevation: const MaterialStatePropertyAll(0),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(side: const BorderSide(color: AppColor.kMainColor),borderRadius: BorderRadius.all(Radius.circular(1.h)))),
                      fixedSize: MaterialStateProperty.all(Size(0.5.h, 4.h))
                    ),
                      child: Icon(Icons.favorite,color: Colors.grey,size: 18.sp,),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}