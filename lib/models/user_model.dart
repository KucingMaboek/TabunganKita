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
  dynamic atm;
  String phone;
  String university;
  String degree;
  String major;
  String studentId;
  String memberStatus;

  UserModel(this.email, this.name, this.atm, this.phone, this.university,
      this.degree, this.major, this.studentId, this.memberStatus);

  Map<String, dynamic> toMap() => {
        "email": this.email,
        "name": this.name,
        "atm": this.atm,
        "phone": this.phone,
        "university": this.university,
        "degree": this.degree,
        "major": this.major,
        "student_id": this.studentId,
        "member_status": this.memberStatus
      };

  UserModel.fromMap(Map<String, dynamic> map) {
    email = map['email'];
    name = map['name'];
    atm = map['atm'];
    phone = map['phone'];
    university = map['university'];
    degree = map['degree'];
    major = map['major'];
    studentId = map['student_id'];
    memberStatus = map['member_status'];
  }
}
