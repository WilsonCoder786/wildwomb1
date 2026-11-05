import 'package:flutter/material.dart';

/// Represents a validated building material item connected to Dutch hardware & wholesaler data sources
/// (Gamma, Hornbach, Bouwmaat, Jongeneel).
class ConstructionMaterialItem {
  final String id;
  final String category; // 'plinten', 'gipswand', 'overkapping', 'fastener', 'tools', etc.
  final String nameNl;
  final String nameEn;
  final String standardTradeDimension; // e.g., '100 × 250 cm', '2.40 m', '12 × 12 cm'
  final String qty;
  final String? qtyEn;
  final double calculatedCost;
  final IconData icon;
  final bool isOutdoor;
  final String? screwSpec; // e.g., 'RVS A2 Torx 5.0x80mm'
  final double wastePercentage; // 0.10, 0.15, 0.20

  // Databronnen prijzen & benchmarks (Gamma, Hornbach, Bouwmaat, Jongeneel)
  final double? priceGamma;
  final double? priceHornbach;
  final double? priceBouwmaat;
  final double? priceJongeneel;
  final String? preferredStore; // 'Gamma', 'Hornbach', 'Bouwmaat', 'Jongeneel'

  const ConstructionMaterialItem({
    required this.id,
    required this.category,
    required this.nameNl,
    required this.nameEn,
    required this.standardTradeDimension,
    required this.qty,
    this.qtyEn,
    required this.calculatedCost,
    required this.icon,
    this.isOutdoor = false,
    this.screwSpec,
    this.wastePercentage = 0.10,
    this.priceGamma,
    this.priceHornbach,
    this.priceBouwmaat,
    this.priceJongeneel,
    this.preferredStore,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': nameNl,
      'nameEn': nameEn,
      'dimension': standardTradeDimension,
      'qty': qty,
      'qtyEn': qtyEn ?? qty,
      'price': '€ ${calculatedCost.toStringAsFixed(2)}',
      'cost': calculatedCost,
      'icon': icon,
      'isOutdoor': isOutdoor,
      'screwSpec': screwSpec,
      'wastePercentage': wastePercentage,
      'stores': {
        if (priceGamma != null) 'Gamma': priceGamma,
        if (priceHornbach != null) 'Hornbach': priceHornbach,
        if (priceBouwmaat != null) 'Bouwmaat': priceBouwmaat,
        if (priceJongeneel != null) 'Jongeneel': priceJongeneel,
      },
      'preferredStore': preferredStore ?? 'Hornbach',
    };
  }
}
