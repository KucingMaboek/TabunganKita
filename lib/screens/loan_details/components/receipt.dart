import 'package:flutter/material.dart';
import 'package:tabungan_kita/Helper.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/loan_model.dart';

class Receipt extends StatelessWidget {
  final LoanModel model;

  Receipt(this.model);

  Column receiptDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.0,
        ),
        Center(
          child: Image.asset('assets/images/logo-wide.jpg',
              fit: BoxFit.cover, height: 25.0),
        ),
        SizedBox(
          height: 5.0,
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 3.0,
          color: Colors.lightGreen,
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          model.purpose,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10.0,
        ),
        DataTable(headingRowHeight: 0, columns: [
          DataColumn(label: Text("")),
          DataColumn(label: Text("")),
        ], rows: [
          DataRow(cells: [
            DataCell(Text(
              "Tanggal Peminjaman",
            )),
            DataCell(Text(kGetDateFromDateTime(model.requestDate)))
          ]),
          DataRow(cells: [
            DataCell(Text("Batas Pengembalian")),
            DataCell(Text(kGetDateFromDateTime(model.returnDate))),
          ]),
          DataRow(
              cells: [DataCell(Text("Detail")), DataCell(Text(model.detail))]),
          DataRow(
              cells: [DataCell(Text("Status")), DataCell(Text(model.status))]),
        ]),
        Container(
          margin: EdgeInsets.symmetric(vertical: 8.0),
          height: 2.0,
          width: 18.0,
          color: Color(0xff00c6ff),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Jumlah: ",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          Text(
            'Rp.' + model.amount.toString() + ',-',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ]),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: kCardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRad),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: receiptDetail(),
      ),
    );
  }
}
