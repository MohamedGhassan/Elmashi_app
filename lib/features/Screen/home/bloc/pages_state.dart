import 'package:built_value/built_value.dart';
import 'package:ealmashi/features/Screen/Chat/model/all_conversations_response.dart';
import 'package:ealmashi/features/Screen/Chat/model/create_chat/create_chat_model.dart';
import 'package:ealmashi/features/Screen/Chat/model/create_chat/data.dart';
import 'package:ealmashi/features/Screen/Chat/model/get_chat_model/get_chat_model.dart';
import 'package:ealmashi/features/Screen/Chat/model/send_message/data.dart';
import 'package:ealmashi/features/Screen/Chat/model/send_message/send_message_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/data.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/myAcount/data.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/myAcount/user_myAcc.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/myAcount/user_object.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/notification/data.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/notification/notification_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/data.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/facebook_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/instagram_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/snapchat_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/social_links_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/twitter_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/social_links/whatsapp_model.dart';
import 'package:ealmashi/features/Screen/MyAccount/model/user_model.dart';
import 'package:ealmashi/features/Screen/bank_transfer/model/packages_model.dart';
import 'package:ealmashi/features/Screen/home/model/categories_model.dart';
import 'package:ealmashi/features/Screen/home/model/category_id_model.dart';
import 'package:ealmashi/features/Screen/home/model/conversation_model.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/package_model.dart';
import 'package:ealmashi/features/Screen/loginScreen/model/sub_model.dart';

part 'pages_state.g.dart';

abstract class PagesState implements Built<PagesState, PagesStateBuilder> {
  bool? get isSuccess;

  bool? get isLoading;

  bool? get isSuccessAllCon;

  bool? get isLoadingAllCon;

  bool? get isLoadingSlider;

  bool? get isSuccessSlider;

  bool? get isLoadingCate;

  bool? get isSuccessCate;

  bool? get isLoadingCateId;

  bool? get isSuccessCateId;

  bool? get isLoadingCreateChat;

  bool? get isSuccessCreateChat;

  bool? get isLoadingChat;

  bool? get isSuccessChat;

  bool? get isLoadingSend;

  bool? get isSuccessSend;

  bool? get isLoadingUser;

  bool? get isSuccessUser;

  String? get errorMessage;

  CategoryModel? get categoryModel;

  UserModel? get userModel;

  SendMessageModel? get sendMessageModel;

  SocialLinksModel? get socialLinksModel;

  NotificationModel? get notificationModel;

  AllConversationsModel? get allConversationsModel;

  UserMyaccountModel? get userMyaccountModel;

  GetChatModel? get getChatModel;

  CreateChatModel? get createChatModel;

  CategoryIdModel? get categoryIdModel;

  CategoryIdModel? get allActivity;

  List<ConversationModel>? get conversationModel;

  PagesState._();

  factory PagesState([void Function(PagesStateBuilder) updates]) = _$PagesState;

  factory PagesState.initial() {
    return PagesState((b) => b
      ..isLoading = false
      ..isSuccess = false
      ..isLoadingUser = false
      ..isSuccessUser = false
      ..socialLinksModel = SocialLinksModel(
          data: SocialLinksData(
              facebook: FacebookModel(id: 0, url: ''),
              instagram: InstagramModel(id: 0, url: ''),
              snapchat: SnapchatModel(id: 0, url: ''),
              twitter: TwitterModel(id: 0, url: ''),
              whatsapp: WhatsappModel(id: 0, url: '')))
      ..isLoadingCreateChat = false
      ..isSuccessCreateChat = false
      ..isLoadingSend = false
      ..isSuccessSend = false
      ..createChatModel = CreateChatModel(data: Data(id: 0, activity_id: 0))
      ..isLoadingSlider = false
      ..isSuccessSlider = false
      ..isLoadingCate = false
      ..isLoadingCateId = false
      ..notificationModel = NotificationModel(
          data: DataNot(allNotifications: [], unseenNotifications: []))
      ..conversationModel = []
      ..isSuccessAllCon = false
      ..isLoadingAllCon = false
      ..isLoadingChat = false
      ..isSuccessChat = false
      ..userMyaccountModel = UserMyaccountModel(
          data: UserDetails2(
              subscriptions: [],
              user: UserObjectModel(
                id: 0,
                name: '',
                api_token: '',
                email: '',
                photo: '',
                phone: '',
              ),
              subscribed_package_name: ''))
      ..sendMessageModel = SendMessageModel(
          data: DataSend(
              content: '',
              conversation_id: 0,
              id: 0,
              created_at: '',
              is_from_user: 0,
              is_read: 0))
      ..getChatModel = GetChatModel(data: [])
      ..userModel = UserModel(
          data: UserDetails(
        name: '',
        photo: '',
        type: '',
        email: '',
        api_token: '',
        id: 0,
      ))
      ..isSuccessCate = false
      ..categoryModel = CategoryModel(data: [])
      ..categoryIdModel = CategoryIdModel(data: [])
      ..allActivity = CategoryIdModel(data: [])
      ..allConversationsModel = AllConversationsModel(data: []));
  }
}
