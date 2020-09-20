import 'package:flutter/material.dart';
import 'package:Proworktree/widgets/user_card.dart';
import 'package:Proworktree/utilities/user_api.dart';

class UserListTiles extends StatelessWidget {
  const UserListTiles({
    Key key,
    @required Future<List> userList,
  })  : _userList = userList,
        super(key: key);

  final Future<List> _userList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder(
        future: _userList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data);
            return ListView.builder(
              itemBuilder: (context, index) {
                return UserCard(
                  userdata: snapshot.data[index],
                );
              },
              itemCount: UserApi.length,
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200,
                    height: 200,
                    child: CircularProgressIndicator(
                      strokeWidth: 20,
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    'Loading Users',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
