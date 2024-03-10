import 'package:flutter/material.dart';
import 'package:waether_app_n/constatnt.dart';

class DayForecastCard extends StatelessWidget {
  const DayForecastCard({
    super.key,
    required this.dayInfo,
  });
  final Map<String, dynamic> dayInfo;

  @override
  Widget build(BuildContext context) {
    String day = dateToDayName(dayInfo['date']);
    String image = ImageHandling();
    print(dateToDayName(dayInfo['date']));
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 45,
          child: Text(
            day,
            style: const TextStyle(color: Color(0xff768a9a), fontSize: 16),
          ),
        ),
        const SizedBox(
          width: 40,
        ),
        Image.network(
          image,
          scale: 1.7,
        ),
        const SizedBox(
          width: 25,
        ),
        Row(
          children: [
            Text(
              '${dayInfo['day']['mintemp_c'].toInt()}°C',
              style: const TextStyle(color: Colors.white, fontSize: 18),
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
                    width: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xffffcc03),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ],
              ),
            ),
            Text(
              '${dayInfo['day']['maxtemp_c'].toInt()}°C',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        )
      ],
    );
  }

  String ImageHandling() {
    String image = 'assets/images/113.png';
    if (dayInfo['day']['condition']['icon'] != null) {
      image = 'http:${dayInfo['day']['condition']['icon']}';
      print(image);
    }
    return image;
  }
}
