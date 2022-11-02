import 'package:flutter/material.dart';

class MarketTile extends StatelessWidget {
  final String text;
  final double price;
  final IconData icon;

  const MarketTile({
    super.key,
    required this.text,
    required this.price,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Container(
          height: double.infinity,
          child: Icon(
            icon,
            color: Colors.green,
          ),
        ),
        title: Text(text),
        subtitle: Text('Rs.$price'),
      ),
    );
  }
}
