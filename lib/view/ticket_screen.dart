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
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColor,
          leading: const Icon(Icons.arrow_back),
        ),
        body: GetBuilder<TicketController>(
          init: TicketController(),
          initState: (_) {},
          builder: (controller) {
            return controller.isDataLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 3,
                        child: Container(
                          height: 200,
                          width: double.infinity,
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: Theme.of(context).primaryColor),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Container(
                                    //   child: CircleAvatar(
                                    //     child: Image.asset('assets/images/logo.png'),
                                    //   ),
                                    // ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'This Is Your Ticket',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        Text(
                                          'Order ID: ${controller.tickets[index].pk}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                        Text(
                                          'Ticket Price: ${controller.tickets[index].total}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            Get.to(() => MyTicketScreen(
                                                ticket: controller
                                                    .tickets[index]));
                                            // Get.toNamed(AppRoutes.MY_TICKET_SCREEN,arguments: controller.tickets[index].pk);
                                          },
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Theme.of(context)
                                                      .primaryColor),
                                          child: Text(
                                            'Activate',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyLarge,
                                          ),
                                        ),
                                      ],
                                    ),
                                    // Container(
                                    //   child: CircleAvatar(
                                    //     child: Image.asset('assets/images/qr3.png'),
                                    //   ),
                                    // )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'Purchase Date:${controller.tickets[index].sellDate}'),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Details',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.arrow_circle_right,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          ),
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
                  );
          },
        ));
  }
}
