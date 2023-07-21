import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickets/view/my_ticket_screen.dart';

import '../controllers/ticket_controller.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  TicketController controller = TicketController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TICKETS'),
        ),
        body: GetBuilder<TicketController>(
          init: TicketController(),
          initState: (_) {},
          builder: (controller) {
            return controller.isDataLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 3,
                          child: Container(
                            margin: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: const BorderSide(
                                      color: Colors.red, width: 2),
                                  left: BorderSide(
                                      color: Get.theme.primaryColor, width: 2),
                                  right: const BorderSide(
                                      color: Colors.blue, width: 2),
                                  top: const BorderSide(
                                      color: Colors.green, width: 2)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CircleAvatar(
                                        child: Image.asset(
                                            'assets/images/babuland.png'),
                                      ),
                                      Column(
                                        children: [
                                          const Text(
                                            'This is your Entry Ticket',
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                              'Order ID: ${controller.tickets[index].pk}',
                                              style: const TextStyle(fontSize: 13)),
                                          const SizedBox(height: 2),
                                          Text(
                                              'Ticket Price: ${controller.tickets[index].total}',
                                              style: const TextStyle(fontSize: 15)),
                                          const SizedBox(height: 2),
                                          SizedBox(
                                            width: Get.width * 0.35,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                Get.to(() => MyTicketScreen(
                                                    ticket: controller
                                                        .tickets[index]));
                                              },
                                              child: const Text(
                                                'Active',
                                                style: TextStyle(fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      CircleAvatar(
                                        child: Image.asset(
                                            'assets/images/qr2.png'),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10, top: 10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                            'Purchase Date:${controller.tickets[index].sellDate}'),
                                        Row(
                                          children: [
                                            Text(
                                              'Details',
                                              style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor),
                                            ),
                                            Icon(
                                              Icons.arrow_circle_right,
                                              size: 18,
                                              color: Get.theme.primaryColor,
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: controller.tickets.length,
                    ),
                  );
          },
        ));
  }
}
