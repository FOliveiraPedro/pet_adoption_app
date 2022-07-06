import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../helpers/helpers.dart';
import '../../theme/theme.dart';
import '../components.dart';

class CustomPasswordTextField extends StatefulWidget {
  final Function(String value) validateFunction;
  final TextInputType keyboardType;
  final bool showErrorMessage;

  const CustomPasswordTextField({
    Key? key,
    required this.validateFunction,
    this.keyboardType = TextInputType.text,
    this.showErrorMessage = false,
  }) : super(key: key);

  @override
  State<CustomPasswordTextField> createState() =>
      _CustomPasswordTextFieldState();
}

class _CustomPasswordTextFieldState extends State<CustomPasswordTextField> {
  late final TextEditingController _textEditingController;
  bool obscureText = true;
  bool isEmpty = true;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    isEmpty = _textEditingController.text.isEmpty;
  }

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: _textEditingController,
        keyboardType: widget.keyboardType,
        maxLength: 100,
        obscureText: obscureText,
        cursorColor: AppColors.neutral0,
        style: GoogleFonts.workSans(
          color: AppColors.primary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
        validator: (value) {
          if (value == '') {
            return 'Campo obrigatório';
          }
          if (value!.length < 6) {
            return 'Deve possuir 6 digitos ou mais';
          }
          if(widget.validateFunction(_textEditingController.text) != null) {
            return widget.validateFunction(_textEditingController.text);
          }
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
            child: GestureDetector(
              onTap: _onVisibilityButtonClick,
              child: obscureText
                  ? const Icon(Icons.visibility_off, color: AppColors.primary,)
                  : const Icon(Icons.visibility, color: AppColors.primary,),
            ),
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
        borderSide: const BorderSide(width: 2, color: AppColors.primary),
      );

  OutlineInputBorder errorBorder() => OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(width: 2, color: AppColors.danger),
      );

  void _onVisibilityButtonClick() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void _onChanged(String text) {
    if (isEmpty != text.isEmpty) {
      setState(() {
        isEmpty = text.isEmpty;
      });
    }
  }
}
