import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/loan_model.dart';
import 'package:tabungan_kita/screens/loan_details/loan_details_screen.dart';
import 'package:tabungan_kita/services/database_services.dart';

class LoanList extends StatefulWidget {
  @override
  _LoanListState createState() => _LoanListState();
}

class _LoanListState extends State<LoanList> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: DatabaseService.getLoans(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final loanIDs = <String>[];
            final loanLists = <LoanModel>[];
            snapshot.data.docs.forEach((element) {
              loanIDs.add(element.id);
              loanLists.add(LoanModel.fromMap(element.data()));
            });
            return ListView.builder(
                itemCount: loanLists.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kBorderRad),
                    ),
                    child: ListTile(
                      title: Text(loanLists[index].purpose),
                      subtitle: Text(loanLists[index].status),
                      leading: FaIcon(FontAwesomeIcons.receipt),
                      trailing:
                          Text("Rp." + loanLists[index].amount.toString()),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoanDetail(loanIDs[index], loanLists[index]);
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
