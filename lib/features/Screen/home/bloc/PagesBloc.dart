import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ealmashi/features/Screen/Chat/api/create_message_remote.dart';
import 'package:ealmashi/features/Screen/Chat/api/delete_conversation_api.dart';
import 'package:ealmashi/features/Screen/Chat/api/getAll_conversations_remote.dart';
import 'package:ealmashi/features/Screen/Chat/api/get_messages_chat_api.dart';
import 'package:ealmashi/features/Screen/Chat/api/send_messages.dart';
import 'package:ealmashi/features/Screen/Chat/model/get_chat_model/get_chat_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/api/delete_notification_api.dart';
import 'package:ealmashi/features/Screen/MyAccount/api/notifications_remote.dart';
import 'package:ealmashi/features/Screen/MyAccount/api/social_links_remote.dart';
import 'package:ealmashi/features/Screen/MyAccount/api/user_details_remote.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/data.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/facebook_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/instagram_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/snapchat_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/social_links_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/twitter_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/whatsapp_model.dart';
import 'package:ealmashi/features/Screen/home/api/categorie_api.dart';
import 'package:ealmashi/features/Screen/home/api/get_category_id_api.dart';
import 'package:ealmashi/features/Screen/home/model/categories_model.dart';
import 'package:ealmashi/features/Screen/home/model/category_id_model.dart';
import 'package:ealmashi/features/Screen/home/model/chat_model.dart';
import 'package:ealmashi/features/Screen/home/model/conversation_model.dart';
import 'package:ealmashi/features/Screen/home/model/user_model.dart';
import 'package:ealmashi/features/Screen/home/repo/chat_repo.dart';
import 'package:ealmashi/Globals.dart';
import 'package:flutter/cupertino.dart';

import '../../../../Preference.dart';
import 'PagesEvent.dart';
import 'pages_state.dart';


class PagesBloc extends Bloc<PagesEvents, PagesState> {
  CategoryRemoteDataSource categoryRemoteDataSource;
  CategoryIdRemoteDataSource categoryIdRemoteDataSource;
  UserDetailsRemoteDataSource userDetailsRemoteDataSource;
  NotificationRemoteDataSource notificationRemoteDataSource;
  DeleteNotificationRemoteDataSource deleteNotificationRemoteDataSource;
  GetAllConversationsRemoteDataSource getAllConversationsRemoteDataSource;
  CreateConversationRemoteDataSource createConversationRemoteDataSource;
  DeleteConversationRemoteDataSource deleteConversationRemoteDataSource;
  GetConversationChatRemoteDataSource getConversationChatRemoteDataSource;
  SendMessageRemoteDataSource sendMessageRemoteDataSource;
  SocialLinksRemoteDataSource socialLinksRemoteDataSource;
  PagesBloc({required this.categoryRemoteDataSource,
    required this.categoryIdRemoteDataSource,
  required this.userDetailsRemoteDataSource,
    required this.notificationRemoteDataSource,
    required this.getAllConversationsRemoteDataSource,
    required this.createConversationRemoteDataSource,
    required this.getConversationChatRemoteDataSource,
    required this.sendMessageRemoteDataSource,
    required this.socialLinksRemoteDataSource,
    required this.deleteNotificationRemoteDataSource,
    required this.deleteConversationRemoteDataSource

  }) : super(PagesState.initial());

  ChatRepository chatRepository =  ChatRepository();


  void onGetUserDetailsEvent() {
    add(GetUserDetailsEvent(
    ));
  }
  void onGetNotificationEvent() {
    add(GetNotificationEvent(
    ));
  }

  void onGetCategoriesEvent() {
    add(GetCategoriesEvent(
    ));
  }
  void onGetSocialLinksEvent() {
    add(GetSocialLinksEvent(
    ));
  }
  void onDeleteNotificationEvent(int id) {
    add(DeleteNotificationEvent(
      id: id
    ));
  }
  void onDeleteConversationEvent(int id) {
    add(DeleteConversationEvent(
        id: id
    ));
  }

