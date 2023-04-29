import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../utils/constant_color.dart';

class ItemDetailOrderSc extends StatelessWidget {
  final Product product;
  final UserViewModel userViewModel;

  const ItemDetailOrderSc(
      {Key? key, required this.product, required this.userViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      //backgroundColor: Color.fromRGBO(124, 165, 184, 0.65),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned.fill(
              top: 0.0,
              bottom: 450.0,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30.0))),
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child: CarouselSlider.builder(
                    itemCount: product.images!.length,
                    itemBuilder: (context, index, _) {
                      return Image.network(
                        product.images![index],
                        fit: BoxFit.cover,
                        errorBuilder: (context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.asset(
                            'assets/images/no_image_available.jpg',
                          );
                        },
                      );
                    },
                    options: CarouselOptions(
                      initialPage: 1,
                      enableInfiniteScroll: false,
                      //animateToClosest: false,
                      enlargeFactor: 0.2,
                      //disableCenter: true,
                      height: 400,
                      autoPlay: false,
                      enlargeCenterPage: true,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 390.0,
              left: 15.0,
              child: Text(
                product.title!,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: kDefaultTextColor,
                ),
              ),
            ),
            Positioned.fill(
              top: 420.0,
              left: 25.0,
              right: 25.0,
              child: Text(
                product.description.toString(),
                style: TextStyle(fontSize: 15.0, color: kDescriptionTextColor),
              ),
            ),
            Positioned.fill(
              top: 485.0,
              left: 15.0,
              child: Text.rich(
                TextSpan(
                  children: [
                    //TextSpan(text: 'Price :'),
                    TextSpan(
                        text:
                            '${userViewModel.calcPriceWithPercentage(product.price!, product.discountPercentage!.floor())}\$',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                          color: kDefaultTextColor,
                        )),
                    TextSpan(text: '  '),
                    TextSpan(
                      text: '${product.price}\$',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[70],
                        decoration: TextDecoration.lineThrough,
                        decorationColor: Colors.red,
                      ),
                    ),
                    TextSpan(text: '   '),
                    TextSpan(
                      text: '  ${product.discountPercentage!.toInt()} %',
                      style: TextStyle(
                          letterSpacing: 1.0,
                          wordSpacing: 5.0,
                          fontSize: 14.0,
                          color: Colors.white,
                          backgroundColor: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 515.0,
              left: 10.0,
              child: RatingBar.builder(
                itemSize: 25,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                initialRating: product.rating!,
                allowHalfRating: true,
                //maxRating: 6.0,
                minRating: 1,
                // Text(product.rating.toString())
                itemBuilder: (context, idx) {
                  return Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (double rating) {
                  print(rating);
                },
              ),
            ),
            Positioned.fill(
              top: 480.0,
              child: Container(
                height: 80.0,
                decoration: BoxDecoration(
                    //color: Color(0xFF9695DA),
                    //border: Border(bottom: BorderSide(color: Colors.black,),top: BorderSide.none,right: BorderSide.none,left: BorderSide.none),
                    //borderRadius: BorderRadius.all(Radius.circular(50.0))
                    ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.remove_circle_outline,
                        size: 40.0,
                        color: kMainColor,
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: Text.rich(
                          TextSpan(text: '2'),
                          style: TextStyle(fontSize: 40.0, color: Colors.black),
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.add_circle,
                          size: 40,
                          color: kMainColor,
                        )),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 550.0,
              child: Divider(
                color: kMainColor,
                endIndent: 75.0,
                indent: 75.0,
                thickness: 2,
              ),
            ),
            Positioned.fill(
                bottom: 15.0,
                child: Container(
                  margin: EdgeInsets.only(left: 10.0, right: 10.0),
                  alignment: Alignment.bottomCenter,
                  height: 130.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: 'Price : ',
                              style: TextStyle(
                                color: kMainColor,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: '00.00',
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold))
                        ]),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Add To Cart',
                        ),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kMainColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                          ),
                          minimumSize:
                              MaterialStateProperty.all(Size(150.0, 50.0)),
                          maximumSize:
                              MaterialStateProperty.all(Size(150.0, 60.0)),
                          //fixedSize: MaterialStateProperty.all(Size(60.0, 30.0))
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}

///////////////////////////////////////////////

/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/view_model/product_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../utils/constant_color.dart';

class ItemDetailOrderSc extends StatelessWidget {
  final Product product;
  final UserViewModel userViewModel;

  const ItemDetailOrderSc(
      {Key? key, required this.product, required this.userViewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      //backgroundColor: Color.fromRGBO(124, 165, 184, 0.65),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30.0))),
              child: Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: CarouselSlider.builder(
                  itemCount: product.images!.length,
                  itemBuilder: (context, index, _) {
                    return Image.network(
                      product.images![index],
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, Object exception, StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/images/no_image_available.jpg',
                        );
                      },
                    );
                  },
                  options: CarouselOptions(
                    initialPage: 1,
                    enableInfiniteScroll: false,
                    //animateToClosest: false,
                    enlargeFactor: 0.2,
                    //disableCenter: true,
                    height: 400,
                    autoPlay: false,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0),
              child: Text(
                product.title!,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 18.0,
                top: 10.0,
              ),
              child: Text(
                product.description.toString(),
                style: TextStyle(fontSize: 15.0, color: Colors.black54),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text.rich(TextSpan(children: [
                //TextSpan(text: 'Price :'),
                TextSpan(
                    text:
                    '${userViewModel.calcPriceWithPercentage(product.price!, product.discountPercentage!.floor())}\$',
                    style: TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
                TextSpan(text: '  '),
                TextSpan(
                  text: '${product.price}\$',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[70],
                    decoration: TextDecoration.lineThrough,
                    decorationColor: Colors.red,
                  ),
                ),
                TextSpan(text: '   '),
                TextSpan(
                  text: '  ${product.discountPercentage!.toInt()} %   ',
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      backgroundColor: Colors.red
                  ),
                ),
              ])),
            ),
            //Text(product.rating.toString()),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0, bottom: 15.0),
              child: RatingBar.builder(
                  itemSize: 25,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  initialRating: product.rating!,
                  allowHalfRating: true,
                  //maxRating: 6.0,
                  minRating: 1,
                  // Text(product.rating.toString())
                  itemBuilder: (context, idx) {
                    return Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (double rating) {
                    print(rating);
                  }),
            ),

            Container(
              height: 80.0,
              decoration: BoxDecoration(
                //color: Color(0xFF9695DA),
                //border: Border(bottom: BorderSide(color: Colors.black,),top: BorderSide.none,right: BorderSide.none,left: BorderSide.none),
                //borderRadius: BorderRadius.all(Radius.circular(50.0))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_circle_outline,
                      size: 40.0,
                      color: Color(0xFF3C3AA6),
                    ),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(text: '2'),
                        style: TextStyle(fontSize: 40.0, color: Colors.black),
                      )),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add_circle,
                        size: 40,
                        color: Color(0xFF3C3AA6),
                      )),
                ],
              ),
            ),
            Divider(
              color: Color(0xFF3C3AA6),
              endIndent: 75.0,
              indent: 75.0,
              thickness: 2,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0,right: 10.0),
              alignment: Alignment.bottomCenter,
              height: 130.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'Price : ',
                          style: TextStyle(
                            color: Color(0xFF3C3AA6),
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          )),
                      TextSpan(text: '00.00',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold))
                    ]),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'Add To Cart',
                    ),
                    style: ButtonStyle(
                      backgroundColor:
                      MaterialStateProperty.all(Color(0xFF3C3AA6)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0))),
                      ),
                      minimumSize: MaterialStateProperty.all(Size(150.0, 50.0)),
                      maximumSize: MaterialStateProperty.all(Size(150.0, 60.0)),
                      //fixedSize: MaterialStateProperty.all(Size(60.0, 30.0))
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
