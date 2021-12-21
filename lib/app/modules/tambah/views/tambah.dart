import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:utslogin/app/routes/app_pages.dart';

class TambahPage extends StatefulWidget {
  const TambahPage({Key? key}) : super(key: key);

  @override
  _TambahPageState createState() => _TambahPageState();
}

class _TambahPageState extends State<TambahPage> {
  String dropdownValue = 'Pengeluaran';
  String dropdownKategori = 'Makanan';
  String dropdownRekening = 'DANA';
  String value = "";
  DateTime selectedDate = DateTime.now();
  String? _selectedTime;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        print(picked.month);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (pickedTime != null) {
      setState(() {
        _selectedTime = pickedTime.format(context);
        print("${pickedTime}");
      });
    }
  }

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
        body: ListView(
          children: [
            const SizedBox(height: 20),
            Row(
              children: const [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "TRANSAKSI",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            // HAPUS SIZED BOX
            Container(
              // TAMBAH MARGIN
              margin: EdgeInsets.all(16.0),
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DropdownButton<String>(
                    hint: const Text("Pilih Jenis Transaksi"),
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 20,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Pengeluaran', 'Pemasukan']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            // HAPUS SIZED BOX
            Row(
              children: const <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  "KATEGORI",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            // HAPUS SIZED BOX
            Container(
              margin: EdgeInsets.all(16.0),
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DropdownButton<String>(
                    hint: const Text(
                      "Pilih Rekening",
                      textAlign: TextAlign.left,
                    ),
                    value: dropdownKategori,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 20,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownKategori = newValue!;
                      });
                    },
                    items: <String>['Makanan', 'Minuman', 'Belanja']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            // HAPUS SIZED BOX
            Row(
              children: const <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  "REKENING",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            // HAPUS SIZED BOX
            Container(
              margin: EdgeInsets.all(16.0),
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(13),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  DropdownButton<String>(
                    hint: const Text(
                      "Pilih Kategori",
                      textAlign: TextAlign.left,
                    ),
                    value: dropdownRekening,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 20,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownRekening = newValue!;
                      });
                    },
                    items: <String>['DANA', 'OVO', 'BANK']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  )
                ],
              ),
            ),
            // HAPUS SIZED BOX
            Row(
              children: const <Widget>[
                SizedBox(
                  width: 20,
                ),
                Text(
                  "JUMLAH",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  textAlign: TextAlign.left,
                )
              ],
            ),
            SizedBox(
              width: 300,
              // decoration: BoxDecoration(
              //   border: Border.all(color: Colors.grey, width: 1),
              //   borderRadius: BorderRadius.circular(13),
              // ),
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: TextField(
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.go,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13)),
                        hintText: "Jumlah",
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey),
                      ),
                      onChanged: (text) {
                        value = text;
                      },
                    ),
                  ),
                  // HAPUS SIZED BOX
                  // TAMBAH CONTAINER
                  Container(
                    margin: EdgeInsets.all(16.0),
                    child: TextField(
                      autofocus: false,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(13)),
                        hintText: "Catatan",
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w300, color: Colors.grey),
                      ),
                      onChanged: (text) {
                        value = text;
                      },
                    ),
                    // HAPUS SIZED BOX
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: Text('${selectedDate.toLocal()}'.split(' ')[0]),
                    style: TextButton.styleFrom(primary: Colors.white)),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    onPressed: () => _selectTime(context),
                    child: Text(_selectedTime ?? ''),
                    style: TextButton.styleFrom(primary: Colors.white)),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            // ELEVATED BUTTON DIWRAP PAKE COLUMN BIAR BISA ATUR WIDHT
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.to(Routes.HOME);
                  },
                  child: const Text('SIMPAN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal,
                    onPrimary: Colors.white,
                    shadowColor: Colors.grey,
                    elevation: 5,
                    fixedSize: const Size(150, 40),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
