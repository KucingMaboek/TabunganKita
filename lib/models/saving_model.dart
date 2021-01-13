class SavingModel {
  String userId;
  DateTime savingDate;
  int amount;
  String status;
  String paymentUrl;

  SavingModel(this.userId, this.savingDate, this.amount, this.status, this.paymentUrl);

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "savingDate": savingDate,
        "amount": amount,
        "status": status,
        "paymentUrl": paymentUrl
      };

  SavingModel.fromMap(Map<String, dynamic> map)
      : userId = map['userId'],
        savingDate = DateTime.parse(map['savingDate'].toDate().toString()),
        amount = map['amount'],
        status = map['status'],
        paymentUrl = map['paymentUrl'];
}
