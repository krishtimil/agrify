import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MarketTile extends StatelessWidget {
  const MarketTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Container(
          height: double.infinity,
          child: Icon(
            Icons.heart_broken,
            color: Colors.green,
          ),
        ),
        title: Text('Fertilizer'),
        subtitle: Text('Rs. 499'),
      ),
    );
  }
}
