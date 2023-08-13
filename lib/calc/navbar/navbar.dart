import 'package:flutter/material.dart';



class Navbar extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          Icons.compare_arrows_rounded,
          color: Colors.white,
        ),
        Icon(
          Icons.add,
          color: Color(0xffb23d10),
        ),
        Icon(
          Icons.menu_open,
          color: Colors.white,
        ),
        Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ],
    );
  }
}