import 'package:flutter/material.dart';
import 'package:Proworktree/utilities/constants.dart';

class UserCard extends StatefulWidget {
  final Map userdata;
  UserCard({this.userdata});

  @override
  _UserCardState createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: kUserCardGradient,
              ),
            ),
            child: CircleAvatar(
              radius: 54,
              backgroundColor: Colors.blue,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  widget.userdata['avatar'].toString(),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  '${widget.userdata['first_name'].toString()} ${widget.userdata['last_name'].toString()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 60,
                  child: Divider(
                    color: Colors.blue,
                    thickness: 3,
                  ),
                ),
                Icon(Icons.email),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.userdata['email'].toString(),
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
