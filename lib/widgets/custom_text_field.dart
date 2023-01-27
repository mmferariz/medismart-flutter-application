import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {

  final bool isPassword;
  final String? labelText;
  final bool withoutOutlineBorder;
  final Function()? closeButton;
  final String? regex;
  final int? maxLength;
  final String? errorMessage;
  final Function (String)? onChanged;
  final Function (String)? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final TextInputType? textInputType;
  final AutovalidateMode autovalidateMode;
  final bool showCharNumber;
  final bool filled;
  final EdgeInsets margin;
  final FloatingLabelBehavior floatingLabelBehavior;

  CustomTextField({Key? key, this.isPassword = false, this.labelText, this.withoutOutlineBorder = false, this.closeButton, this.regex, this.maxLength, this.errorMessage,
    this.onChanged, this.onSubmitted, this.controller, this.focusNode, this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none, this.textInputType, this.autovalidateMode = AutovalidateMode.always,
    this.showCharNumber = false, this.margin = const EdgeInsets.only( top: 15, bottom: 10, left: 20, right: 20), this.filled = false, this.floatingLabelBehavior = FloatingLabelBehavior.auto
    }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CustomTextFieldState();

}

class _CustomTextFieldState extends State<CustomTextField>{

  late bool showPassword;

  @override
  void initState() {
    super.initState();
    showPassword = widget.isPassword;
  }

  @override
  Widget build(BuildContext context){

    Widget textFormWidget = Container(
      margin: widget.margin,
      child: TextFormField(
        textAlignVertical: TextAlignVertical.center,
        onChanged: widget.onChanged,
        obscureText: showPassword,
        controller: widget.controller,
        focusNode: widget.focusNode,
        maxLength: widget.maxLength,
        onFieldSubmitted: widget.onSubmitted,
        textInputAction: widget.textInputAction,
        keyboardType: widget.textInputType,
        textCapitalization: widget.textCapitalization,
        autovalidateMode: widget.autovalidateMode,
        validator: (value){
          RegExp exp = RegExp("${widget.regex}");
          Iterable<RegExpMatch> matches = exp.allMatches(value!);

          if(matches.isEmpty)
            return widget.errorMessage;
          else
            return null;

        },
        decoration: InputDecoration(
          filled: widget.filled,
          floatingLabelBehavior: widget.floatingLabelBehavior,
          labelText: widget.labelText,
          suffixIcon: widget.isPassword ?  IconButton(
            icon: showPassword ? const Icon(Icons.remove_red_eye_rounded): const Icon(Icons.remove_red_eye_outlined), 
            autofocus: false,
            focusNode: null,
            onPressed: () => setState(() => showPassword = !showPassword),
            padding: EdgeInsets.zero,
          ): widget.closeButton != null ? IconButton(
              icon: Icon(Icons.cancel_outlined), 
              onPressed: widget.closeButton,
              padding: EdgeInsets.zero
          ): null,
          border: widget.withoutOutlineBorder ? OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(2),
          ): null,
          enabledBorder: widget.withoutOutlineBorder ? OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(2),
          ): null,
          disabledBorder: widget.withoutOutlineBorder ? OutlineInputBorder(
            borderSide: const BorderSide(
              width: 1,
              color: Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(2),
          ): null,
          focusedBorder: widget.withoutOutlineBorder ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: const BorderSide(
                width: 1,
                color: Colors.transparent
            ),
          ): null,
          counterText: !widget.showCharNumber ? "": null,
        ),
      ),
    );

    return textFormWidget;

  }

}
