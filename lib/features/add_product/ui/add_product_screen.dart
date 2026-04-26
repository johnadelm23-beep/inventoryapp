import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_app/core/theme/app_colors.dart';
import 'package:inventory_app/core/widgets/app_button.dart';
import 'package:inventory_app/core/widgets/custom_text_form_field.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});
  final _productNameController = TextEditingController();
  final _productQuntityController = TextEditingController();
  final _minProductQuntityController = TextEditingController();
  final _productDescriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyActions: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: Text(
          "إضافة منتج جديد",
          style: TextStyle(fontSize: 20.sp, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.r),
        child: Form(
          key: _formKey,
          child: Column(
            spacing: 10,
            children: [
              Column(
                crossAxisAlignment: .end,
                spacing: 10,
                children: [
                  Text("اسم المنتج", style: TextStyle(fontSize: 15.sp)),
                  CustomTextFormField(
                    hintText: "اسم المنتج",
                    controller: _productNameController,
                    keyboardType: .name,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Text("الكمية", style: TextStyle(fontSize: 15.sp)),
                  CustomTextFormField(
                    hintText: "الكمية",
                    controller: _productQuntityController,
                    keyboardType: .phone,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "أقل كمية ترغب بها موجوده لديك",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                  CustomTextFormField(
                    hintText: "أقل كمية",
                    controller: _minProductQuntityController,
                    keyboardType: .phone,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.h),
                  Text("معلومات عن المنتج", style: TextStyle(fontSize: 15.sp)),
                  CustomTextFormField(
                    hintText: "وصف",
                    controller: _productDescriptionController,
                    maxLines: 3,
                    keyboardType: .name,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return "هذا الحقل مطلوب";
                      }
                      return null;
                    },
                  ),
                ],
              ),
              SizedBox(height: 50.h),
              AppButton(
                  text: "حفظ المنتج",
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle save logic
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
