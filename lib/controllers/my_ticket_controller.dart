import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:tickets/controllers/ticket_controller.dart';

import '../models/my_ticket.dart';

class MyTicketController extends GetxController {
  RxBool isDataLoading = false.obs;
  List<TicketItem> tickets = <TicketItem>[];
  TicketController tController = Get.find<TicketController>();
  int? token;

  @override
  void onInit() {
    super.onInit();
    getMyTickets(tController.tickets[token ?? 0].pk.toString());
  }

  Future<void> getMyTickets(String orderId) async {
    isDataLoading.value = true;
    final dio = Dio();
    dio.options.headers['ORDER_ID'] = orderId;
    const url = "http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_dt";

    final response = await dio.get(url);
    try {
      if (response.statusCode == 200) {
        var data = response.data['items'];
        for (var ticket in data) {
          tickets.add(TicketItem.fromJson(ticket));
        }

        update();
        isDataLoading.value = false;
      }
      isDataLoading.value = false;
    } catch (e) {
      log(e.toString());
    }
  }
}
