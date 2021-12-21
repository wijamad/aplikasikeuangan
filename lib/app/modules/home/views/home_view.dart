import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utslogin/app/controllers/auth_controller.dart';
import 'package:utslogin/app/data/drawer.dart';
import 'package:utslogin/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();
  final day = [
    "Senin",
    "Selasa",
    "Rabu",
    "Kamis",
    "Jum'at",
    "Sabtu",
    "Minggu",
  ];
  final month = [
    'JANUARI',
    'FEBRUARI',
    'MARET',
    'APRIL',
    'MEI',
    'JUNI',
    'JULI',
    'AGUSTUS',
    'SEPTEMBER',
    'OKTOBER',
    'NOVEMBER',
    'DESEMBER',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "DOMPETKU",
            ),
            Text(
              "Pengatur Keuangan sehatku",
              style: TextStyle(color: Colors.white, fontSize: 14.0),
            )
          ],
        ),
      ),
      drawer: Mydrawer(),
      body: Padding(
        padding: EdgeInsets.all(0.8),
        child: ListView(shrinkWrap: true, children: [
          SizedBox(
            height: 10,
          ),
          StreamBuilder<DocumentSnapshot>(
              stream: controller.jumlahStream(authC.profile.value.email!),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                var data = snapshot.data!.data() as Map<String, dynamic>;
                ;
                return SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Pendapatan",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Rp.${data["Pemasukan"]}",
                              style: TextStyle(color: Colors.green),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Pengeluaran",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Rp.${data["Pengeluaran"]}",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              "Total",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Rp.${(data["Pemasukan"] - data["Pengeluaran"])}",
                            ),
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                    ],
                  ),
                );
              }),
          StreamBuilder<QuerySnapshot>(
              stream: controller.data(authC.profile.value.email!),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot2) {
                if (snapshot2.hasError) {
                  return Text('Something went wrong');
                }

                if (snapshot2.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }
                var data = snapshot2.data!.docs;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    DateTime time = DateTime.parse(
                        data[index]["groupTime"].toDate().toString());

                    return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(0.2),
                          width: 1,
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.DETAIL);
                        },
                        child: SizedBox(
                          height: 100,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    SizedBox(width: 30),
                                    Text(
                                      "${time.day}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text("${day[time.weekday - 1]}"),
                                        Text(
                                          "${month[time.month - 1]} ${time.year}",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        Text(
                                          "${time}",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  (data[index]["value"] == "Pengeluaran")
                                      ? Text("-Rp.${data[index]["jumlah"]}",
                                          style: TextStyle(color: Colors.red))
                                      : Text("Rp.${data[index]["jumlah"]}",
                                          style:
                                              TextStyle(color: Colors.green)),
                                  Text(
                                    "${data[index]["catatan"]}",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              })
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.TAMBAH);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }
}
