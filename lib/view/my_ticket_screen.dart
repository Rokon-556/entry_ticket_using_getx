import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tickets/controllers/my_ticket_controller.dart';

import '../models/my_ticket.dart';
import '../models/ticket.dart';

class MyTicketScreen extends StatefulWidget {
  final Item? ticket;

  const MyTicketScreen({super.key, this.ticket});

  @override
  State<MyTicketScreen> createState() => _MyTicketScreenState();
}

class _MyTicketScreenState extends State<MyTicketScreen> {
  MyTicketController myTicketController = MyTicketController();

  @override
  void initState() {
    myTicketController.getMyTickets(widget.ticket?.pk.toString() ?? '');
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
        body: GetBuilder<MyTicketController>(
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 25.0),
              child: Column(
                children: [
                  controller.isDataLoading.value
                      ? const Expanded(
                          child: Center(child: CircularProgressIndicator()))
                      : Expanded(
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  color: const Color(0xfffbe5ae),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: const BorderSide(
                                                  color: Colors.red, width: 3),
                                              left: BorderSide(
                                                  color: Get.theme.primaryColor,
                                                  width: 3),
                                              right: const BorderSide(
                                                  color: Colors.blue, width: 3),
                                              top: const BorderSide(
                                                  color: Colors.green,
                                                  width: 3))),
                                      child: Row(children: [
                                        Expanded(
                                          flex: 2,
                                          child: BranchSectionWidget(),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Column(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: Color(0xfffbe5ae),
                                                    shape: BoxShape.circle),
                                              ),
                                              Column(
                                                children: [
                                                  for (int i = 1; i <= 48; i++)
                                                    i.isEven
                                                        ? Container(
                                                            width: 4,
                                                            height: 4,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2)),
                                                          )
                                                        : const SizedBox(
                                                            height: 3),
                                                ],
                                              ),
                                              Container(
                                                decoration: const BoxDecoration(
                                                    color: Colors.black,
                                                    shape: BoxShape.circle),
                                              ),
                                            ],
                                          ),
                                        ),
                                        UserSectionWidget(
                                          myTicketController:
                                              myTicketController,
                                          item: myTicketController.tickets,
                                          index: index,
                                        )
                                      ]),
                                    ),
                                  ),
                                ),
                              );
                            },
                            itemCount: myTicketController.tickets.length,
                          ),
                        ),
                  footerSection(), // const Spacer(),
                ],
              ),
            );
          },
          init: MyTicketController(),
          initState: (_) {},
        ));
  }

  Text colorText(String digit, BuildContext context) => Text(
        digit,
        style: TextStyle(fontSize: 13, color: Theme.of(context).primaryColor),
      );

  Text normText(String text) => Text(
        text,
        style: const TextStyle(fontSize: 13, color: Colors.grey,fontWeight: FontWeight.w700),
      );

  Widget footerSection() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            const Text(
              "Scan QR code to avail ticket",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  normText('Order Id'),
                  colorText('${widget.ticket?.pk}', context),
                  normText('Ticket purchase date'),
                  colorText("${widget.ticket?.sellDate}", context),
                  normText('Ticket Expiry Date'),
                  colorText("${widget.ticket?.startDate}", context),
                  normText('Ticket Price'),
                  colorText("${widget.ticket?.total}৳", context),
                ],
              ),
              Image.asset(
                'assets/images/qr.png',
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}

class UserSectionWidget extends StatelessWidget {
  const UserSectionWidget({
    super.key,
    required this.myTicketController,
    required this.item,
    required this.index,
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
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'SL NO: ${item[index].pk}',
            style: const TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 15),
          Text(
            'Quantity: ${item[index].qty}',
            style: const TextStyle(
                fontSize: 15, color: Colors.red, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.green),
            child: Text(
              'Price: ${item[index].mrp}৳',
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}

class BranchSectionWidget extends StatelessWidget {
  final place = ["Wari", "Uttara", "Mirpur", "Bashundra"];
  BranchSectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Column(
          children: [
            Image.asset('assets/images/babuland.png'),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Center(child: Text(place[index]));
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    thickness: 2,
                  );
                },
                itemCount: place.length)
          ],
        ));
  }
}
