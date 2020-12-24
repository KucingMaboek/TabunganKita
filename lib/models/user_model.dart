class UserModel {
  // "email": "test@mail.com",
  // "name": "Bagus Darmawan",
  // "atm": {
  // "bank": "BCA",
  // "owner": "Bagus Darmawan",
  // "account_number": "1234432177"
  // },
  // "phone": "089600001234",
  // "university": "Universitas Jember",
  // "degree": "S1",
  // "major": "Informatika",
  // "student_id": "182410103000",
  // "member_status": "Menunggu di verifikasi"

  String email;
  String name;
  String residentId;
  dynamic atm;
  String phone;
  String university;
  String degree;
  String major;
  String studentId;
  String memberStatus;

  UserModel(
      this.email,
      this.name,
      this.residentId,
      this.atm,
      this.phone,
      this.university,
      this.degree,
      this.major,
      this.studentId,
      this.memberStatus);

  Map<String, dynamic> toMap() => {
        "email": this.email,
        "name": this.name,
        "residentId": this.residentId,
        "atm": this.atm,
        "phone": this.phone,
        "university": this.university,
        "degree": this.degree,
        "major": this.major,
        "studentId": this.studentId,
        "memberStatus": this.memberStatus
      };

  UserModel.fromMap(Map<String, dynamic> map)
      : email = map['email'],
        name = map['name'],
        residentId = map['residentId'],
        atm = map['atm'],
        phone = map['phone'],
        university = map['university'],
        degree = map['degree'],
        major = map['major'],
        studentId = map['studentId'],
        memberStatus = map['memberStatus'];
}
