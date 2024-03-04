// import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class MinimumWeatherCard extends StatefulWidget {
  const MinimumWeatherCard({super.key, required this.cardInfo});

  final Map<String, dynamic> cardInfo;

  @override
  State<MinimumWeatherCard> createState() => _MinimumWeatherCardState();
}

class _MinimumWeatherCardState extends State<MinimumWeatherCard> {
  @override
  Widget build(BuildContext context) {
    final String time = widget.cardInfo['time'].split(' ')[1];
    String avgTemp = "${widget.cardInfo['temp_c'].toInt()}°C";
    String image = ImageHandling();
    // print(DateFormat.EEEE().format(DateTime.now()));
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: const Color(0xff194f7f),
        border: gradiantBorder(),
      ),
      height: 190,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 16,
          ),
          SizedBox(
            height: 60,
            width: 90,
            child: Image.network(
              image,
              // scale: 1,
              fit: BoxFit.cover,
            ),
          ),
          // CachedNetworkImage(
          //   imageUrl: 'https:$image',
          //   progressIndicatorBuilder: (context, url, downloadProgress) =>
          //       CircularProgressIndicator(
          //     value: downloadProgress.progress,
          //     color: Colors.white.withOpacity(0.7),
          //   ),
          //   errorWidget: (context, url, error) => const Icon(Icons.error),
          // ),
          const SizedBox(
            height: 16,
          ),
          Text(
            avgTemp,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          )
        ],
      ),
    );
  }

  String ImageHandling() {
    String image = 'assets/images/113.png';
    if (widget.cardInfo['condition']['icon'] != null) {
      image = 'http:${widget.cardInfo['condition']['icon']}';
      // log(image);
    }
    return image;
  }

  GradientBoxBorder gradiantBorder() {
    return const GradientBoxBorder(
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.topRight,
        colors: [
          Color.fromARGB(255, 38, 114, 190),
          Color.fromARGB(255, 45, 148, 239),
        ],
      ),
      width: 1.5,
    );
  }
}
