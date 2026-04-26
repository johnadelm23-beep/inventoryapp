import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_app/core/theme/app_colors.dart';
import 'package:inventory_app/features/add_product/ui/add_product_screen.dart';
import 'package:inventory_app/features/search/ui/search_screen.dart';

import '../../admin/ui/admin_screen.dart';
import '../../auth/ui/auth_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          "الصفحة الرئيسية",
          style: TextStyle(fontSize: 15.sp, color: Colors.white),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(16.0.r),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => SearchScreen()),
                      );
                    },
                    child: Icon(Icons.search, size: 30.r),
                  ),
                  SizedBox(width: 5.w),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12.r),
                      ),
                      minimumSize: Size(40.r, 40.r),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (c) => AddProductScreen()),
                      );
                    },
                    child: Text(
                      "+",
                      style: TextStyle(
                        fontWeight: .bold,
                        color: Colors.white,
                        fontSize: 30.sp,
                      ),
                    ),
                  ),
                  SizedBox(width: 5.w),

                  InkWell(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (c) => AuthScreen()),
                        );

                      },
                      child: Icon(Icons.arrow_back)),
                  SizedBox(width: 5.w),
                  InkWell(
                      onTap: () {

                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (c) => AdminScreen()),
                        );

                      },
                      child: Icon(Icons.arrow_back))


                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
