import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String title;
  final String description;
  final String time;
  final String tag;
  final List<String> avatars;
  final String? initials;
  final String backgroundImage;

  const EventCard({
    super.key,
    required this.title,
    required this.description,
    required this.time,
    required this.tag,
    required this.avatars,
    this.initials,
    required this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          // Conditional rendering of Ellipse7 on top of image2.png
          if (backgroundImage == 'assets/icons/image2.png')
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/icons/Ellipse7.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontFamily: "SFPRODISPLAY",
                            fontWeight: FontWeight.normal)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(tag,
                          style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "SFPRODISPLAY",
                              fontWeight: FontWeight.normal)),
                    ),
                  ],
                ),
                Text(description,
                    style: const TextStyle(
                        fontSize: 28,
                        fontFamily: "SFPRODISPLAY",
                        fontWeight: FontWeight.w100)),
                const SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(time,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: "SFPRODISPLAY",
                            fontWeight: FontWeight.normal)),
                    if (avatars.isNotEmpty)
                      Row(
                        children: List.generate(avatars.length, (index) {
                          if (index < 3) {
                            return Transform.translate(
                              offset: Offset(-8.0 * index, 0),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(avatars[index]),
                                radius: 18,
                              ),
                            );
                          } else if (index == 2 && avatars.length > 3) {
                            return Transform.translate(
                              offset: Offset(-8.0 * index, 0),
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 18,
                                child: Text(
                                  '+${avatars.length - 3}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Container(); // Ignore extra avatars beyond the 3rd
                          }
                        }),
                      )
                    else if (initials != null)
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 18,
                        child: Text(initials!,
                            style: const TextStyle(color: Colors.white)),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
