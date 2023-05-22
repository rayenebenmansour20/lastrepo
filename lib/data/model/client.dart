class Client {
  final int? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? identcard;
  final bool? isvalid;
  final int? tarifprod;
  final String? userid;

  Client({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.identcard,
    this.isvalid,
    this.tarifprod, 
    this.userid,

  });

  factory Client.fromJson(Map<String, dynamic> json) {
    return Client(
      id: json['ID_ROWID'] ?? '',
      firstName: json['CEFPRENOM'] ?? '',
      lastName: json['CEFNOM'] ?? '',
      email: json['CEFEMAIL'] ?? '',
      phoneNumber: json['CEFTELMOB'] ?? '',
      identcard: json['CEFIDCARTE'] ?? '',
      isvalid: json['CEFINDFID'] ?? false,
      tarifprod:json['CEFETTARIFID'] ?? '',

    );
  }

   Map<String, dynamic> toJson() => {
        'ID_ROWID': id,
        'CEFPRENOM': firstName,
        'CEFNOM': lastName,
        'CEFEMAIL': email,
        'CEFTELMOB': phoneNumber,
        'CEFTELFIX': phoneNumber,
        'CEFIDCARTE': identcard,
        'CEFINDFID': isvalid,
        'CEFETTARIFID': tarifprod,
        'UTIL':userid,
      };
}
