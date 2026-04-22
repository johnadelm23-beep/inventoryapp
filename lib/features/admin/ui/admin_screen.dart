import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_app/core/theme/app_colors.dart';

     class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: Text(
          "My Warehouse",
          style: TextStyle(color: Colors.white, fontSize: 20.sp, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none, color: Colors.white),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.inventory_2_outlined), label: 'Inventory'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search product...",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 14.sp),
                        prefixIcon: const Icon(Icons.search, color: Colors.grey),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical: 10.h),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10.w),
                Container(
                  height: 45.h,
                  width: 45.h,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.add_box, color: AppColors.primaryColor),
                label: Text(
                  "Add Product",
                  style: TextStyle(color: AppColors.primaryColor, fontSize: 14.sp),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  const ProductCard(
                    name: "Rice",
                    inStock: 120,
                    minStock: 20,
                  ),
                  const ProductCard(
                    name: "Sugar",
                    inStock: 8,
                    minStock: 15,
                    isLowStock: true,
                  ),
                  const ProductCard(
                    name: "Pasta",
                    inStock: 75,
                    minStock: 10,
                  ),
                  const ProductCard(
                    name: "Oil",
                    inStock: 5,
                    minStock: 20,
                    isLowStock: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final int inStock;
  final int minStock;
  final bool isLowStock;

  const ProductCard({
    super.key,
    required this.name,
    required this.inStock,
    required this.minStock,
    this.isLowStock = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: isLowStock ? Colors.redAccent : Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: isLowStock ? Colors.white : Colors.black87,
                    ),
                  ),
                  if (isLowStock) ...[
                    SizedBox(width: 8.w),
                    const Icon(Icons.warning_amber_rounded, color: Colors.yellow, size: 20),
                  ]
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                "In Stock: $inStock",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: isLowStock ? Colors.white.withOpacity(0.9) : Colors.grey,
                ),
              ),
              Text(
                "Min: $minStock",
                style: TextStyle(
                  fontSize: 14.sp,
                  color: isLowStock ? Colors.white.withOpacity(0.9) : Colors.grey,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: isLowStock ? Colors.white.withOpacity(0.2) : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Row(
              children: [
                Icon(Icons.remove, size: 20, color: isLowStock ? Colors.white : Colors.black54),
                SizedBox(width: 15.w),
                Text(
                  "$inStock",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: isLowStock ? Colors.white : Colors.black87,
                  ),
                ),
                SizedBox(width: 15.w),
                Icon(Icons.add, size: 20, color: isLowStock ? Colors.white : Colors.black54),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
