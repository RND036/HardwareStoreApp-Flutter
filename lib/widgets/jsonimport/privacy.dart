// geting privacy polciy
class PrivacyPolicy {
  String? companyName;
  String? lastUpdated;
  ContactInformation? contactInformation;
  DataCollection? dataCollection;

  PrivacyPolicy(
      {this.companyName,
      this.lastUpdated,
      this.contactInformation,
      this.dataCollection});

  factory PrivacyPolicy.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicy(
      companyName: json['companyName'],
      lastUpdated: json['lastUpdated'],
      contactInformation:
          ContactInformation.fromJson(json['contactInformation']),
      dataCollection: DataCollection.fromJson(json['dataCollection']),
    );
  }
}

// geting contact informations
class ContactInformation {
  String? email;
  String? phone;
  String? address;

  ContactInformation({this.email, this.phone, this.address});

  factory ContactInformation.fromJson(Map<String, dynamic> json) {
    return ContactInformation(
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
    );
  }
}

// getting data collection
class DataCollection {
  PersonalInformation? personalInformation;
  NonPersonalInformation? nonPersonalInformation;

  DataCollection({this.personalInformation, this.nonPersonalInformation});

  factory DataCollection.fromJson(Map<String, dynamic> json) {
    return DataCollection(
      personalInformation:
          PersonalInformation.fromJson(json['personalInformation']),
      nonPersonalInformation:
          NonPersonalInformation.fromJson(json['nonPersonalInformation']),
    );
  }
}

// get personal information from json file
class PersonalInformation {
  List<String>? typesCollected;
  List<String>? purposeOfCollection;

  PersonalInformation({this.typesCollected, this.purposeOfCollection});

  factory PersonalInformation.fromJson(Map<String, dynamic> json) {
    return PersonalInformation(
      typesCollected: List<String>.from(json['typesCollected']),
      purposeOfCollection: List<String>.from(json['purposeOfCollection']),
    );
  }
}

// to get non personal information form json file
class NonPersonalInformation {
  List<String>? typesCollected;
  List<String>? purposeOfCollection;

  NonPersonalInformation({this.typesCollected, this.purposeOfCollection});

  factory NonPersonalInformation.fromJson(Map<String, dynamic> json) {
    return NonPersonalInformation(
      typesCollected: List<String>.from(json['typesCollected']),
      purposeOfCollection: List<String>.from(json['purposeOfCollection']),
    );
  }
}
