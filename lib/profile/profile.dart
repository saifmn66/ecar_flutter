import 'package:e_car/profile/screens/profileSett.dart';
import 'package:e_car/profile/widgets/setting-sec.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: GestureDetector(
                  onTap: () {
                    // Show the sliding page when the notification icon is tapped
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true, // Allows full-screen height
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20.0),
                        ),
                      ),
                      builder: (BuildContext context) {
                        return _buildNotificationPage();
                      },
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(121, 49, 198, 91),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color.fromARGB(0, 114, 114, 114),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.notifications,
                        color: Color.fromARGB(255, 73, 73, 73),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              right: 20.0,
              left: 20.0,
              bottom: 10.0,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                color: const Color.fromARGB(79, 76, 175, 79),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: const NetworkImage(
                          "https://wac-cdn.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg?cdnVersion=2635",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Hi , There !",
                              style: GoogleFonts.lato(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                            const Text(
                              "Mensi Saif",
                              style: TextStyle(
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 38.0, left: 20.0),
            child: Row(
              children: [
                const SizedBox(), // Add spacing between the icon and the TextField
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start, // Align text to the left
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfilSsett(),
                            ),
                          );
                        },
                        child: SettingSec(
                          title: "Profile Settings",
                          iconData: Icons.person,
                        ),
                      ),
                      SettingSec(
                        title: "cars Settings",
                        iconData: Icons.directions_car,
                      ),
                      SettingSec(title: "Help", iconData: Icons.help),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Sliding page content
  Widget _buildNotificationPage() {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final double width = MediaQuery.of(context).size.width;

        return Container(
          padding: const EdgeInsets.all(20.0),
          width: width,
          height: constraints.maxHeight * 0.9, // Adjust the height as needed
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Notifications",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "You have no new notifications.",
                style: TextStyle(fontSize: 16.0),
              ),
              // Add more content here
            ],
          ),
        );
      },
    );
  }
}
