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
      theme: ThemeData(
          dividerColor: const Color(0XFFFF8C1A),
          appBarTheme: const AppBarTheme(
            color: Color(0XFFFF8C1A),
            centerTitle: true,
          ),
          primaryColor: const Color(0XFFFF8C1A),
          progressIndicatorTheme:
              const ProgressIndicatorThemeData(color: Color(0XFFFF8C1A)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0XFFFF8C1A))))),
    );
  }
}
