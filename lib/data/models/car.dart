// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      required this.amount,
      required this.currency,
      required this.status,
      required this.dur,
      required this.carId});

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
        dur: map['dur'].toString(),
        status: map['status'].toString(),
        carId: map['carId'].toString());
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
  final String status;
  final String carId;

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
        insurance,
        carId,
      ];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result
      ..addAll({'currency': currency})
      ..addAll({'amount': amount})
      ..addAll({'dur': dur})
      ..addAll({'speed': speed})
      ..addAll({'tankCapacity': tankCapacity})
      ..addAll({'fuelLevel': fuelLevel})
      ..addAll({' engineType': engineType})
      ..addAll({'millage': millage})
      ..addAll({'power': power})
      ..addAll({'name': name})
      ..addAll({'brand': brand})
      ..addAll({'vin': vin})
      ..addAll({'insurance': insurance})
      ..addAll({'status': status})
      ..addAll({'carId': carId})
      ..addAll({'currency': currency});

    return result;
  }

  Car copyWith({
    String? currency,
    String? amount,
    String? dur,
    String? speed,
    String? tankCapacity,
    String? fuelLevel,
    String? engineType,
    String? millage,
    String? power,
    String? name,
    String? brand,
    String? vin,
    String? insurance,
    String? status,
    String? carId,
  }) {
    return Car(
      currency: currency ?? this.currency,
      amount: amount ?? this.amount,
      dur: dur ?? this.dur,
      speed: speed ?? this.speed,
      tankCapacity: tankCapacity ?? this.tankCapacity,
      fuelLevel: fuelLevel ?? this.fuelLevel,
      engineType: engineType ?? this.engineType,
      millage: millage ?? this.millage,
      power: power ?? this.power,
      name: name ?? this.name,
      brand: brand ?? this.brand,
      vin: vin ?? this.vin,
      insurance: insurance ?? this.insurance,
      status: status ?? this.status,
      carId: carId ?? this.carId,
      imgurl: '',
      descip: '',
      city: '',
    );
  }
}
