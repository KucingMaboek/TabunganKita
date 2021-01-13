import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/Helper.dart';
import 'package:tabungan_kita/constants.dart';
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
            final savingIDs = <String>[];
            final savingLists = <SavingModel>[];
            snapshot.data.docs.forEach((element) {
              savingIDs.add(element.id);
              savingLists.add(SavingModel.fromMap(element.data()));
            });
            return ListView.builder(
                itemCount: savingLists.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRad),
                    ),
                    child: ListTile(
                      title: Text(kGetMonthYearFromDateTime(
                          savingLists[index].savingDate)),
                      subtitle: Text(savingLists[index].status),
                      leading: FaIcon(FontAwesomeIcons.receipt),
                      trailing:
                          Text("Rp." + savingLists[index].amount.toString()),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SavingDetail(savingIDs[index], savingLists[index]);
                        }));
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
