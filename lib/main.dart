import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:sumptucious_shoe/scr/providers/app.dart';
import 'package:sumptucious_shoe/scr/providers/category.dart';
import 'package:sumptucious_shoe/scr/providers/product.dart';
import 'package:sumptucious_shoe/scr/providers/store.dart';
import 'package:sumptucious_shoe/scr/providers/user.dart';
import 'package:sumptucious_shoe/scr/screens/home.dart';
import 'package:sumptucious_shoe/scr/screens/login.dart';
import 'package:sumptucious_shoe/scr/screens/splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AppProvider()),
        ChangeNotifierProvider.value(value: UserProvider.initialize()),
        ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
        ChangeNotifierProvider.value(value: StoreProvider.initialize()),
        ChangeNotifierProvider.value(value: ProductProvider.initialize()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Sumptucious Shoe',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: ScreensController())));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<UserProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}
