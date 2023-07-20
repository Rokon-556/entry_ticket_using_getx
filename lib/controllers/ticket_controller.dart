import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../models/ticket.dart';

class TicketController extends GetxController{
    RxBool isDataLoading = true.obs;
  // RxList<Ticket> tickets = <Ticket>[].obs;
  List<Item> tickets = [];


  @override
  void onInit() {
    super.onInit();
    getTickets();
  }

  Future<void> getTickets() async{
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
         log('length2 : ${tickets.length}');
         update();
    }
    }catch(e){
      log(e.toString());
    }
  }
}