import 'package:flutter/widgets.dart';
import 'package:rush_revamp/ui/styles/colors.dart';
import 'package:rush_revamp/ui/styles/fonts.dart';
import 'package:flutter/material.dart';
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
  Color _borderColor = RushRevampColors.light_gray;
  Color _titleTextColor = RushRevampColors.black;
  TextStyle textFieldTextStyle = TextStyle();
  FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(onFocusChange);
    textFieldTextStyle = TextStyle(
        color: RushRevampColors.black,
        fontSize: 17.0,
        fontFamily: RushFonts.appFont
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: _buildTextFieldWithTitle()
    );
  }

  void onFocusChange() {
    setState(() {
      if (_focusNode.hasFocus) {
        _borderColor = RushRevampColors.orange;
        _titleTextColor = RushRevampColors.orange;
      } else {
        _borderColor = RushRevampColors.light_gray;
        _titleTextColor = RushRevampColors.black;
      }
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    widget.textEditingController.dispose();
    super.dispose();
  }

  List<Widget> _buildTextFieldWithTitle() {
    if (widget.title.isNotEmpty) {
      return [_buildTitle(), SizedBox(height: 11.0), _buildTextField()];
    } else {
      return [_buildTextField()];
    }
  }

  Widget _buildTitle() {
    return Text(
      widget.title,
      style: appTextStyle.copyWith(
        color: _titleTextColor,
        fontSize: 12.0
      ),
    );
  }

  Widget _buildTextField() {
    return CupertinoTextField(
      placeholder: widget.hintText,
      controller: widget.textEditingController,
      focusNode: _focusNode,
      maxLength: widget.maxLength,
      obscureText: widget.obscureText,
      maxLines: 1,
      clearButtonMode: OverlayVisibilityMode.editing,
      style: textFieldTextStyle,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
              color: _borderColor,
              width: 2.0
          ),
        ),
      ),
      padding: EdgeInsets.only(top: 6.0, bottom: 6.0),
    );
  }

  void _updateTextFieldForHintTextGiven(String text) {
    setState(() {
      if (text.isNotEmpty) {
        textFieldTextStyle = TextStyle(
            color: RushRevampColors.black,
            fontSize: 17.0,
            fontFamily: RushFonts.appFont
        );
      } else {
        textFieldTextStyle = TextStyle(
            color: RushRevampColors.black,
            fontSize: 14.0,
            fontFamily: RushFonts.appFont
        );
      }
    });
  }
}