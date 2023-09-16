import 'package:e_commerce_app/core/services/auth_services.dart';
import 'package:e_commerce_app/models/favorite_model.dart';
import 'package:e_commerce_app/models/image_promo_model.dart';
import 'package:e_commerce_app/repo/fuctions/products_error.dart';
import 'package:e_commerce_app/models/products_model.dart';
import 'package:e_commerce_app/repo/api_status.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../core/services/product_services.dart';
import '../core/utils/promo_image.dart';
import '../view/screens/favorite_item_sc.dart';
import '../view/screens/categories_sc.dart';
import '../view/screens/more_bar_screens/setting_sc.dart';
import '../view/widgets/home_screen_widget/home_widget.dart';

class ProductViewModel with ChangeNotifier {
  bool _loading = false;
  List<ProductModel>? _productModelView;
  UserError _userError = UserError();
  int currentIndexBar = 0;
  bool isExpanded = false;
  List<ImagePromoModel>? _imagePromoModel = [];
  Set<ProductModel> _highestItemRate = {};

  /// change int to double and add final
  final double _cartPrice = 0.0;


  bool get loading => _loading;
  List<ProductModel>? get productModelView => _productModelView;
  List<ImagePromoModel> get imagePromoModel => _imagePromoModel!;
  Set<ProductModel> get highestItemRate => _highestItemRate;
  UserError get userError => _userError;

  double get cartPrice => _cartPrice;

  ProductViewModel() {
    getProducts();
    getImagePromo();
    //getHighestRateItem();
  //  firebaseCall();
  }
  List<Widget> screensView = [
    HomeWidget(),
    FavoriteItemSc(),
    CategoriesSc(),
    SettingSc(),
  ];

  List<String> titleBottomAppBar = [
    'Home',
    'Favorite',
    'Category',
    'More',
  ];
  List<IconData> iconBottomAppBar = [
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.category_outlined,
    Icons.more_horiz,
  ];

   getImagePromo(){
    final data = PromoImages.imagesPromo;
    data.forEach((ImagePromoModel imagePromoModel) {
      _imagePromoModel!.add(imagePromoModel);
    //  notifyListeners();
    });
  }



  // firebaseCall(){
  //    FirebaseMessaging.instance.getToken().then((value) {
  //     print ('the token of firebase Messaging is $value');
  //     String? token = value;
  //   });
  // }


  setFavoriteCheck(int index) {
    // _productModelView!.products![index].isFavorite =
    // !_productModelView!.products![index].isFavorite!;
    notifyListeners();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }
  setExpanded() async {
    isExpanded = !isExpanded;
    print(isExpanded);
    notifyListeners();
  }
  setItemZero(int id) {
    // final index = productModelView!.products!
    //     .indexWhere((Product product) => product.id == id);
    // productModelView!.products![index].quantity = 0;
    // notifyListeners();
  }
  setProductModelList(List<ProductModel>? productModelList) {
    _productModelView = productModelList;

  }
  // setProductModelList(ProductModel productModelList) {
  //   _productModelView = productModelList;
  // }

  setError(UserError error) {
    _userError = error;
  }



  getProducts() async {
    setLoading(true);
    var response = await ProductsServices().fetchProducts();
    print(response);
    if (response is Success) {
      setProductModelList(response.response as List<ProductModel>?);
    }
    if (response is Failure) {
      UserError userError = UserError(
          code: response.code, message: response.errorResponse.toString());
      setError(userError);
      print(response.errorResponse);
    }
    setLoading(false);

  }

  incrementProductQty(int id) {
    final index = productModelView?.indexWhere((ProductModel product) => product.id == id);
    //final index = productModelView?.indexWhere((Product product) => product.id == id);
    if (index! >= 0) {
     // productModelView?[index].quantity++;
     // notifyListeners();
    }
   // print(productModelView?.products![index].quantity);
  }

  decrementProductQty(int id) {
    // final index = productModelView?.products!.indexWhere((Product product) => product.id == id);
    // if (index! >= 0) {
    //   productModelView?.products![index].quantity--;
    //   notifyListeners();
    // }
    // print(productModelView?.products![index].quantity);
  }

  /// change int to double
  itemTotalPriceIncrease({int? id, int? itemQty, double? price, double? perc}) {
    // final index = productModelView?.products!
    //     .indexWhere((Product product) => product.id == id);
    // if (index! >= 0) {
    //   productModelView?.products![index].totalProductPrice =
    //   /// add toDouble
    //       (itemQty! * calcPriceWithPercentage(price!.toDouble(), perc!)).toDouble();
    //   notifyListeners();
    // }
    // print(productModelView?.products![index].totalProductPrice);
  }
/// change int to double
  itemTotalPriceDecrease({int? id, int? itemQty, double? price, double? perc}) {
    // final index = productModelView?.products!
    //     .indexWhere((Product product) => product.id == id);
    // if (index! >= 0) {
    //   var total = productModelView?.products![index].totalProductPrice =
    //       (itemQty! * calcPriceWithPercentage(price!, perc!)).toDouble();
    //   total! - 1;
    //
    //   notifyListeners();
    //   return total;
    // }
    // print(productModelView?.products![index].totalProductPrice);
  }
  /// change int to double
  calcPriceWithPercentage(double amount, double perc) {
    var num = (amount * perc / 100);
    var totalPrice = amount - num;
    return totalPrice.floor();
  }

  selectedScreenBar(int idx) {
    currentIndexBar = idx;
    notifyListeners();
  }

  Future<Set<ProductModel>> getHighestRateItem(List<ProductModel>? productModel) async{
    final data = productModel!.where((element) => element.rating! >= 4.7);
    for (var element in data) {
        _highestItemRate.add(element);
    }
     return _highestItemRate;
  }



}
