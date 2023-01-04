import 'dart:math';

import 'package:flutter/material.dart';

class GameField extends StatefulWidget {
  const GameField({Key? key}) : super(key: key);

  @override
  State<GameField> createState() => _GameFieldState();
}

class _GameFieldState extends State<GameField> {


  List<Offset> _positions=[];
  double? height;
  double? widht;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    widht=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: snakePieces(),
      ));
  }

  //TODO snake pieces
  List<Piece> snakePieces(){
   List<Piece> pieces=[];
   setState(() {
     draw();
   });
   for (int i=0; i< _positions.length; i++){
     pieces.add(
       Piece(size: 15, posx: _positions[i].dx, posy: _positions[i].dy, color: Colors.lightBlueAccent,)
     );
   }
   return pieces;
  }

  draw(){
    if(_positions.length==0){
      _positions.add(getRamdomPositionWithSreen());
    }
  }

  Offset getRamdomPositionWithSreen(){
    Random rand = Random();
    double x=rand.nextInt(widht!.toInt()).toDouble();
    double y=rand.nextInt(height!.toInt()).toDouble();
    return Offset(x, y)-Offset(15,15);
  }
}


//TODO piece
class Piece extends StatelessWidget {
  double size;
  double posx;
  double posy;
  Color color;
   Piece({Key? key,required this.size,required this.posx,required this.posy,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: posy,
      left: posx,
      child: Container(
        height: size,
        width: size,
        decoration:  BoxDecoration(
            color: color, shape: BoxShape.circle
        ),
      ),
    );
  }
}

