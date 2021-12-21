import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/rekening_controller.dart';

class RekeningView extends GetView<RekeningController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Rekening'), backgroundColor: Colors.blue),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              const Image(
                image: NetworkImage(
                    'https://w7.pngwing.com/pngs/98/991/png-transparent-computer-icons-bank-icon-design-screenshot-bank-blue-angle-logo.png'),
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'BCA',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rp 1.500.000',
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 13),
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              const Image(
                image: NetworkImage(
                    'https://w7.pngwing.com/pngs/98/991/png-transparent-computer-icons-bank-icon-design-screenshot-bank-blue-angle-logo.png'),
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'Mandiri',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rp 500.000',
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 13),
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          ),
          const Divider(
            thickness: 2,
          ),
          Row(
            children: <Widget>[
              const SizedBox(
                width: 20,
              ),
              const Image(
                image: NetworkImage(
                    'https://w7.pngwing.com/pngs/98/991/png-transparent-computer-icons-bank-icon-design-screenshot-bank-blue-angle-logo.png'),
                width: 50,
                height: 50,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    'OVO',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    'Rp 50.000',
                    style: TextStyle(fontWeight: FontWeight.w200, fontSize: 13),
                    textAlign: TextAlign.left,
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.blue
                // color: Color.fromRGBO(200, 188, 255, 1),
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  textAlign: TextAlign.left,
                ),
                Text(
                  'Rp 2.050.000',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
        backgroundColor: const Color.fromRGBO(200, 188, 255, 1),
        foregroundColor: Colors.black,
      ),
    );
  }
}
