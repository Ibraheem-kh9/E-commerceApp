
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/utils/constant_color.dart';
import 'package:e_commerce_app/view/item_detail_order_sc.dart';
import 'package:e_commerce_app/view/items_categories_sc.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'animated_search_bar_widget.dart';

class HomepageScWidget extends StatelessWidget {
  final UserViewModel userViewModel;

  const HomepageScWidget({Key? key, required this.userViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 0.0,
                childAspectRatio: 0.70),
            itemCount: userViewModel.productModelView?.products?.length,
            itemBuilder: (context, index1) {
              ////////////
              Product product =
              userViewModel.productModelView!.products![index1];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return ItemDetailOrderSc(product: product,userViewModel: userViewModel,);
                  }));
                },
                child: Stack(
                  children: [
                    ListView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: 150.0,
                          height: 190,
                          child: CarouselSlider.builder(
                            itemCount: product.images!.length > 3
                                ? 3
                                : product.images!.length,
                            itemBuilder: (ctx, idx, _) => Image.network(
                              product.images![idx],
                              fit: BoxFit.cover,
                              errorBuilder: (context, Object exception,
                                  StackTrace? stackTrace) {
                                return Image.asset(
                                    'assets/images/no_image_available.jpg');
                              },
                            ),
                            options: CarouselOptions(
                              enableInfiniteScroll: false,
                              //pageSnapping: false,
                              //autoPlayInterval: Duration.zero,
                              //animateToClosest: false,
                              enlargeFactor: 0.2,
                              //disableCenter: true,
                              height: 400,
                              autoPlay: true,
                              enlargeCenterPage: true,
                            ),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15.0, top: 5.0, bottom: 5.0),
                          child: Text(
                            product.title!.toString(),
                            style: TextStyle(fontSize: 17, color: kDefaultTextColor),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                    Positioned(
                      bottom: 25,
                      child: Padding(
                        padding:
                        EdgeInsets.only(left: 15.0, top: 5.0, bottom: 5.0),
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '${product.price!.toString()} \$',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: kDescriptionTextColor,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    decorationThickness: 1.5),
                              ),
                              TextSpan(text: '  '),
                              TextSpan(
                                text:
                                '${userViewModel.calcPriceWithPercentage(product.price!, product.discountPercentage!.floor()).toString()} \$',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: kDefaultTextColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              width: 75,
                              height: 18,
                              decoration: BoxDecoration(color: Colors.red),
                              child: Text(
                                '${product.discountPercentage!.floor().toString()} %',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                    color: kDefaultTextColor),
                              ),
                            ),
                            Icon(
                              Icons.favorite_border_rounded,
                              color: kMainColor,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

