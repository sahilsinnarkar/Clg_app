import 'package:flutter/material.dart';
import 'package:myapp/constants.dart';
import './dummy_data.dart';

class EventDetailScreen extends StatelessWidget {
  static const routeName = 'EventDetailScreen';

  const EventDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final eventId = ModalRoute.of(context)!.settings.arguments as int;
    final selectedEvent = DUMMY_EVENTS.firstWhere(
          (event) => event.id == eventId,
    );

    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
              selectedEvent.name,
            style: const TextStyle(
              fontSize: 30,
              fontFamily: 'Marcellus',
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedEvent.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 20, right: 20, bottom: 5),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_month,
                        color: kWhite,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Text(
                        'Date: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: kTextWhiteColor,
                          fontFamily: 'Marcellus',
                        ),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        selectedEvent.date,
                        style: const TextStyle(
                          fontSize: 15,
                          color: kTextWhiteColor,
                          fontFamily: 'Marcellus',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: kTextWhiteColor,
                          fontFamily: 'Marcellus',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 500,
                        height: 145,
                        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                        child: Scrollbar(
                          thumbVisibility: false, //always show scrollbar
                          thickness: 5, //width of scrollbar
                          radius: const Radius.circular(20), //corner radius of scrollbar
                          scrollbarOrientation: ScrollbarOrientation.right,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Text(
                                    selectedEvent.description,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      color: kTextWhiteColor,
                                      fontFamily: 'Marcellus',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
