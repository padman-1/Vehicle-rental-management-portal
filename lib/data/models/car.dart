import 'dart:core';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Car extends Equatable {
  Car(
      {required this.speed,
      required this.tankCapacity,
      required this.fuelLevel,
      required this.engineType,
      required this.millage,
      required this.power,
      required this.brand,
      required this.vin,
      required this.insurance,
      required this.name,
      required this.imgurl,
      required this.descip,
      required this.city,
      // required this.features,
      required this.amount,
      required this.currency,
      required this.dur});

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
        speed: map['speed'].toString(),
        tankCapacity: map['tankCapacity'].toString(),
        fuelLevel: map['fuelLevel'].toString(),
        engineType: map['engineType'].toString(),
        millage: map['millage'].toString(),
        power: map['power'].toString(),
        brand: map['tankCapacity'].toString(),
        vin: map['vin'].toString(),
        insurance: map['insurance'].toString(),
        name: map['name'].toString(),
        imgurl: map['imgurl'].toString(),
        descip: map['descip'].toString(),
        city: map['tankCapacity'].toString(),
        amount: map['amount'].toString(),
        currency: map['currency'].toString(),
        dur: map['dur'].toString());
  }

  String imgurl;
  String descip;
  String city;
  // final features;
  final String currency;
  final String amount;
  final String dur;
  final String speed;
  final String tankCapacity;
  final String fuelLevel;
  final String engineType;
  final String millage;
  final String power;
  final String name;
  final String brand;
  final String vin;
  final String insurance;

  @override
  // TODO: implement props
  List<Object?> get props => [
        currency,
        amount,
        dur,
        speed,
        tankCapacity,
        fuelLevel,
        engineType,
        millage,
        power,
        name,
        brand,
        vin,
        insurance
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result
      ..addAll({'currency': currency})
      ..addAll({'amount': amount});

    return result;
  }
}
