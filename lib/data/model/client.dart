class Client {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;

  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['ID_ROWID'],
      firstName: json['CEFPRENOM'],
      lastName: json['CEFNOM'],
      email: json['CEFEMAIL'],
      phoneNumber: json['CEFTELMOB'],
    );
  }
}
