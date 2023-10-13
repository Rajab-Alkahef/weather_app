import 'package:flutter/material.dart';

class DayForecastCard extends StatelessWidget {
  const DayForecastCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Today',
          style: TextStyle(color: Color(0xff768a9a), fontSize: 16),
        ),
        Image.asset(
          'assets/images/clear.png',
          scale: 2.5,
        ),
        Row(
          children: [
            const Text(
              '18°',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Stack(
                alignment: Alignment.centerRight,
                children: [
                  Container(
                    height: 5,
                    width: 100,
                    decoration: BoxDecoration(
                        color: const Color(0xff576b80),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  Container(
                    height: 5,
                    width: 75,
                    decoration: BoxDecoration(
                        color: const Color(0xffffcc03),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ],
              ),
            ),
            const Text(
              '18°',
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        )
      ],
    );
  }
}
