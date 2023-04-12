import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/constants.dart';

import 'Team/about_team.dart';

class SettingsScreen extends StatelessWidget {

  static String routeName='SettingsScreen';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kPrimaryColor,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Container(height: 20,),
          headingTile(),
          divider(),
          colorTiles(context),
        ],
      ),
    );
  }

  Widget headingTile(){
    return const ListTile(
      minLeadingWidth: 100,
      title: Text(
        "SETTINGS",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontFamily: 'Marcellus',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget divider(){
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1.5,
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget colorTiles(BuildContext context){
    return Column(
      children: [
        colorTile(
          Icons.privacy_tip_outlined,
          kSecondaryColor,
          "Privacy Policy",
            () {
              HapticFeedback.heavyImpact();
              showDialog(
                context: context,
                builder: (context)=> const AlertDialog(
                  title: Text('Privacy Policy', textAlign: TextAlign.center,),
                  content: Text("Our Privacy Policy was last updated on [DATE]."
                      "This Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your"
                      "information when You use the Service and tells You about Your privacy rights and how the law protects You."
                      "We use Your Personal data to provide and improve the Service. By using the Service, You agree to the"
                      "collection and use of information in accordance with this Privacy Policy. This Privacy Policy was generated"
                      "by TermsFeed App Privacy Policy Generator."),
                ),
              );
            },
        ),
        colorTile(
          Icons.report_problem,
          kSecondaryColor,
          "Complaint",
              () {
                HapticFeedback.heavyImpact();
            showDialog(
                context: context,
                builder: (context)=> const AlertDialog(
                  title: Text('Complaint', textAlign: TextAlign.center,),
                  content: Text("Submit your complaints below\nhttp://...."),
                ),
              );
          },
        ),
        colorTile(
          Icons.feedback,
          kSecondaryColor,
          "Feedback/ Suggestion",
              () {
                HapticFeedback.heavyImpact();
                showDialog(
                  context: context,
                  builder: (context)=> const AlertDialog(
                    title: Text('FeedBack', textAlign: TextAlign.center,),
                    content: Text("If you feel we can improve yours,i.e users experience...\n"
                        "Then please give your suggestions on below link!\n"
                        "http://........"),
                  ),
                );
          },
        ),
        colorTile(
          Icons.people_alt_outlined,
          kSecondaryColor,
          "About Team",
              () {
                HapticFeedback.heavyImpact();
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const AboutTeam()),);
          },
        ),
      ],
    );
  }

  Widget colorTile(IconData icon, Color color, String text, VoidCallback onPress){
    return SizedBox(
      height: 70,
      child: ListTile(
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color.withOpacity(0.9),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            icon,
            color: kPrimaryColor,
          ),
        ),
        title: Text(
            text,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: kWhite,
            fontFamily: 'Marcellus',
          ),
        ),
        trailing: GestureDetector(
          onTap: onPress,
          child: const Icon(
            Icons.arrow_forward_ios,
            color: kTextWhiteColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}
