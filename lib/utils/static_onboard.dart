import 'package:e_commerce_app/components/app_local.dart';
import 'package:flutter/cupertino.dart';

import '../models/onboarding_model.dart';

List<OnBoardingModel> onBoarding = [

  OnBoardingModel(
    image: 'assets/images/onboarding/image_1.png',
    title: "choose_products", // 'Choose The Products',
    description: "on_boarding_desc_1", //'Lorem ipsm dolor sit amit consectortor adipicing eit sed diam nonummy nibh eusimed ut larent dolore',
  ),
  OnBoardingModel(
    image: 'assets/images/onboarding/image_2.png',
    title: "add_fav_prod_cart", // 'Add Favorite Product To Cart',
    description: "on_boarding_desc_2", //'Lorem ipsm dolor sit amit consectortor adipicing eit sed diam nonummy nibh eusimed ut larent dolore',
  ),
  OnBoardingModel(
    image: 'assets/images/onboarding/image_3.png',
    title: "choose_payment_option", //'Choose Your Payment Option',
    description: "on_boarding_desc_3", // 'Lorem ipsm dolor sit amit consectortor adipicing eit sed diam nonummy nibh eusimed ut larent dolore',
  ),
  OnBoardingModel(
    image: 'assets/images/onboarding/image_4.png',
    title: "choose_best_shipping",
    description: "on_boarding_desc_4", //'Lorem ipsm dolor sit amit consectortor adipicing eit sed diam nonummy nibh eusimed ut larent dolore',
  ),
];