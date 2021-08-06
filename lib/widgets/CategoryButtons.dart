import 'package:flutter/material.dart';

class CategoryButtons extends StatefulWidget {
  CategoryButtons({Key? key, required this.buttonText}) : super(key: key);
  final String buttonText;

  @override
  _CategoryButtonsState createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
    onPrimary: Colors.white,
    primary: Colors.white,
    minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 8),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(4.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(right: 5),
        child: new ElevatedButton(
          style: raisedButtonStyle,
          onPressed: () {},
          child: Text(
            widget.buttonText,
            style: TextStyle(color: Colors.black, fontSize: 14),
          ),
        ),
      ),
    );
  }
}
