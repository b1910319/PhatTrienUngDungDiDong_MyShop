import 'package:flutter/material.dart';
import 'ui/products/products_manager.dart';
// import 'ui/products/product_detail_screen.dart';
// import 'ui/products/product_overview_screen.dart';
// import 'ui/products/user_products_screen.dart';
// import 'ui/cart/cart_screen.dart';
// import 'ui/orders/orders_screen.dart';
import 'ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.purple,
        ).copyWith(
          secondary: Colors.deepOrange,
        ),
      ),
      // home: const SafeArea(
      //   //bước 2 (1)
      //   // child: ProductDetailScreen(
      //   //   ProductsManager().items[0],
      //   // ),
      //   // buoc 3 (1)
      //   // child: ProductsOverviewScreen(),
      //   //buoc 4 (1)
      //   // child: UserProductsScreen(),
      //   //buoc 1 (2)
      //   // child: CartScreen(),
      //   //buoc 2 (2)
      //   child: OrdersScreen(),

      // ),
      //buoc3 (2)
      home: const ProductsOverviewScreen(),
      routes: {
        CartScreen.routeName: (ctx) => const CartScreen(),
        OrdersScreen.routeName: (ctx) => const OrdersScreen(),
        UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (ctx) {
              return ProductDetailScreen(
                ProductsManager().findById(productId),
              );
            },
          );
        }
        return null;
      },
    );
  }
}
