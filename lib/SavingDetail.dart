import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavingDetail extends StatelessWidget {
  final int id;

  SavingDetail(this.id);

  @override
  Widget build(BuildContext context) {

    Container _getBackground(){
      return new Container(
        color: Colors.white,
      );
    }

    Container _getForeground() {
      return new Container(
        // constraints: new BoxConstraints.expand(height: 100.0),
        // color: Colors.lightGreen,
        height: 125.0,
        decoration: new BoxDecoration(
          color: Colors.lightGreen,
          borderRadius: new BorderRadius.vertical(
              bottom: new Radius.elliptical(
                  MediaQuery.of(context).size.width, 10.0)),
        ),
      );
    }

    Container _getContentValue() {
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
                  'lib/assets/images/logo-wide.jpg',
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
              'Bulan ke-$id, 2020',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            new Container(
              height: 10.0,
            ),
            new Text('Belum Terbayar'),
            new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff),
            ),
            new Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Rp.200.000,-',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      );
    }

    Widget _cardReceipt() {
      return new Container(
        child: _getContentValue(),
        height: 200.0,
        margin: new EdgeInsets.fromLTRB(20, 20, 20, 0),
        decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: new BorderRadius.circular(8.0),
            boxShadow: <BoxShadow>[
              new BoxShadow(
                color: Colors.black12,
                blurRadius: 10.0,
                offset: new Offset(0.0, 10.0),
              ),
            ]),
      );
    }

    Widget _buttonPay() {
      return new Container(
        margin: new EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: new RaisedButton(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
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

    Widget _getContent() {
      return new ListView(
        children: <Widget>[_cardReceipt(), _buttonPay()],
      );
    }

    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
          title: Text('Detail Simpanan Wajib',
              style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.lightGreen),
      // body: body,
      body: new Container(
        constraints: new BoxConstraints.expand(),
        color: Colors.white,
        child: new Stack(
          children: [
            _getBackground(),
            _getForeground(),
            _getContent(),
          ],
        ),
      ),
    );
  }
}
