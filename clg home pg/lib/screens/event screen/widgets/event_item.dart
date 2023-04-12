import 'package:myapp/screens/event screen/event_detail_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class EventItem extends StatelessWidget {
  final int id;
  final String name;
  final String imageUrl;
  final String date;

  const EventItem(
      {super.key, required this.id,
        required this.name,
        required this.imageUrl,
        required this.date});

  void selectEvent(BuildContext context) {
    Navigator.of(context).pushNamed(
      EventDetailScreen.routeName,
      arguments: id,
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectEvent(context),
      child: Card(
        color: k2PrimaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              imageUrl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  date,
                  style: const TextStyle(
                      color: kPrimaryColor,
                      fontSize: 15,
                    fontFamily: 'Marcellus',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              name,
              style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: kPrimaryColor,
                  fontFamily: 'Marcellus',
                ),
              ),
            ),
        ]),
      ),
    );
  }
}
