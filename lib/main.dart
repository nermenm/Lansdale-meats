import 'package:eats/screens/cart/provider.dart';
import 'package:eats/screens/splash_screen.dart';
import 'package:eats/utils/theme/app_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: AppTheme.designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => CartProvider()),
            // Add other providers if needed
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Lansdale Meats & Deli',
            theme: AppTheme.themeData,
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
