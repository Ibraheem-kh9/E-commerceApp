import 'package:e_commerce_app/utils/constant_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/category_view_model.dart';

class ItemsCategoriesSc extends StatelessWidget {
  const ItemsCategoriesSc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoryViewModel catViewModel = context.watch<CategoryViewModel>();
    return Scaffold(
      backgroundColor: kBackgroundColor,//const Color.fromRGBO(124, 165, 184, 0.65),
      body: SafeArea(
        child: ListView.builder(
          itemCount: catViewModel.categoryModel!.length,
          itemBuilder: (context, index) {
            var catItems = catViewModel.categoryModel![index];
            return Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10.0, top: 5.0, right: 10.0),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10.0),
                  height: 65,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 35,
                            //borderRadius: BorderRadius.all(Radius.circular(100)),
                            child: Image.asset(
                              catItems.categoryImage,
                              //scale: 10.0,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          Text(
                            catItems.categoryName,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_outlined,
                          color: kMainColor,
                        ),
                      )
                    ],
                  ),
                ),
                Divider(
                  endIndent: 20.0,
                  indent: 20.0,
                  thickness: 0.8,
                  color: Colors.grey,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
