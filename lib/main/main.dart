import 'package:daraz_pro_max/Screens/ProductDetail/ProductDetail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Screens/ProductOverview/ProductOverview.dart';
import '../provider/providerProduct.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: 'Ubuntu', colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal).copyWith(secondary: Colors.lightGreenAccent),
        ),
        home: ProductOverview(),
        routes: {
          ProductDetail.routeName : (ctx) => ProductDetail()
        },
      ),
    );
  }
}
