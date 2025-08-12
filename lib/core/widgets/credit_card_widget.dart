import 'package:flutter/material.dart';

class CreditCardWidget extends StatelessWidget {
  final String balance;
  final String lastFourDigits;
  final String expiryDate;
  final Color color;

  const CreditCardWidget({
    super.key,
    required this.balance,
    required this.lastFourDigits,
    required this.expiryDate,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: const EdgeInsets.all(20),
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "X-Card",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                "VISA",
                style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 30),
          const Text(
            "Balance",
            style: TextStyle(color: Colors.white70),
          ),
          const SizedBox(height: 5),
          Text(
            "$balance EG",
            style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "**** $lastFourDigits",
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                expiryDate,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
