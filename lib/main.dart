import 'package:flutter/material.dart';
import 'package:food_delivery/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:food_delivery/config/config.dart';
import 'package:food_delivery/providers/Product_provider.dart';
import 'package:food_delivery/providers/cartProvider.dart';
import 'package:food_delivery/providers/check_out_provider.dart';
import 'package:food_delivery/providers/user_provider.dart';
import 'package:food_delivery/providers/wishlistProvider.dart';
import 'package:food_delivery/screens/Home/homescreen.dart';
import 'package:food_delivery/screens/profileScreen/myprofile.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider<CheckOutProvider>(
          create: (context) => CheckOutProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: backgroundScaffoldColor,
        ),
        home: SignIn(),
      ),
    );
  }
}
