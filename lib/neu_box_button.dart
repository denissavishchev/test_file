import 'package:flutter/material.dart';

class NeuBoxButton extends StatefulWidget {
  final dynamic child;
  final Function() onTap;

  const NeuBoxButton({Key? key,
    required this.child,
    required this.onTap}) : super(key: key);

  @override
  State<NeuBoxButton> createState() => _NeuBoxButtonState();
}

class _NeuBoxButtonState extends State<NeuBoxButton> {

  bool isPressed = false;

  void _isPressed() {
    setState(() {
      isPressed = !isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_){
        setState(() {
          _isPressed();
          widget.onTap.call();
        });
      },
      onTapUp: (_){
        _isPressed();
      },
      onTapCancel: (){
        _isPressed();
      },
      child: Container(
        height: 100,
        margin: EdgeInsets.all(10),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[300],
          boxShadow: isPressed ? [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 15,
              offset: const Offset(2, 2),
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-2, -2),
            )
          ] : [
            BoxShadow(
              color: Colors.grey.shade500,
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
            const BoxShadow(
              color: Colors.white,
              blurRadius: 15,
              offset: Offset(-5, -5),
            )
          ],
          gradient: isPressed ? LinearGradient(
            begin: Alignment.bottomRight,
              end: Alignment.topLeft,
              colors: [
                Colors.white.withOpacity(0.8),
                Colors.grey.shade500.withOpacity(0.8)
              ],
            stops: const [
              0.1,
              1
            ]
          ) : null,
        ),
        child: Center(child: widget.child,),
      ),
    );
  }
}
