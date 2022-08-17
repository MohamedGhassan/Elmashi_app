import 'package:ealmashi/Globals.dart';
import 'package:ealmashi/features/Screen/Chat/model/all_conversations_response.dart';
import 'package:ealmashi/features/Screen/Chat/model/data.dart';
import 'package:ealmashi/features/Screen/home/bloc/PagesBloc.dart';
import 'package:ealmashi/features/Screen/home/chat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MessageItemWidget extends StatefulWidget {
  MessageItemWidget({
    Key? key,
    required this.message,
    required this.bloc,
    this.index,
    this.voidCallback,
    this.activity_name,
    this.activity_id,
    this.activity_phone,
    this.user_name,
    this.conversation_id,
    this.timestamp,
  }) : super(key: key);
  final AllConverData message;
  final PagesBloc bloc;
  final int? index;

  VoidCallback? voidCallback;
  dynamic? timestamp;
  String? activity_name;
  String? user_name;
  int? user_id;
  String? activity_phone;
  int? activity_id;

  int? conversation_id;

  @override
  _MessageItemWidgetState createState() => _MessageItemWidgetState();
}

class _MessageItemWidgetState extends State<MessageItemWidget> {

  TextEditingController content = TextEditingController();
  @override

  Widget build(BuildContext context) {
    return Slidable(
        key: UniqueKey(),
        endActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: ScrollMotion(),
          // All actions are defined in the children parameter.
          children: [
            // A SlidableAction can have an icon and/or a label.
            SlidableAction(
              onPressed: (dynamic) {
                widget.bloc.onDeleteConversationEvent(widget.message.id!);
                widget.bloc.onGetAllConEvent(Global.userID!);
              },
              backgroundColor: Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'حذف',
            ),
          ],
        ),
        child: InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Chat(
                          activity_name: widget.message.activity!.name,
                          activity_id: widget.message.activity_id,
                          conversation_id: widget.message.id,
                          bloc: widget.bloc,
                          activity_phone: widget.message.activity!.user!.phone!,
                          index: widget.index,
                          user_name: widget.message.user!.name!,
                          user_id: widget.message.user_id!,
                          timestamp: DateTime.now(),
                        )));
            // if (Global.userID ==
            //     widget.user_id)
            //   widget.bloc
            //       .onSendMassegEvent(
            //       content.text,
            //       widget
            //           .conversation_id!,
            //       1);
            // else
            //   widget.bloc
            //       .onSendMassegEvent(
            //       content.text,
            //       widget
            //           .conversation_id!,
            //       0);
          },
          child: Container(
            color: Theme.of(context).focusColor.withOpacity(0.05),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    SizedBox(
                      width: 65,
                      height: 65,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(60)),
                        child: Image.asset('assets/images/logo.png'),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      right: 3,
                      width: 12,
                      height: 12,
                      child: Container(
                        decoration: BoxDecoration(
//                        color: widget.message.user.userState == UserState.available
//                            ? Colors.green
//                            : widget.message.user.userState == UserState.away ? Colors.orange : Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(width: 15),
                Global.userID == widget.message.user_id
                    ? Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        this.widget.message.activity!.name!,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  this
                                      .widget
                                      .message
                                      .created_at!
                                      .substring(0, 10),
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        this.widget.message.user!.name!,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                      Text(
                                        this.widget.message.user!.phone!,
                                        overflow: TextOverflow.fade,
                                        softWrap: false,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  this
                                      .widget
                                      .message
                                      .created_at!
                                      .substring(0, 10),
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ],
            ),
          ),
        ));
  }
}
