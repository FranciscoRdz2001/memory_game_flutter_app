import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{

  final Size size;
  final MaterialColor enabledColor;
  final IconData icon;
  final Function() onPressEvent;
  final bool isTrue;
  final String text;

  CustomButton({required this.size, required this.isTrue, required this.enabledColor, required this.icon, required this.text, required this.onPressEvent});

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: (){
      if(onPressEvent != null) onPressEvent();
    },
    child: AnimatedContainer(
      height: size.height * 0.125,
      width: size.width,
      transformAlignment: FractionalOffset.center,
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: isTrue == null || !isTrue ? Colors.grey[100] : enabledColor[300]!.withOpacity(0.35),
        borderRadius: BorderRadius.all(Radius.circular(15))
      ),
      duration: Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, textAlign: TextAlign.center, style: TextStyle(color: isTrue == null || !isTrue ? Colors.grey[300] : enabledColor[300], fontSize: 18, fontWeight: FontWeight.w600, fontFamily: "Simply")),
          Icon(icon, color: isTrue == null || !isTrue ? Colors.grey[300] : enabledColor[300])
        ],
      ),
    ),
  );
}