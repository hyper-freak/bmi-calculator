import 'package:bmi/colors/color.dart';
import 'package:flutter/material.dart';

class StyleIcon extends StatefulWidget {
  final VoidCallback onPressed;
  final double width;
  final double height;
  final IconData icon;

  StyleIcon({this.onPressed, this.width, this.height, this.icon});

  @override
  _StyleIconState createState() => _StyleIconState();
}

class _StyleIconState extends State<StyleIcon> {
  bool isPressed = false;

  void whenNotPressed(PointerUpEvent event) {
    setState(() {
      isPressed = false;
    });
  }

  void whenPressed(PointerDownEvent event) {
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: whenNotPressed,
      onPointerDown: whenPressed,
      child: isPressed
          ? GestureDetector(
              onTap: widget.onPressed,
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  color: foregroundColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(-3, -3),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(3, 3),
                      color: Colors.white.withOpacity(0.15),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: foregroundColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: foregroundColor,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 2.0,
                              offset: Offset(-2, -2),
                              color: Colors.black.withOpacity(0.15),
                            ),
                            BoxShadow(
                              blurRadius: 2.0,
                              offset: Offset(2, 2),
                              color: Colors.white.withOpacity(0.7),
                            ),
                          ],
                        ),
                        child: Icon(
                          widget.icon,
                          size: 20.0,
                          color: Theme.of(context).accentColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          : GestureDetector(
              onTap: widget.onPressed,
              child: Container(
                width: widget.width,
                height: widget.height,
                decoration: BoxDecoration(
                  color: foregroundColor,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(-3, -3),
                      color: Colors.white.withOpacity(0.7),
                    ),
                    BoxShadow(
                      blurRadius: 5.0,
                      offset: Offset(3, 3),
                      color: Colors.black.withOpacity(0.15),
                    ),
                  ],
                ),
                child: Icon(
                  widget.icon,
                  size: 20.0,
                  color: darkTextColor,
                ),
              ),
            ),
    );
  }
}
