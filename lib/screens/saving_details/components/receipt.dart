import 'package:flutter/material.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/saving_model.dart';

class Receipt extends StatelessWidget{
  final SavingModel model;

  Receipt(this.model);


  Container receiptDetail() {
    return new Container(
      margin: new EdgeInsets.all(15.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 10.0,
          ),
          new Center(
            child: new Image.asset(
                'assets/images/logo-wide.jpg',
                fit: BoxFit.cover,
                height: 25.0),
          ),
          new Container(
            height: 5.0,
          ),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 3.0,
            color: Colors.lightGreen,
          ),
          new Text(
            model.month + ", " + model.year,
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          new Container(
            height: 10.0,
          ),
          new Text(model.status),
          new Container(
            margin: new EdgeInsets.symmetric(vertical: 8.0),
            height: 2.0,
            width: 18.0,
            color: new Color(0xff00c6ff),
          ),
          new Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Rp.'+ model.bill.toString() + '-',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget cardContainer() {
    return new Container(
      child: receiptDetail(),
      height: 200.0,
      margin: new EdgeInsets.fromLTRB(20, 20, 20, 0),
      decoration: new BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(kBorderRad),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            ),
          ]),
    );
  }

  Container buttonPay() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kBorderRad),
            side: BorderSide(color: Colors.redAccent)),
        onPressed: () {
          // Not Implemented yet.
        },
        color: Colors.redAccent,
        textColor: Colors.white,
        child: Text('Bayar'.toUpperCase()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[cardContainer(), buttonPay()],
    );
  }


}