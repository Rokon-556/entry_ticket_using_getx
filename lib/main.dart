import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickets/bindings/ticket_binding.dart';
import 'package:tickets/routes/pages.dart';
import 'package:tickets/routes/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Babuland',
      initialRoute: AppRoutes.TICKET_SCREEN,
      initialBinding: TicketBindings(),
      getPages: AppPages.list,
    );
  }
}