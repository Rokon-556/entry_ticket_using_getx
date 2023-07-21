import 'package:get/get.dart';
import 'package:tickets/controllers/my_ticket_controller.dart';

class MyTicketsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MyTicketController());
  }
}
