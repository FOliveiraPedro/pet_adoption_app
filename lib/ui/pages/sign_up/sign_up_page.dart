import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/components.dart';
import '../../components/input/custom_password_text_field.dart';
import '../../components/input/custom_text_field.dart';
import '../../theme/theme.dart';
import '../pages.dart';

class SignUpPage extends StatefulWidget {
  final SignUpPresenter presenter;

  const SignUpPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  bool changeColor = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          'E-mail',
                          style: GoogleFonts.workSans(
                            color: changeColor
                                ? AppColors.danger
                                : AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CustomTextField(
                        validateFunction: widget.presenter.validateEmail,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          'Password',
                          style: GoogleFonts.workSans(
                            color: changeColor
                                ? AppColors.danger
                                : AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CustomPasswordTextField(
                        validateFunction: widget.presenter.validatePassword,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          'Confirm Password',
                          style: GoogleFonts.workSans(
                            color: changeColor
                                ? AppColors.danger
                                : AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      CustomPasswordTextField(
                        validateFunction: widget.presenter.validateConfirmPassword,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState((){
                            isLoading = true;
                          });
                          if (formKey.currentState!.validate()) {
                            bool response = await widget.presenter.signUp();
                            if (response) {
                              setState((){
                                isLoading = false;
                              });
                              showSnackbarError(message: 'Registrated with success!');
                              Future.delayed(const Duration(seconds: 2), () async {
                                Navigator.pop(context);
                              });

                            }
                          } else {
                            setState((){
                              changeColor = !changeColor;
                              isLoading = false;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          height: 48,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primary,
                          ),
                          child: Center(
                            child: isLoading
                                ? const CircularProgressIndicator(
                                    color: AppColors.neutral7,
                                  )
                                : Text(
                                    'Sign Up',
                                    style: GoogleFonts.workSans(
                                      color: AppColors.neutral7,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
