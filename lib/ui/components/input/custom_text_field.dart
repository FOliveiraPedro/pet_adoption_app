import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../helpers/helpers.dart';
import '../../theme/theme.dart';

class CustomTextField extends StatefulWidget {
  final Function(String value) validateFunction;
  final TextInputType keyboardType;
  String errorMessage;
  final Widget? suffixIcon;

  CustomTextField({
    Key? key,
    required this.validateFunction,
    this.keyboardType = TextInputType.text,
    required this.errorMessage,
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
        style: AppTextTheme.paragraph1.copyWith(),
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
          labelStyle: AppTextTheme.paragraph1.copyWith(
            color: AppColors.neutral0,
          ),
          floatingLabelStyle: AppTextTheme.caption1.copyWith(
            color: _changeBorderColor,
          ),
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

  Color get _changeBorderColor {
    if (widget.errorMessage == null && _textEditingController.text.isEmpty) {
      return AppColors.neutral3;
    } else if (widget.errorMessage != null) {
      return AppColors.danger;
    } else {
      return AppColors.neutral0;
    }
  }

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
