/// Created by Usman Akhlaq on 10.06.2021
/// Copyright © 2021 Usman Akhlaq All rights reserved.
/// Email: uakhlaq88@gmail.com

class Doctor {
  String id;
  String fullName;
  String email;
  String phone;
  String registrationNumber;
  String country;
  String state;
  String city;
  String gender;
  String practiceDomain;
  String institutionName;
  num experience;
  String clinicName;
  String clinicAddress;
  String therapySpeciality;
  String aboutDoc;
  List<dynamic> specialities;
  String profileImage;
  List<dynamic> clinicImages;
  num latitude;
  num longitude;
  bool isApproved;

  Doctor({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.registrationNumber,
    required this.country,
    required this.state,
    required this.city,
    required this.gender,
    required this.practiceDomain,
    required this.institutionName,
    required this.experience,
    required this.clinicName,
    required this.clinicAddress,
    required this.therapySpeciality,
    required this.aboutDoc,
    required this.specialities,
    required this.profileImage,
    required this.clinicImages,
    required this.latitude,
    required this.longitude,
    required this.isApproved,
  });

  Doctor.fromJSON(Map json)
      : this.id = json['_id'],
        this.fullName = json['fullName'],
        this.email = json['email'],
        this.phone = json['phoneNumber'],
        this.registrationNumber = json['registrationNumber'],
        this.country = json['country'],
        this.state = json['state'],
        this.city = json['city'],
        this.gender = json['gender'],
        this.practiceDomain = json['practiceDomain'],
        this.institutionName = json['institutionName'],
        this.experience = json['experience'],
        this.clinicName = json['clinicName'],
        this.clinicAddress = json['clinicAddress'],
        this.therapySpeciality = json['therapySpeciality'],
        this.aboutDoc = json['aboutDoc'],
        this.specialities = json['specialities'],
        this.profileImage = json['profileImage'],
        this.clinicImages = json['clinicImages'],
        this.longitude = json['longitude'],
        this.latitude = json['latitude'],
        this.isApproved = json['isApproved'];

  Map<String, dynamic> toJSON() => {
        '_id': this.id,
        'fullName': this.fullName,
        'email': this.email,
        'phoneNumber': this.phone,
        'registrationNumber': this.registrationNumber,
        'country': this.country,
        'state': this.state,
        'city': this.city,
        'gender': this.gender,
        'practiceDomain': this.practiceDomain,
        'institutionName': this.institutionName,
        'experience': this.experience,
        'clinicName': this.clinicName,
        'clinicAddress': this.clinicAddress,
        'therapySpeciality': this.therapySpeciality,
        'aboutDoc': this.aboutDoc,
        'specialities': this.specialities,
        'profileImage': this.profileImage,
        'clinicImages': this.clinicImages,
        'longitude': this.longitude,
        'latitude': this.latitude,
      };
}
