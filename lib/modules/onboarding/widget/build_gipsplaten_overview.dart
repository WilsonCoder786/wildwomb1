import 'package:easy_four_diy/core/utils.dart';
import 'package:flutter/material.dart';

class BuildGipsplatenOverview extends StatelessWidget {
  final bool isEn;
  const BuildGipsplatenOverview({super.key, required this.isEn});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Utils.kDarkBlue.withValues(alpha: 0.15)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  isEn
                      ? 'Quick overview plasterboards (including dimensions)'
                      : 'Sneloverzicht gipsplaten (inclusief maten)',
                  style: Utils.getTextStyle(
                    baseSize: 13,
                    isBold: true,
                    color: Utils.kDarkBlue,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE53935),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  isEn ? 'Overview Plasterboards' : 'overzicht Gipsplaten',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildGipsplaatRow(
            dotColor: Colors.grey.shade600,
            title: isEn ? 'Standard (Grey): ' : 'Standaard (Grijs): ',
            subtitle: isEn ? 'For dry rooms.' : 'Voor droge ruimtes.',
            dimensions: isEn
                ? 'Sizes: 12.5 mm (walls) or 9.5 mm (ceilings) thick. Width: 60 or 120 cm. Length: 200 to 360 cm.'
                : 'Maten: 12,5 mm (wanden) of 9,5 mm (plafonds) dik. Breedte: 60 of 120 cm. Lengte: 200 tot 360 cm.',
          ),
          const SizedBox(height: 10),
          _buildGipsplaatRow(
            dotColor: const Color(0xFF2E7D32),
            title: isEn
                ? 'Moisture-resistant (Green): '
                : 'Vochtwerend (Groen): ',
            subtitle: isEn
                ? 'For bathrooms and kitchens.'
                : 'Voor badkamers en keukens.',
            dimensions: isEn
                ? 'Sizes: Almost always 12.5 mm thick. Width: 60 or 120 cm. Length: 260 or 300 cm.'
                : 'Maten: Vrijwel altijd 12,5 mm dik. Breedte: 60 of 120 cm. Lengte: 260 of 300 cm.',
          ),
          const SizedBox(height: 10),
          _buildGipsplaatRow(
            dotColor: const Color(0xFFC62828),
            title: isEn ? 'Fire-resistant (Red): ' : 'Brandwerend (Rood): ',
            subtitle: isEn
                ? 'For around fireplaces and boilers.'
                : 'Voor rondom haarden en CV-ketels.',
            dimensions: isEn
                ? 'Sizes: 12.5 or 15 mm thick. Width: 60 or 120 cm. Length: 260 or 300 cm.'
                : 'Maten: 12,5 of 15 mm dik. Breedte: 60 of 120 cm. Lengte: 260 of 300 cm.',
          ),
          const SizedBox(height: 10),
          _buildGipsplaatRow(
            dotColor: const Color(0xFF8D6E63),
            title: isEn ? 'Plaster baseboard (Brown): ' : 'Stucplaat (Bruin): ',
            subtitle: isEn
                ? 'Directly plasterable without primer.'
                : 'Direct overstucbaar zonder voorstrijk.',
            dimensions: isEn
                ? 'Sizes: Always 9.5 mm thick. Width: 40 or 60 cm. Length: 200 cm.'
                : 'Maten: Altijd 9,5 mm dik. Breedte: 40 of 60 cm. Lengte: 200 cm.',
          ),
        ],
      ),
    );
  }
}

Widget _buildGipsplaatRow({
  required Color dotColor,
  required String title,
  required String subtitle,
  required String dimensions,
}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: const EdgeInsets.only(top: 5, right: 8),
        width: 8,
        height: 8,
        decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: Utils.getTextStyle(
                  baseSize: 11,
                  isBold: false,
                  color: Colors.black87,
                ),
                children: [
                  TextSpan(
                    text: title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: subtitle),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(width: 8),
                Text(
                  '○ ',
                  style: TextStyle(
                    fontSize: 10,
                    color: dotColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: Text(
                    dimensions,
                    style: Utils.getTextStyle(
                      baseSize: 10,
                      isBold: false,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
