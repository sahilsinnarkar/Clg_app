import 'package:myapp/screens/event screen/event_detail_screen.dart';
import 'package:myapp/screens/event screen/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants.dart';
import './event_detail_screen.dart';
import './dummy_data.dart';

void main() {
  runApp(const NewsfeedScreen());
}

class NewsfeedScreen extends StatefulWidget {
  const NewsfeedScreen({super.key});

  static String routeName = 'NewsfeedScreen';

  @override
  State<NewsfeedScreen> createState() => _NewsfeedScreenState();
}

class _NewsfeedScreenState extends State<NewsfeedScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
              'EVENTS',
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Marcellus',
            ),
          ),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return EventItem(
                id: DUMMY_EVENTS[index].id,
                name: DUMMY_EVENTS[index].name,
                imageUrl: DUMMY_EVENTS[index].imageUrl,
                date: DUMMY_EVENTS[index].date);
          },
          itemCount: DUMMY_EVENTS.length,
        ),
      ),
      routes: {EventDetailScreen.routeName: (context) => EventDetailScreen()},
    );
  }
}