import 'package:flutter/material.dart';

import '../../Utils/sizes.dart';
class ParkynBar extends StatelessWidget {
  final Widget titleWidget;
  final Widget bottomWidget;
  final double expandedHeight;

  ParkynBar({Key? key,required this.titleWidget,this.expandedHeight=0,required this.bottomWidget}) : super(key: key);
// todo
  /*
  *  take expanded height as input
  *
  *
  *
  * */

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: titleWidget,
      expandedHeight: expandedHeight,
      bottom: PreferredSize(preferredSize: Size.fromHeight(expandedHeight),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(padding: EdgeInsets.symmetric(horizontal: 15),child: bottomWidget),
        ],
      ),
      ) ,


    );
  }
}
