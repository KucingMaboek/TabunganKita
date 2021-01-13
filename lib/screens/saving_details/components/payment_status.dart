import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tabungan_kita/constants.dart';
import 'package:tabungan_kita/models/saving_model.dart';
import 'package:tabungan_kita/services/database_services.dart';

class PaymentStatus extends StatefulWidget {
  final String id;
  final SavingModel model;

  PaymentStatus(this.id, this.model);

  @override
  _PaymentStatusState createState() => _PaymentStatusState();
}

class _PaymentStatusState extends State<PaymentStatus> {
  double imageHeight = 100;

  Future getImage() async {
    File _image;

    final pickedFile = await ImagePicker().getImage(source: ImageSource.camera);

    setState(() async {
      if (pickedFile != null) return;
      _image = File(pickedFile.path);
      final appDir = await getApplicationDocumentsDirectory();
      final fileName = basename(_image.path);

      // Save image to local dir
      await _image.copy('${appDir.path}/$fileName');

      // Save image to firebase storage
      FirebaseStorage.instance
          .ref()
          .child("monthly_saving")
          .child(DatabaseService.firebaseUser.uid)
          .child(widget.id)
          .putFile(_image)
          .whenComplete(() => null)
          .then((storageTask) async {
        String link = await storageTask.ref.getDownloadURL();
        widget.model.paymentUrl = link;
        widget.model.status = "Sedang Ditinjau";
        DatabaseService.createOrUpdateSaving(widget.id, widget.model, false);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _paymentProof() {
      if (widget.model.status == "Belum Membayar" ||
          widget.model.status == "Pembayaran Ditolak") {
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
                      "Foto Bukti Pembayaran",
                      style: TextStyle(fontSize: 15, color: kPrimaryColor),
                    )
                  ],
                ),
              ),
            ));
      } else if (widget.model.status == "Sedang Ditinjau") {
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
                image: NetworkImage(widget.model.paymentUrl),
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
            _paymentProof(),
          ],
        ),
      ),
    );
  }
}
