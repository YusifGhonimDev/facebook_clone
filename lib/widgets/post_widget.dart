import 'package:facebook_clone/models/post_model.dart';
import 'package:flutter/material.dart';

class PostWidget extends StatefulWidget {
  final PostModel postModel;

  const PostWidget(this.postModel, {Key? key}) : super(key: key);

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  void _changeLikeButtonColor() {
    setState(() {
      if (widget.postModel.isLiked == false) {
        widget.postModel.buttonColor = Colors.blue;
        widget.postModel.numOfLikes = widget.postModel.numOfLikes! + 1;
        widget.postModel.isLiked = true;
      } else {
        widget.postModel.buttonColor = Colors.grey;
        widget.postModel.numOfLikes = widget.postModel.numOfLikes! - 1;
        widget.postModel.isLiked = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(widget.postModel.imagePath!),
            ),
            title: Text(widget.postModel.username!),
            subtitle: Row(
              children: [
                Text(widget.postModel.timePosted!),
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
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Text(widget.postModel.postText!),
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
              Text("${widget.postModel.numOfLikes}"),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                onPressed: () => _changeLikeButtonColor(),
                style:
                    TextButton.styleFrom(primary: widget.postModel.buttonColor),
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
  }
}
