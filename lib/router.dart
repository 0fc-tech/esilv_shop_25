import 'package:esilv_shop/presentation/page/cart_page.dart';
import 'package:esilv_shop/presentation/page/detail_page/detail_page.dart';
import 'package:esilv_shop/presentation/page/list_product/list_product_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ListProductPage(),
      routes: [
        GoRoute(path: 'cart', builder: (context, state) => CartPage()),
        GoRoute(
          path: 'detail/:id',
          builder: (context, state) {
            final id = int.tryParse(state.pathParameters["id"] ?? "-1") ?? -1;
            if (id != -1) {
              return DetailPage(id);
            }
            return Center(child: Icon(Icons.error));
          },
        ),
      ],
    ),
  ],
);
