import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/helpers.dart';
import '../../theme/theme.dart';

class CustomTextField extends StatefulWidget {
  final Function(String value) validateFunction;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const CustomTextField({
    Key? key,
    required this.validateFunction,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final TextEditingController _textEditingController;

  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _textEditingController = TextEditingController();

    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: _textEditingController,
        keyboardType: widget.keyboardType,
        focusNode: _focusNode,
        maxLength: 100,
        cursorColor: AppColors.neutral0,
        style: GoogleFonts.workSans(
          color: AppColors.purple,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        validator: (value) {
          if (value == '') {
            return 'Campo obrigatório';
          }
          if (widget.keyboardType == TextInputType.emailAddress) {
            if (!isEmail(value!)) {
              return 'E-mail inválido';
            }
          }
          widget.validateFunction(_textEditingController.text);
        },
        decoration: InputDecoration(
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
          alignLabelWithHint: true,
          border: InputBorder.none,
          enabledBorder: colorBorder(),
          focusedBorder: colorBorder(),
          disabledBorder: colorBorder(),
          errorBorder: errorBorder(),
          focusedErrorBorder: colorBorder(),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(16),
            child: widget.suffixIcon,
          ),
          suffixIconConstraints: const BoxConstraints(
            minHeight: 24,
            minWidth: 24,
          ),
        ),
        obscuringCharacter: '*',
      );



  OutlineInputBorder colorBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 2, color: AppColors.purple),
      );

  OutlineInputBorder errorBorder() => OutlineInputBorder(
    borderRadius: BorderRadius.circular(8),
    borderSide: const BorderSide(width: 2, color: AppColors.danger),
  );

  bool isEmail(String em) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);

    return regExp.hasMatch(em);
  }
}
