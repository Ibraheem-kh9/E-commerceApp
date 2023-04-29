
import 'package:e_commerce_app/view/setting_sc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../view_model/product_view_model.dart';

class SearchBarAnimationWidget extends StatefulWidget {
  const SearchBarAnimationWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarAnimationWidget> createState() => _SearchBarAnimationState();
}

class _SearchBarAnimationState extends State<SearchBarAnimationWidget> {

  @override
  Widget build(BuildContext context) {
    return Consumer<UserViewModel>(builder: (context,notifyChange,child){
      return GestureDetector(
        onTap: () {
          notifyChange.setExpanded();
        },
        child: Row(
          children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: notifyChange.isExpanded ? 221 : 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  Container(
                      width: 30.0,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        //border: Border.all(color: Colors.yellowAccent)
                      ),
                      child: Icon(Icons.search,color: Colors.white,size: 20.0,)),
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      controller: null,
                      //autofocus: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.all(6.0),
                        hintText: 'Find your Product',
                        hintStyle: TextStyle(fontSize: 12.0,height: 2.5),
                        alignLabelWithHint: true,
                      ),
                      style: TextStyle(),
                    ),
                  ),
                  Expanded(
                      child: Container(
                        //alignment: Alignment.center,
                        child: notifyChange.isExpanded
                            ? GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                    return SettingSc();
                                  }));
                            },
                            child: Icon(
                              Icons.arrow_forward_outlined,
                              color: Color.fromRGBO(40, 44, 52, 1),
                            ))
                            : null,
                      ))
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

//////////////////////////////////////////////

/*
import 'package:flutter/material.dart';

class SearchBarAnimationWidget extends StatefulWidget {
  const SearchBarAnimationWidget({Key? key}) : super(key: key);

  @override
  State<SearchBarAnimationWidget> createState() => _SearchBarAnimationState();
}

class _SearchBarAnimationState extends State<SearchBarAnimationWidget> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,
        duration: Duration(milliseconds: 500));
    _animation = Tween<double>(begin:0 ,end: 1).animate(_animationController!);
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(_animationController!.isCompleted){
          _animationController!.reverse();
          print('reverse mode');
        }
        else{
          _animationController!.forward();
          print('forward mode');
        }
      },
      child: AnimatedBuilder(
          animation: _animation!,
          builder: (context,child){
            return Container(
              height: 50,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Icon(Icons.search),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(50 * (1 - _animation!.value), 0),
                    child: Container(
                      width: 100,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                        BorderRadius.circular(25), // half of height
                        color: Colors.blue,
                      ),
                      child:
                      Icon(Icons.arrow_forward_ios, color: Colors.white),
                    ),),
                ],
              ),
            );
          }),
    );
  }
}
*/
