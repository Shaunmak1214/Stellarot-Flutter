import 'package:flutter/material.dart';

class CategoryButtons extends StatefulWidget {
  CategoryButtons(
      {Key? key,
      required this.buttonText,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String buttonText;
  final bool selected;
  final Function? onPressed;

  @override
  _CategoryButtonsState createState() => _CategoryButtonsState();
}

class _CategoryButtonsState extends State<CategoryButtons> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(right: 10),
        child: OutlinedButton(
          style: ButtonStyle(
            backgroundColor: widget.selected
                ? MaterialStateProperty.all<Color>(Colors.black)
                : MaterialStateProperty.all<Color>(Colors.white),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))),
          ),
          onPressed: () {
            print('Received click');
            widget.onPressed?.call();
          },
          child: Text(widget.buttonText,
              style: TextStyle(
                  color: widget.selected ? Colors.white : Colors.black)),
        ));
  }
}
