import 'package:Proworktree/utilities/constants.dart';

class UserData {
  String userName;
  String emailAddress;
  String imageUrl;
  UserData(
      {this.userName, this.emailAddress, this.imageUrl = kDefaultUserImageUrl});
}
