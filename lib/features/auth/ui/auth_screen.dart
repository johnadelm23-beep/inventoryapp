import 'package:flutter/material.dart';
import 'package:inventory_app/core/widgets/app_button.dart';
import 'package:inventory_app/core/widgets/custom_text_form_field.dart';
import 'package:inventory_app/features/auth/ui/register_screen.dart';
import 'package:inventory_app/features/home/ui/home_screen.dart';
import 'package:flutter_svg/svg.dart';

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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  Text("Inventory App", style: TextStyle(fontSize: 40)),
                  const SizedBox(height: 100),
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
                          },
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          hintText: "كلمة المرور",
                          obscureText: true,
                          controller: _passswordController,
                          validator: (v) {
                            if (v == null || v.isEmpty) {
                              return "هذا الحقل مطلوب";
                            }
                          },
                        ),
                        const SizedBox(height: 50),
                        AppButton(
                          text: "تسجيل دخول",
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (c) => HomeScreen()),
                                (e) => false,
                              );
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  AppButton(
                    text: "انشاء حساب",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => RegisterScreen()),
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                        mainAxisAlignment: .center,
                        children: [
                          SvgPicture.asset('assets/icons/google.svg'),
                          SizedBox(width: 5),
                          Center(
                            child: Text(
                              "تسجيل الدخول بحساب جوجل",
                              style: TextStyle(fontSize: 25),
                            ),
                          ),
                        ],
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
