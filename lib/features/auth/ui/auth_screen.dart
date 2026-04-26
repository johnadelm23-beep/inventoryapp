import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_app/core/widgets/app_button.dart';
import 'package:inventory_app/core/widgets/custom_text_form_field.dart';
import 'package:inventory_app/features/auth/ui/register_screen.dart';
import 'package:inventory_app/features/home/ui/home_screen.dart';
import 'package:flutter_svg/svg.dart';

import '../cubit/auth_cubit.dart';

class AuthScreen extends StatelessWidget {
  AuthScreen({super.key});

  final _emailController = TextEditingController();
  final _passswordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 50.w),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text("Inventory App", style: TextStyle(fontSize: 40.sp)),
                  SizedBox(height: 100.h),
                  Form(
                    key: _key,
                    child: Column(
                      spacing: 10,
                      children: [
                        CustomTextFormField(
                          hintText: "الايميل",
                          controller: _emailController,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return "هذا الحقل مطلوب";
                            }
                            return null;
                          },
                          keyboardType: .emailAddress,
                        ),
                        SizedBox(height: 20.h),
                        CustomTextFormField(
                          hintText: "كلمة المرور",
                          obscureText: true,
                          controller: _passswordController,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return "هذا الحقل مطلوب";
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
                            text: "تسجيل دخول",
                            onPressed: () {
                              if (_key.currentState!.validate()) {
                                context.read<AuthCubit>().login(
                                      email: _emailController.text,
                                      password: _passswordController.text,
                                    );
                              }
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                  AppButton(
                    text: "انشاء حساب",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) =>
                            BlocProvider(
                              create: (context) => AuthCubit(),
                              child: RegisterScreen(),
                            )),
                      );
                    },
                  ),
                  SizedBox(height: 20.h),
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
                    child: InkWell(
                      onTap: () {
                        context.read<AuthCubit>().signInWithGoogle();
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 20.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: Colors.grey.shade200,
                        ),
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            SvgPicture.asset('assets/icons/google.svg'),
                            SizedBox(width: 5.w),
                            Center(
                              child: Text(
                                "تسجيل الدخول بحساب جوجل",
                                style: TextStyle(fontSize: 15.sp),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
