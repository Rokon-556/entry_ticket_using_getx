import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/ticket.dart';

class TicketController extends GetxController{
    RxBool isDataLoading = false.obs;
  // RxList<Ticket> tickets = <Ticket>[].obs;
  List<Item> tickets = [];


  @override
  void onInit() {
    super.onInit();
    getTickets();
  }

  Future<void> getTickets() async{
    isDataLoading.value = true;
    final dio = Dio();
    
    const url = "http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_ms";
    dio.options.headers['MOBILE_NUMBER'] = "01717956094";
    final response = await dio.get(url);
    try{
      if(response.statusCode == 200){
         var data = response.data['items'];
         for(var ticket in data){
          tickets.add(Item.fromJson(ticket));
         }
         update();
         isDataLoading.value = false;
    }
    isDataLoading.value = false;
    }catch(e){
      log(e.toString());
    }
  }
}