import 'package:get/get.dart';
import 'package:tickets/routes/routes.dart';

import '../bindings/my_tickets_binding.dart';
import '../bindings/ticket_binding.dart';
import '../view/my_ticket_screen.dart';
import '../view/ticket_screen.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.TICKET_SCREEN,
      page: () =>  const TicketScreen(),
      binding: TicketBindings(),
    ),
     GetPage(
      name: AppRoutes.MY_TICKET_SCREEN,
      page: () =>  const MyTicketScreen(),
      binding: MyTicketsBindings(),
    ),
  ];
}