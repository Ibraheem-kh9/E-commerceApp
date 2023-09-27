import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/components/app_local.dart';
import 'package:e_commerce_app/view/widgets/favorite_screen_widget/custom_favorite_product_widget.dart';
import 'package:e_commerce_app/view_model/favorite_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/services/auth_services.dart';
import '../../view_model/product_view_model.dart';

class FavoriteItemSc extends StatelessWidget {
  const FavoriteItemSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppLocale appLocale = AppLocale.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<FavoriteViewModel>(
          builder: (context, favoriteNotify, child) {
            return StreamBuilder(
                stream: favoriteNotify.getFavoriteItem(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  else if (snapshot.connectionState == ConnectionState.active) {
                    if (snapshot.hasError) {
                      return const Center(child: Text('Data Can\'t Loaded'));
                    }
                    if (snapshot.hasData) {
                      final snap = snapshot.data!.docs;
                      return CustomFavoriteProductsWidget(
                        snapshot: snap,
                      );
                    }
                  } else if (snapshot.connectionState == ConnectionState.none) {
                    return const Text('Press button to start.');
                  }
                  return const Center(
                    child: Text('UnKnown Error Found'),
                  );
                });
          },
        ),
      ),
    );
  }
}
