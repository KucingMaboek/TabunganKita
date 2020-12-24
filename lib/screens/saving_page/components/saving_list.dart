import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/models/saving_model.dart';
import 'package:tabungan_kita/screens/saving_details/saving_details_screen.dart';
import 'package:tabungan_kita/services/database_services.dart';

class SavingList extends StatefulWidget {
  @override
  _SavingListState createState() => _SavingListState();
}

class _SavingListState extends State<SavingList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: DatabaseService.getSavings(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final savingLists = <SavingModel>[];
            snapshot.data.docs.forEach((element) {
              savingLists.add(SavingModel.fromMap(element.data()));
            });
            return ListView.builder(
                itemCount: savingLists.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(savingLists[index].month +
                          ", " +
                          savingLists[index].year),
                      subtitle: Text(savingLists[index].status),
                      leading: FaIcon(FontAwesomeIcons.receipt),
                      trailing:
                          Text("Rp." + savingLists[index].bill.toString()),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    SavingDetail(savingLists[index])));
                      },
                    ),
                  );
                });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
