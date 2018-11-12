import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:rush_revamp/ui/styles/colors.dart';
import 'package:flutter/cupertino.dart';

const closeImageName = 'assets/images/ic_clear.png';

class RushTextField extends StatefulWidget {
  String title;
  String hintText;
  bool obscureText;
  int maxLength;

  final textEditingController = TextEditingController();

  RushTextField({
    this.title = '',
    this.hintText = '',
    this.obscureText = false,
    this.maxLength
  });

  @override
  _RushTextFieldState createState() => _RushTextFieldState();
}

class _RushTextFieldState extends State<RushTextField> {
  bool _shouldShowCloseButton = false;
  String currentText = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildTextFieldWithTitle()
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    widget.textEditingController.dispose();
    super.dispose();
  }

  List<Widget> _buildTextFieldWithTitle() {
    if (widget.title.isNotEmpty) {
      return [_buildTitle(), _buildTextField()];
    } else {
      return [_buildTextField()];
    }
  }

  Widget _buildTitle() {
    return Text(widget.title);
  }

  Widget _buildTextField() {
    return Material(
        child: TextField(
          controller: widget.textEditingController,
          onChanged: (newText) {
            _toggleCloseButton(text: newText);

            if (newText.length <= widget.maxLength) {
              currentText = newText;
            } else {
              widget.textEditingController.text = currentText;
            }
          },
          obscureText: widget.obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
                left: 0.0,
                right: 0.0,
                top: 14.0,
                bottom: 14.0
            ),
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.white,
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.orange,
                    width: 2.0)
            ),
            suffixIcon: _shouldShowCloseButton ? _buildCloseButton() : null,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: RushRevampColors.light_gray
                )
            ),
          ),
        )
    );
  }

  Widget _buildCloseButton() {
    return CupertinoButton(
      child: Image.asset(
        closeImageName,
      ),
      onPressed: () {
        widget.textEditingController.clear();
        _toggleCloseButton();
      },
      pressedOpacity: 0.5,
    );
  }

  void _toggleCloseButton({String text}) {
    setState(() {
      (text?.isEmpty == false)
          ? _shouldShowCloseButton = true
          : _shouldShowCloseButton = false;
    });
  }
}