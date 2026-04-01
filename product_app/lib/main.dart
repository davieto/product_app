import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;

import 'presentation/pages/home_page.dart';
import 'state/provider/counter_provider.dart';
import 'state/provider/product_provider.dart';
import 'state/provider/api_product_provider.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(
    ProviderScope(
      child: provider.MultiProvider(
        providers: [
          provider.ChangeNotifierProvider(create: (_) => CounterProvider()),
          provider.ChangeNotifierProvider(create: (_) => ProductProvider()),
          provider.ChangeNotifierProvider(create: (_) => ApiProductProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Product App', home: const HomePage());
  }
}
