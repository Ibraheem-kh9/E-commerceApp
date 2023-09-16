import 'package:e_commerce_app/models/image_promo_model.dart';

class PromoImages{

  final _imageAsset = 'assets/images/promo/';
  static List<ImagePromoModel> imagesPromo = [
    ImagePromoModel(id: 1, imageUrl: 'assets/images/promo/image_1.png'),
    ImagePromoModel(id: 2, imageUrl: 'assets/images/promo/image_2.png'),
    ImagePromoModel(id: 3, imageUrl: 'assets/images/promo/image_3.png'),
    ImagePromoModel(id: 4, imageUrl: 'assets/images/promo/image_4.png'),
    ImagePromoModel(id: 5, imageUrl: 'assets/images/promo/image_5.png'),
  ];
}