import 'package:flutter/material.dart';
import 'package:inventory_app/core/theme/app_colors.dart';
import 'package:inventory_app/core/widgets/app_button.dart';
import 'package:inventory_app/core/widgets/custom_text_form_field.dart';

class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key});
  final _productNameController = TextEditingController();
  final _productQuntityController = TextEditingController();
  final _minProductQuntityController = TextEditingController();
  final _productDescriptionController = TextEditingController();
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
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          spacing: 10,
          children: [
            Column(
              crossAxisAlignment: .end,
              spacing: 10,
              children: [
                Text("اسم المنتج", style: TextStyle(fontSize: 25)),
                CustomTextFormField(
                  hintText: "اسم المنتج",
                  controller: _productNameController,
                  keyboardType: .name,
                ),
                const SizedBox(height: 10),
                Text("الكمية", style: TextStyle(fontSize: 25)),
                CustomTextFormField(
                  hintText: "الكمية",
                  controller: _productQuntityController,
                  keyboardType: .phone,
                ),
                const SizedBox(height: 10),
                Text(
                  "أقل كمية ترغب بها موجوده لديك",
                  style: TextStyle(fontSize: 25),
                ),
                CustomTextFormField(
                  hintText: "أقل كمية",
                  controller: _minProductQuntityController,
                  keyboardType: .phone,
                ),
                SizedBox(height: 10),
                Text("معلومات عن المنتج", style: TextStyle(fontSize: 25)),
                CustomTextFormField(
                  hintText: "وصف",
                  controller: _productDescriptionController,
                  maxLines: 3,
                  keyboardType: .name,
                ),
              ],
            ),

            const SizedBox(height: 50),
            AppButton(text: "حفظ المنتج", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
