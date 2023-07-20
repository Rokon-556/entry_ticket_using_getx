import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickets/controllers/my_ticket_controller.dart';
import 'package:tickets/controllers/ticket_controller.dart';

import '../models/my_ticket.dart';
import '../models/ticket.dart';

class MyTicketScreen extends StatefulWidget {
  final token;
  final Item? ticket;

  const MyTicketScreen({super.key,  this.token, this.ticket});

  @override
  State<MyTicketScreen> createState() => _MyTicketScreenState();
}

class _MyTicketScreenState extends State<MyTicketScreen> {
  MyTicketController myTicketController = MyTicketController();
  TicketController controller = Get.find<TicketController>();


  @override
  void initState() {
    myTicketController.getMyTickets(widget.token.toString());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY TICKET',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(bottom:25.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(itemBuilder: (context,index){
                return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  color: const Color(0xfffbe5ae),
                  child: Row(
                    children: [
                    const Expanded(
                      flex: 2,
                      child: Branch_Section_Widget(),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                color: Color(0xfffbe5ae), shape: BoxShape.circle),
                          ),
                          Column(
                            children: [
                              for (int i = 1; i <= 48; i++)
                                i.isEven
                                    ? Container(
                                        width: 4,
                                        height: 4,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(2)),
                                      )
                                    : const SizedBox(height: 3),
                            ],
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                color: Color(0xfffbe5ae), shape: BoxShape.circle),
                          ),
                        ],
                      ),
                    ),
                    User_Section_Widget(myTicketController: myTicketController,item: myTicketController.tickets,index:index ,)
                  ]),
                ),
              );
              }, itemCount: myTicketController.tickets.length,),
            ),
            // const Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
            color: Colors.white,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  
                  Column(
                    children: [
                      normText('Order Id'),
                      colorText('${widget.ticket?.pk}', context),
                      normText('Ticket purchase date'),
                      colorText("${widget.ticket?.sellDate}", context),
                      normText('Ticket Expiry Date'),
                      colorText("${widget.ticket?.startDate}", context),
                      normText('Ticket Price'),
                      colorText("${widget.ticket?.total}", context),
                    ],
                  ),
                  Image.asset(
                    'assets/images/qr2.png',
                    fit: BoxFit.cover,
                    height: 150,
                    width: 150,
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }

  Text colorText(String digit, BuildContext context) => Text(
        digit,
        style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor),
      );

  Text normText(String text) => Text(
        text,
        style: const TextStyle(fontSize: 13, color: Colors.grey),
      );
}

class User_Section_Widget extends StatelessWidget {
  const User_Section_Widget({
    super.key,
    required this.myTicketController, required this.item, required this.index,
  });

  final MyTicketController myTicketController;
  final List<TicketItem> item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Column(
        children: [
          Text(
            '${item[index].dsc} Ticket',
            style: Theme.of(context).textTheme.titleMedium,
          ),
            Text(
              'Serial Number: ${item[index].pk}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Quantity: ${item[index].qty}',
              style: const TextStyle(fontSize: 14, color: Colors.red),
            ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.green),
            child:  Text(
              'Price: ${item[index].mrp}',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class Branch_Section_Widget extends StatelessWidget {
  const Branch_Section_Widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/babuland.png'),
        const Text('Wari'),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        const Text('Uttara'),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        const Text('Mirpur'),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
        const Text('Bashundhara'),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
