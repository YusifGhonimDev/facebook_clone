import 'package:facebook_clone/screens/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/models/post_model.dart';
import 'package:facebook_clone/widgets/post_widget.dart';

class TimeLineScreen extends StatefulWidget {
  final TextEditingController? username;

  const TimeLineScreen({Key? key, this.username}) : super(key: key);

  @override
  State<TimeLineScreen> createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  List<PostModel> postTemplate = [
    PostModel(
        imagePath:
            "https://pbs.twimg.com/profile_images/3478244961/01ebfc40ecc194a2abc81e82ab877af4_400x400.jpeg",
        username: "The Rock",
        postText: "With drive and a bit of talent you can move mountains.",
        timePosted: "16 minutes ago",
        numOfLikes: 10),
    PostModel(
        imagePath:
            "https://media.allure.com/photos/605247e1bddfa641546fa160/1:1/w_2264,h_2264,c_limit/billie%20eilish.jpg",
        username: "Billie Eilish",
        postText:
            "In the public eye, girls and women with strong perspectives are hated. If you're a girl with an opinion, people just hate you. There are still people who are afraid of successful women, and that's so lame.",
        timePosted: "10 minutes ago",
        numOfLikes: 25),
    PostModel(
        imagePath:
            "https://www.biography.com/.image/t_share/MTQ3NjM5MTEzMTc5MjEwODI2/eminem_photo_by_dave_j_hogan_getty_images_entertainment_getty_187596325.jpg",
        username: "Eminem",
        postText:
            "The truth is you don’t know what is going to happen tomorrow. Life is a crazy ride, and nothing is guaranteed.",
        timePosted: "25 minutes ago",
        numOfLikes: 56),
    PostModel(
        imagePath:
            "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTQ3NTI2OTA4NzY5MjE2MTI4/drake_photo_by_prince_williams_wireimage_getty_479503454.jpg",
        username: "Drake",
        postText: "Everybody has an addiction, mine happens to be success.",
        timePosted: "20 minutes ago",
        numOfLikes: 32),
    PostModel(
        imagePath:
            "https://media.elcinema.com/uploads/_315x420_1abe848b2511fc302c0ea526035497552bb9d4647d7a0fa870b62631c7be00bf.jpg",
        username: "Vin Diesel",
        postText: "I don't have friends, I have a family.",
        timePosted: "22 minutes ago",
        numOfLikes: 38)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Welcome, ${widget.username!.text}",
            style: const TextStyle(
              fontSize: 15,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const LogInScreen())),
              child: const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: ListView.builder(
          itemCount: postTemplate.length,
          itemBuilder: (context, index) {
            return PostWidget(postTemplate[index]);
          },
        ),
      ),
    );
  }
}
