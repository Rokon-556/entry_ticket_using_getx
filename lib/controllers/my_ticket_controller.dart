import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';


import '../models/my_ticket.dart';

class MyTicketController extends GetxController{

  RxBool isDataLoading = true.obs;
  List<TicketItem> tickets = <TicketItem>[];


  

  Future<void> getMyTickets(String orderId) async{
    final dio = Dio();
    dio.options.headers['ORDER_ID'] = orderId;
    const url = "http://apps.babuland.org/bblapi/babuland/v1/mock_ticket_dt";
    
    final response = await dio.get(url);
    try{
      if(response.statusCode == 200){
         var data = response.data['items'];
         for(var ticket in data){
          tickets.add(TicketItem.fromJson(ticket));
         }

      log("${tickets.length}");

    }
    }catch(e){
      log(e.toString());
    }
  }

}