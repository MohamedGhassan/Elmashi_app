import 'package:ealmashi/features/Screen/home/model/conversation_model.dart';
import 'package:ealmashi/features/Screen/home/model/user_model.dart';
import 'package:equatable/equatable.dart';


import 'package:meta/meta.dart';

@immutable
abstract class PagesEvents extends Equatable {
  @override
  List<Object> get props => [];
}


class GetCategoriesEvent extends PagesEvents {

}
class CreateChatEvent extends PagesEvents {
  int userId;
  int activityId;
  CreateChatEvent({
    required this.userId,
    required this.activityId,
  });
}

class GetAllConEvent extends PagesEvents {

  int userId;

  GetAllConEvent({
    required this.userId,
  });
}

class GetConvEvent extends PagesEvents {

  int conversation_id;

  GetConvEvent({
    required this.conversation_id,
  });
}


class GetNotificationEvent extends PagesEvents {

}

class GetSocialLinksEvent extends PagesEvents {

}
class SendMassegEvent extends PagesEvents {
  int is_user;
  String content;
  int converstion_id;

  SendMassegEvent({
      required  this.is_user,required this.content,required this.converstion_id});
}

class GetUserDetailsEvent extends PagesEvents {

}

class GetConversationEvent extends PagesEvents {

}

class GetCategoryEvent extends PagesEvents {

  int category_id;

  GetCategoryEvent({
  required this.category_id,
  });


}

class DeleteNotificationEvent extends PagesEvents {

 final int  id;
  DeleteNotificationEvent({
    required this.id,
  });


}

class DeleteConversationEvent extends PagesEvents {

  final int  id;
  DeleteConversationEvent({
    required this.id,
  });


}

class AddMessage extends PagesEvents {
  ConversationModel? conversation;
  UserChat user2;
  String text;
AddMessage(this.conversation,this.text,this.user2);
}