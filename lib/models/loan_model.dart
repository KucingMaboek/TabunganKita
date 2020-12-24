class LoanModel {
  String userId;
  DateTime requestDate;
  DateTime returnDate;
  String purpose;
  String detail;
  int amount;
  String status;

  LoanModel(this.userId, this.requestDate, this.returnDate, this.purpose,
      this.detail, this.amount, this.status);

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'requestDate': requestDate,
        'returnDate': returnDate,
        'purpose': purpose,
        'detail': detail,
        'amount': amount,
        'status': status
      };

  LoanModel.fromMap(Map<String, dynamic> map)
      : userId = map['userId'],
        requestDate = DateTime.parse(map['requestDate'].toDate().toString()),
        returnDate = DateTime.parse(map['returnDate'].toDate().toString()),
        purpose = map['purpose'],
        detail = map['detail'],
        amount = map['amount'],
        status = map['status'];
}
