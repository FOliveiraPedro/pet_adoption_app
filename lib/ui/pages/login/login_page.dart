import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/input/custom_password_text_field.dart';
import '../../components/input/custom_text_field.dart';
import '../../theme/theme.dart';
import '../pages.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({
    Key? key,
    required this.presenter,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                        validateFunction: widget.presenter.validadeEmail,
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
                        validateFunction: widget.presenter.validadePassword,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState((){
                            isLoading = true;
                          });
                          print("isLoading" + isLoading.toString());
                          if (formKey.currentState!.validate()) {
                            bool response = await widget.presenter.login();
                            if (response) {
                              setState((){
                                isLoading = false;
                              });
                              Navigator.pop(context);
                              Navigator.pop(context);
                              widget.presenter.goToHome();
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
                                    'Sign In',
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
                  GestureDetector(
                    onTap: widget.presenter.goToSignUp,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Text(
                        'Sign Up',
                        style: GoogleFonts.workSans(
                          color: AppColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
