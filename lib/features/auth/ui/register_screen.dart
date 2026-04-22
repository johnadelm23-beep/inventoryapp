import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_app/core/widgets/app_button.dart';
import 'package:inventory_app/core/widgets/custom_text_form_field.dart';
import 'package:inventory_app/features/home/ui/home_screen.dart';

import '../cubit/auth_cubit.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final _key = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailControlller = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordControoler = TextEditingController();


  @override


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 150.w),
        child: Center(
          child: SafeArea(
            child: Column(
              spacing: 20,
              children: [
                Form(
                  key: _key,
                  child: Column(
                    spacing: 20,
                    children: [
                      CustomTextFormField(
                        hintText: "الاسم",
                        controller: _nameController,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "هذا الحقل مطلوب";
                          } else if (v.length < 4) {
                            return "من فضلك ادخل اسم يحتوي علي 4 احرف او اكثر";
                          }
                          return null;
                        },
                        keyboardType: .name,
                      ),
                      CustomTextFormField(
                        hintText: "الايميل",
                        controller: _emailControlller,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "هذا الحقل مطلوب";
                          }
                          return null;
                        },
                        keyboardType: .emailAddress,
                      ),
                      CustomTextFormField(
                        hintText: "كلمة المرور",
                        obscureText: true,
                        controller: _passwordController,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "هذا الحقل مطلوب";
                          } else if (v.length < 4) {
                            return "كلمة المرور ضعيفة";
                          }
                          return null;
                        },
                        keyboardType: .visiblePassword,
                      ),
                      CustomTextFormField(
                        hintText: "تاكيد كلمة المرور",
                        obscureText: true,
                        controller: _confirmPasswordControoler,
                        validator: (v) {
                          if (v == null || v.isEmpty) {
                            return "هذا الحقل مطلوب";
                          } else if (v != _passwordController.text) {
                            return "كلمة المرور غير صحيحة";
                          }
                          return null;
                        },
                        keyboardType: .visiblePassword,
                      ),
                      SizedBox(height: 50.h),
                      BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is AuthLoadingState) {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (state is AuthSuccessState) {
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (c) => HomeScreen()),
                            );
                          } else if (state is AuthErrorState) {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.errorMessage),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: AppButton(
                          text: "انشاء الحساب",
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              context.read<AuthCubit>().register(
                                    email: _emailControlller.text,
                                    password: _passwordController.text,
                                    name: _nameController.text,
                                    confirmPassword: _confirmPasswordControoler.text,
                                  );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
