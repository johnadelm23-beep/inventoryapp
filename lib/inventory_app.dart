import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inventory_app/features/auth/cubit/auth_cubit.dart';
import 'package:inventory_app/features/auth/ui/auth_screen.dart';

import 'features/home/ui/home_screen.dart';

class InventoryApp extends StatelessWidget {
  const InventoryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: MaterialApp(
          theme: ThemeData(fontFamily: "appFont"),
          home:FirebaseAuth.instance.currentUser!=null?HomeScreen(): AuthScreen(),
        ),
      ),
    );
  }
}
