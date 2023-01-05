import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class GameField extends StatefulWidget {
  const GameField({Key? key}) : super(key: key);

  @override
  State<GameField> createState() => _GameFieldState();
}

enum Direction{up,down,left,right}

class _GameFieldState extends State<GameField> {
  int lenght = 4;

  Direction _direction = Direction.up;
  List<Offset> _positions=[];
  double? height;
  double? widht;

  @override
  Widget build(BuildContext context) {
    Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {

      });
    });
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
       Piece(size: 15, posx: _positions[i].dx, posy: _positions[i].dy, color: Colors.redAccent,)
     );
   }
   return pieces;
  }

  draw(){
    if(_positions.length==0){
      _positions.add(getRamdomPositionWithSreen());
    }
    for (int i = _positions.length-1;i>0;i--){
      _positions[i]=_positions[i-1];
    }
    _positions[0]=checkBorder(_positions[0]);
    _positions[0] = getNextPostion(_positions[0]);
  }

  //TODO Next position
  Offset getNextPostion(Offset position){
    Offset nextPosition = Offset(5, 6);

    if (_direction==Direction.up)nextPosition = position - Offset(0, 5);
    if (_direction==Direction.down)nextPosition = position + Offset(0, 5);
    if (_direction==Direction.right)nextPosition = position + Offset(5, 0);
    if (_direction==Direction.left)nextPosition = position - Offset(5, 0);
checkBorder(position);
    return nextPosition;
  }

checkBorder(Offset position){
    if(position.dy>=height!-30) position=Offset(position.dx, 1);
      if(position.dy<=0) position=Offset(position.dx, height!-1);
    if(position.dx>=widht!-30) position=Offset(1, position.dy);
      if(position.dx<=0) position=Offset(height!-1, position.dy);
    return position;
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

