import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BankServiceItem extends Equatable {
  final String name;
  final IconData iconData;
  final String destination;

  const BankServiceItem({
    required this.name,
    required this.iconData,
    required this.destination,
  });

  @override
  List<Object?> get props => [name, iconData, destination];
}
