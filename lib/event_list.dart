// lib/event_list.dart
import 'package:flutter/material.dart';
import 'event_card.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        EventCard(
          title: 'Trip to Rome',
          description: 'Discuss a trip',
          time: '10:00 - 10:20 AM',
          backgroundImage: 'assets/icons/image3.png',
          tag: 'Work',
          avatars: [
            'https://www.rollingstone.com/wp-content/uploads/2022/12/A-Good-Person.jpg',
            'https://th.bing.com/th/id/OIP.jmseNr63FSf7iyTgz4MULwAAAA?rs=1&pid=ImgDetMain',
            'https://www.kevinashleyphotography.com/wp-content/uploads/2015/11/person.jpg'
          ],
        ),
        EventCard(
          title: 'Trip to Rome',
          description: 'Discuss a trip with Tom',
          time: '11:00 - 12:30 AM',
          tag: 'High',
          backgroundImage: 'assets/icons/image2.png',
          avatars: [],
          initials: 'TL',
        ),
        EventCard(
          title: 'Evening routine',
          description: 'Lunch in café',
          time: '13:00 - 14:30 PM',
          tag: 'Life',
          avatars: [
            'https://simcookie.com/wp-content/uploads/2023/04/Untitled-design274-1024x577.jpg'
          ],
          backgroundImage: 'assets/icons/image1.png',

        ),
        EventCard(
          title: 'Trip to Rome',
          description: 'Discuss a trip with Tom',
          time: '11:00 - 12:30 AM',
          tag: 'High',
          avatars: [],
          backgroundImage: 'assets/icons/image3.png',

          initials: 'TL',
        ),
        EventCard(
          title: 'Evening routine',
          description: 'Lunch in café',
          time: '13:00 - 14:30 PM',
          tag: 'Life',
          avatars: [
            'https://simcookie.com/wp-content/uploads/2023/04/Untitled-design274-1024x577.jpg'
          ],
          backgroundImage: 'assets/icons/image2.png',

        ),
        EventCard(
          title: 'Trip to Rome',
          description: 'Discuss a trip with Tom',
          time: '11:00 - 12:30 AM',
          tag: 'High',
          backgroundImage: 'assets/icons/image1.png',
          avatars: [],
          initials: 'TL',
        ),
        EventCard(
          title: 'Evening routine',
          description: 'Lunch in café',
          time: '13:00 - 14:30 PM',
          tag: 'Life',
          avatars: [
            'https://simcookie.com/wp-content/uploads/2023/04/Untitled-design274-1024x577.jpg'
          ], 
          backgroundImage: 'assets/icons/image3.png',
        ),
      ],
    );
  }
}