  void onGetConversationEvent() {
    add(GetConversationEvent(
    ));
  }
  void onGetCategoryEvent(int id){
    add(GetCategoryEvent(category_id:id ));
  }
  void onGetAllConEvent(int userId){
    add(GetAllConEvent(userId: userId ));
  }
  void onCreateChatEvent(int userId,int activityId){
    add(CreateChatEvent(userId: userId ,activityId: activityId));
  }

  void onAddMessage(  ConversationModel? conversation,String text,UserChat user){
    add(AddMessage(conversation,text,user));
  }
  void onGetConvEvent(int conversation_id){
    add(GetConvEvent(conversation_id:  conversation_id ));
  }

  void onSendMassegEvent( String content,int converstion_id,int is_user){
    add(SendMassegEvent(content: content,converstion_id:converstion_id ,is_user: is_user));
  }


  @override
  Stream<PagesState> mapEventToState(PagesEvents event) async* {

      if (event is GetCategoriesEvent) {
      yield state.rebuild((b) => b
        ..isLoadingCate = true
        ..isSuccessCate  = false
        ..errorMessage=''
        ..categoryModel=CategoryModel(data: [])

      );
      final result = await categoryRemoteDataSource.getCategories();
      print("result");
      print(result);
      print("result");
      yield* result.fold(
              (l) async* {
            yield state.rebuild((b) => b
              ..isLoadingCate = false
              ..isSuccessCate  = false
              ..errorMessage = l);
          }, (r) async* {

        print('sucesss');
        print(r.data!.length);
        print('sucesss');

        yield state.rebuild((b) => b
          ..isLoadingCate  = false
          ..isSuccessCate  = true
          ..errorMessage = ''
          ..categoryModel=r
        );
      });
    }

      else if (event is GetCategoryEvent) {
        yield state.rebuild((b) => b
          ..isLoadingCateId = true
          ..isSuccessCateId  = false
          ..errorMessage=''
          ..allActivity = CategoryIdModel(data: [])
          ..categoryIdModel = CategoryIdModel(data: [])
        );
        final result = await categoryIdRemoteDataSource.getCategories(event.category_id);
        if(event.category_id==0)
          {
            print("result");
            print(result);
            print("result");
            yield* result.fold(
                    (l) async* {
                  yield state.rebuild((b) => b
                    ..isLoadingCateId = false
                    ..isSuccessCateId  = false
                    ..errorMessage = l);
                }, (r) async* {

              print('sucesss');
              print(r.data!.length);
              print('sucesss');

              yield state.rebuild((b) => b
                ..isLoadingCateId  = false
                ..isSuccessCateId  = true
                ..errorMessage = ''
                ..allActivity=r
              );
            });
          }
        else{
          print("result");
          print(result);
          print("result");
          yield* result.fold(
                  (l) async* {
                yield state.rebuild((b) => b
                  ..isLoadingCateId = false
                  ..isSuccessCateId  = false
                  ..errorMessage = l);
              }, (r) async* {

            print('sucesss');
            print(r.data!.length);
            print('sucesss');

            yield state.rebuild((b) => b
              ..isLoadingCateId  = false
              ..isSuccessCateId  = true
              ..errorMessage = ''
              ..categoryIdModel=r
            );
          });
        }

      }

      else if (event is DeleteNotificationEvent) {
        yield state.rebuild((b) => b

          ..errorMessage=''


        );
        final result = await deleteNotificationRemoteDataSource.deleteNotification(event.id);
        print(result);

      }
      else if (event is DeleteConversationEvent) {
        yield state.rebuild((b) => b

          ..errorMessage=''


        );
        final result = await deleteConversationRemoteDataSource.deleteConversation(event.id);
        print(result);

      }

      else if (event is SendMassegEvent) {
        yield state.rebuild((b) => b
          ..isLoadingSend = true
          ..isSuccessSend  = false
          ..errorMessage=''


        );
        final result = await sendMessageRemoteDataSource.sendMessage(event.is_user,event.converstion_id,event.content);
          yield* result.fold(
                  (l) async* {
                yield state.rebuild((b) => b
                  ..isLoadingCateId = false
                  ..isSuccessCateId  = false
                  ..errorMessage = l);
              }, (r) async* {

            yield state.rebuild((b) => b
              ..isLoadingSend  = false
              ..isSuccessSend  = true
              ..errorMessage = ''
              ..sendMessageModel=r
            );
          });



      }
      else if (event is GetAllConEvent) {
        yield state.rebuild((b) => b
          ..isLoadingAllCon = true
          ..isSuccessAllCon  = false
          ..errorMessage=''


        );
        final result = await getAllConversationsRemoteDataSource.getAllconv(event.userId);
        if(event.userId>0)
        {
          print("result");
          print(result);
          print("result");
          yield* result.fold(
                  (l) async* {
                yield state.rebuild((b) => b
                  ..isLoadingAllCon = false
                  ..isSuccessAllCon = false
                  ..errorMessage = l);
              }, (r) async* {

            print('sucesss');
            print(r.data!.length);
            print('sucesss');

            yield state.rebuild((b) => b
              ..isLoadingAllCon  = false
              ..isSuccessAllCon  = true
              ..errorMessage = ''
              ..allConversationsModel=r
            );
          });
        }


      }
      else if (event is GetConvEvent) {
        yield state.rebuild((b) => b
          ..isLoadingChat = true
          ..isSuccessChat = false
          ..errorMessage=''
          ..getChatModel=GetChatModel(data: [])

        );
        final result = await getConversationChatRemoteDataSource.getconvChat(event.conversation_id);
        if(event.conversation_id>0)
        {
          print("result");
          print(result);
          print("result");
          yield* result.fold(
                  (l) async* {
                yield state.rebuild((b) => b
                  ..isLoadingChat = false
                  ..isSuccessChat = false
                  ..errorMessage = l);
              }, (r) async* {

            print('sucesss');
            print(r.data!.length);
            print('sucesss');

            yield state.rebuild((b) => b
              ..isLoadingChat  = false
              ..isSuccessChat  = true
              ..errorMessage = ''
              ..getChatModel=r
            );
          });
        }


      }
      else if (event is GetSocialLinksEvent) {
        yield state.rebuild((b) => b
          ..isLoadingUser  = true
          ..isSuccessUser  = false
          ..errorMessage=''
          ..socialLinksModel=SocialLinksModel(data: SocialLinksData(facebook: FacebookModel(id: 0, url: ''), instagram: InstagramModel(id: 0, url: ''),snapchat: SnapchatModel(id: 0, url: ''),twitter: TwitterModel(id: 0, url: ''),whatsapp: WhatsappModel(id: 0, url: '')))


        );
        final result = await socialLinksRemoteDataSource.getSocialLinks();


        yield* result.fold(
                (l) async* {
              yield state.rebuild((b) => b
                ..isLoadingUser = false

                ..isSuccessUser  = false
                ..errorMessage = l);
            }, (r) async* {



          yield state.rebuild((b) => b
            ..isLoadingUser  = false
            ..isSuccessUser  = true
            ..errorMessage = ''
            ..socialLinksModel=r
          );
        });

      }


      else if (event is CreateChatEvent) {
        yield state.rebuild((b) => b
          ..isLoadingCreateChat = true
          ..isSuccessCreateChat  = false
          ..errorMessage=''


        );
        final result = await createConversationRemoteDataSource.createChat(event.userId,event.activityId);
        if(event.userId>0)
        {

          yield* result.fold(
                  (l) async* {
                yield state.rebuild((b) => b
                  ..isLoadingCreateChat = false
                  ..isSuccessCreateChat = false
                  ..errorMessage = l);
              }, (r) async* {

            print('sucesss');
            print(r.data!=null);
            print('sucesss');

            yield state.rebuild((b) => b
              ..isLoadingCreateChat  = false
              ..isSuccessCreateChat  = true
              ..errorMessage = ''
              ..createChatModel=r
            );
          });
        }


      }


      else if (event is GetUserDetailsEvent) {
        yield state.rebuild((b) => b
          ..isLoadingUser = true
          ..isSuccessUser  = false
          ..errorMessage=''


        );
        final result = await userDetailsRemoteDataSource.userDetails();
        print("result");
        print(result);
        print("result");
        yield* result.fold(
                (l) async* {
              yield state.rebuild((b) => b
                ..isLoadingUser = false

                ..isSuccessUser  = false
                ..errorMessage = l);
            }, (r) async* {


          if(r.data!=null){
            if(r.data!.subscriptions!.length>0)
            {
              if(r.data!.subscriptions![0].status!=null) {
                Global.subStatus = r.data!.subscriptions![0].status;
                Preferences.saveSubStatus(Global.subStatus!);
              }
               Preferences.saveSubEnd(r.data!.subscriptions![0].to!);
               Global.subEnd=r.data!.subscriptions![0].to!;
              if(r.data!.subscribed_package_name!=null){
                Preferences.saveSubName(r.data!.subscribed_package_name!);
                Global.subName=r.data!.subscribed_package_name!;

              }
            }
          }

          yield state.rebuild((b) => b
            ..isLoadingUser  = false
            ..isSuccessUser  = true
            ..errorMessage = ''
            ..userMyaccountModel=r
          );
        });
      }

      else if (event is AddMessage) {
        ChatModel _chat = new ChatModel(
          id: UniqueKey().toString(),
          userId: Global.userID.toString(),
          text: event.text,
          time: DateTime.now().toUtc().millisecondsSinceEpoch,


        );
        if (event.conversation!.id == null) {
          event.conversation!.id = UniqueKey().toString();
          UserChat user=UserChat(id: Global.userID.toString(), name: Global.userName!);
          event.conversation!.users.add(user);
          event.conversation!.users.add(event.user2);
          event.conversation!.lastMessageTime = DateTime.now().toUtc().millisecondsSinceEpoch;
          event.conversation!.readByUsers = [Global.userID.toString()];
          chatRepository.createConversation( event.conversation!).then((value) {
            print("value");
          });
        }
        event.conversation!.lastMessage = event.text;
        event.conversation!.lastMessageTime = _chat.time;
        event.conversation!.readByUsers = [Global.userID.toString()];
        chatRepository.addMessage( event.conversation!, _chat).then((value) {

        });




      }

      else if (event is GetConversationEvent) {
        yield state.rebuild((b) => b

          ..errorMessage=''


        );
        Stream<QuerySnapshot> result =await chatRepository.getUserConversations(userId: Global.userID.toString());
        result.listen((event) async*{
          print("resadult");
          print(event.docs);
          yield state.rebuild((b) => b
              ..conversationModel=event.docs.cast<ConversationModel>()

          );
          print("resadult");
        });


      }

      else if (event is GetNotificationEvent) {
        yield state.rebuild((b) =>
        b
          ..isLoadingSlider = true
          ..isSuccessSlider = false
          ..errorMessage = ''


        );
        int user_id = Global.userID!;
        if (user_id > 0) {
          final result = await notificationRemoteDataSource.getNotification(user_id);
          print("result");
          print(result);
          print("result");
          yield* result.fold(
                  (l) async* {
                yield state.rebuild((b) =>
                b
                  ..isLoadingSlider = false
                  ..isSuccessSlider = false
                  ..errorMessage = l);
              }, (r) async* {
            print('sucesss');

            print('sucesss');

            yield state.rebuild((b) =>
            b
              ..isLoadingSlider = false
              ..isSuccessSlider = true
              ..errorMessage = ''
              ..notificationModel = r
            );
          });
        }
      }


  }
}
