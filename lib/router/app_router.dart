import 'package:flutter/material.dart';
import 'package:prueba_tienda/pages/home_products.dart';
import 'package:prueba_tienda/pages/login_page.dart';

class AppRouter {
  static String login = "/";
  static String homeProducts = "home_products";

  static final routes = {
    '/': (BuildContext context) => LoginPage(),
    'home_products': (BuildContext context) => const HomeProductsPage(),
  };
}
