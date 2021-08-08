import 'package:flutter/material.dart';

class CategoryButtons extends StatefulWidget {
  CategoryButtons({Key? key, required this.buttonText, required this.onPressed})
      : super(key: key);
  final String buttonText;
  final Function? onPressed;

  @override
  _CategoryButtonsState createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 5),
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
          ),
          onPressed: () {
            print('Received click');
            widget.onPressed?.call();
          },
          child: Text(
            widget.buttonText,
            style: TextStyle(color: Colors.white),
          ),
        ));
  }
}
