import 'package:facebook_clone/screens/log_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:facebook_clone/data/post_data.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  State<TimeLineScreen> createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  List<PostData> postTemplate = [
    PostData(
        imagePath:
            "https://pbs.twimg.com/profile_images/3478244961/01ebfc40ecc194a2abc81e82ab877af4_400x400.jpeg",
        username: "The Rock",
        postText: "With drive and a bit of talent you can move mountains.",
        timePosted: "16m",
        numOfLikes: 10,
        isLiked: false,
        buttonColor: Colors.grey),
    PostData(
        imagePath:
            "https://media.allure.com/photos/605247e1bddfa641546fa160/1:1/w_2264,h_2264,c_limit/billie%20eilish.jpg",
        username: "Billie Eilish",
        postText:
            "In the public eye, girls and women with strong perspectives are hated. If you're a girl with an opinion, people just hate you. There are still people who are afraid of successful women, and that's so lame.",
        timePosted: "10m",
        numOfLikes: 25,
        isLiked: false,
        buttonColor: Colors.grey),
    PostData(
        imagePath:
            "https://www.biography.com/.image/t_share/MTQ3NjM5MTEzMTc5MjEwODI2/eminem_photo_by_dave_j_hogan_getty_images_entertainment_getty_187596325.jpg",
        username: "Eminem",
        postText:
            "The truth is you don’t know what is going to happen tomorrow. Life is a crazy ride, and nothing is guaranteed.",
        timePosted: "25m",
        numOfLikes: 56,
        isLiked: false,
        buttonColor: Colors.grey),
    PostData(
        imagePath:
            "https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTQ3NTI2OTA4NzY5MjE2MTI4/drake_photo_by_prince_williams_wireimage_getty_479503454.jpg",
        username: "Drake",
        postText: "Everybody has an addiction, mine happens to be success.",
        timePosted: "20m",
        numOfLikes: 32,
        isLiked: false,
        buttonColor: Colors.grey),
    PostData(
        imagePath:
            "https://media.elcinema.com/uploads/_315x420_1abe848b2511fc302c0ea526035497552bb9d4647d7a0fa870b62631c7be00bf.jpg",
        username: "Vin Diesel",
        postText: "I don't have friends, I have a family.",
        timePosted: "22m",
        numOfLikes: 38,
        isLiked: false,
        buttonColor: Colors.grey)
  ];

  void _changeLikeButtonColor(int index) {
    setState(() {
      if (postTemplate[index].isLiked == false) {
        postTemplate[index].buttonColor = Colors.blue;
        postTemplate[index].numOfLikes = postTemplate[index].numOfLikes! + 1;
        postTemplate[index].isLiked = true;
      } else {
        postTemplate[index].buttonColor = Colors.grey;
        postTemplate[index].numOfLikes = postTemplate[index].numOfLikes! - 1;
        postTemplate[index].isLiked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
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
            return Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          PostData(imagePath: postTemplate[index].imagePath)
                              .imagePath!),
                    ),
                    title: Text(PostData(username: postTemplate[index].username)
                        .username!),
                    subtitle: Row(
                      children: [
                        Text(
                            PostData(timePosted: postTemplate[index].timePosted)
                                .timePosted!),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.circle,
                          size: 5,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 5),
                        const Icon(
                          Icons.public,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.more_horiz),
                        Icon(Icons.clear),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 20),
                    child: Text(PostData(postText: postTemplate[index].postText)
                        .postText!),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        width: 20,
                        height: 20,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blue,
                        ),
                        child: const Icon(
                          Icons.thumb_up_alt,
                          size: 15,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                          "${PostData(numOfLikes: postTemplate[index].numOfLikes).numOfLikes}"),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () => _changeLikeButtonColor(index),
                        style: TextButton.styleFrom(
                            primary: postTemplate[index].buttonColor),
                        icon: const Icon(Icons.thumb_up_alt_outlined),
                        label: const Text("Like"),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(primary: Colors.grey),
                        icon: const Icon(Icons.mode_comment_outlined),
                        label: const Text("Comment"),
                      ),
                      TextButton.icon(
                        onPressed: () {},
                        style: TextButton.styleFrom(primary: Colors.grey),
                        icon: const Icon(Icons.share_outlined),
                        label: const Text("Share"),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
