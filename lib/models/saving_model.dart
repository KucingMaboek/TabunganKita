class SavingModel {
  String userId;
  String month;
  String year;
  int bill;
  String status;

  SavingModel(this.userId, this.month, this.year, this.bill, this.status);

  Map<String, dynamic> toMap() => {
        "userId": userId,
        "month": month,
        "year": year,
        "bill": bill,
        "status": status
      };

  SavingModel.fromMap(Map<String, dynamic> map)
      : userId = map['userId'],
        month = map['month'],
        year = map['year'],
        bill = map['bill'],
        status = map['status'];
}
