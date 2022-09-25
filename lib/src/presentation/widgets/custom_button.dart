import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{

  final Size size;
  final MaterialColor enabledColor;
  final IconData icon;
  final Function() onPressEvent;
  final bool isTrue;
  final String text;

  const CustomButton({
    Key? key,
    required this.size, 
    required this.isTrue, 
    required this.enabledColor, 
    required this.icon, 
    required this.text, 
    required this.onPressEvent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: onPressEvent,
    child: AnimatedContainer(
      height: size.height * 0.125,
      width: size.width,
      transformAlignment: FractionalOffset.center,
      alignment: FractionalOffset.center,
      decoration: BoxDecoration(
        color: !isTrue ? Colors.grey[100] : enabledColor[300]!.withOpacity(0.35),
        borderRadius: const BorderRadius.all(Radius.circular(15))
      ),
      duration: const Duration(milliseconds: 800),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, textAlign: TextAlign.center, style: TextStyle(color: !isTrue ? Colors.grey[300] : enabledColor[300], fontSize: 18, fontWeight: FontWeight.w600, fontFamily: "Simply")),
          Icon(icon, color: !isTrue ? Colors.grey[300] : enabledColor[300])
        ],
      ),
    ),
  );
}