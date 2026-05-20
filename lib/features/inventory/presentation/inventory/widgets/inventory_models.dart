import 'package:flutter/material.dart';

class StockRow {
  final String initials;
  final Color avatarColor;
  final String name;
  final String city;
  final String? itemCount;
  final String? itemName;
  final String? category;
  final String qty;
  final String weight;

  const StockRow({
    required this.initials,
    required this.avatarColor,
    required this.name,
    required this.city,
    this.itemCount,
    this.itemName,
    this.category,
    required this.qty,
    required this.weight,
  });
}

class StockItem {
  final String name;
  final String category;
  final String qty;
  final String weight;
  final String total;
  final String totalWeight;

  const StockItem({
    required this.name,
    required this.category,
    required this.qty,
    required this.weight,
    required this.total,
    required this.totalWeight,
  });
}
