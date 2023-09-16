import 'package:e_commerce_app/models/image_promo_model.dart';

class PromoImages{

  static const imageAsset = 'assets/images/promo';
  static List<ImagePromoModel> imagesPromo = [
    ImagePromoModel(id: 1, imageUrl: '$imageAsset/image_1.png'),
    ImagePromoModel(id: 2, imageUrl: '$imageAsset/image_2.png'),
    ImagePromoModel(id: 3, imageUrl: '$imageAsset/image_3.png'),
    ImagePromoModel(id: 4, imageUrl: '$imageAsset/image_4.png'),
    ImagePromoModel(id: 5, imageUrl: '$imageAsset/image_5.png'),
  ];
}