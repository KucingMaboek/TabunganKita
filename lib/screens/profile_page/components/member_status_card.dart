import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/user_model.dart';
import 'package:tabungan_kita/services/database_services.dart';

class MemberStatusCard extends StatefulWidget {
  final UserModel user;

  MemberStatusCard(this.user);

  @override
  _MemberStatusCardState createState() => _MemberStatusCardState();
}

class _MemberStatusCardState extends State<MemberStatusCard> {
  File _image;
  double imageHeight = 100;

  Future getImage() async {
    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() async {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        final appDir = await getApplicationDocumentsDirectory();
        final fileName = basename(_image.path);

        // Save image to local dir
        await _image.copy('${appDir.path}/$fileName');

        FirebaseStorage.instance
            .ref()
            .child("primary_saving")
            .child(DatabaseService.firebaseUser.uid)
            .putFile(_image)
            .whenComplete(() => null)
            .then((storageTask) async {
          String link = await storageTask.ref.getDownloadURL();
          widget.user.paymentUrl = link;
          widget.user.memberStatus = "Sedang Ditinjau";
          DatabaseService.createOrUpdateUser(
              DatabaseService.firebaseUser.uid, widget.user, false);
        });
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _memberActivation() {
      if (widget.user.memberStatus == "Belum Aktivasi" &&
          widget.user.memberStatus == "Ditolak") {
        return GestureDetector(
            onTap: getImage,
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 2.5, color: kPrimaryColor),
                borderRadius: BorderRadius.circular(kBorderRad),
                color: kBackgroundColor,
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.camera,
                      color: kPrimaryColor,
                    ),
                    Text(
                      "Ambil Foto Bukti Transfer",
                      style: TextStyle(fontSize: 15, color: kPrimaryColor),
                    )
                  ],
                ),
              ),
            ));
      } else if (widget.user.memberStatus == "Sedang Ditinjau") {
        return GestureDetector(
            onTap: () {
              setState(() {
                imageHeight = imageHeight != 100 ? 100 : 300;
                print(imageHeight);
              });
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kBorderRad),
              child: Image(
                image: NetworkImage(widget.user.paymentUrl),
                width: MediaQuery.of(context).size.width,
                height: imageHeight,
                fit: BoxFit.fitWidth,
              ),
            ));
      } else {
        return SizedBox(
          height: 0,
        );
      }
    }

    return Card(
      elevation: kCardElevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRad),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: widget.user.memberStatus != "Member"
                  ? FaIcon(
                      FontAwesomeIcons.userTimes,
                      color: Colors.red,
                    )
                  : FaIcon(FontAwesomeIcons.userCheck, color: Colors.green),
              title: Text(widget.user.name),
              subtitle: Text(widget.user.memberStatus),
            ),
            _memberActivation(),
          ],
        ),
      ),
    );
  }
}
