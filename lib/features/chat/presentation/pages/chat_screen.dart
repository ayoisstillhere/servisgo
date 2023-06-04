import 'package:bubble/bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/text_message_entity.dart';
import '../bloc/chat_cubit/chat_cubit.dart';
import '../widgets/message_layout.dart';

import '../../../../constants.dart';
import '../../../../size_config.dart';
import '../../../home/domain/entities/partner_entity.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    Key? key,
    required this.partner,
    required this.user,
  }) : super(key: key);
  final PartnerEntity partner;
  final UserEntity user;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    BlocProvider.of<ChatCubit>(context).getTextMessages();
    _messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor =
        MediaQuery.of(context).platformBrightness == Brightness.dark
            ? kDarkPrimaryColor
            : kPrimaryColor;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.partner.partnerName,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_sharp,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _listMessagesWidget(primaryColor),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(32)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(16),
                      vertical: getProportionateScreenHeight(16)),
                  height: getProportionateScreenHeight(56),
                  width: getProportionateScreenWidth(56),
                  decoration: BoxDecoration(
                    color: kLightGreys,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(16),
                    ),
                  ),
                  child: SvgPicture.asset("assets/icons/addIcon.svg"),
                ),
                Container(
                  height: getProportionateScreenHeight(56),
                  width: getProportionateScreenWidth(256),
                  decoration: BoxDecoration(
                    // color: kBgColor,
                    borderRadius: BorderRadius.circular(
                      getProportionateScreenWidth(16),
                    ),
                    boxShadow: [
                      BoxShadow(
                          color: kBlacks.withOpacity(0.06),
                          blurRadius: 30,
                          spreadRadius: 0,
                          offset: const Offset(0, 8)),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: TextFormField(
                          controller: _messageController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                                right: getProportionateScreenWidth(72),
                                left: getProportionateScreenWidth(16)),
                            // fillColor: kBgColor,
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(16),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(16),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(16),
                              ),
                            ),
                            hintText: "Type Something...",
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: GestureDetector(
                          onTap: () {
                            if (_messageController.text.isNotEmpty) {
                              _sendMessage();
                              _messageController.clear();
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenHeight(16),
                              vertical: getProportionateScreenWidth(16),
                            ),
                            height: getProportionateScreenHeight(56),
                            width: getProportionateScreenWidth(56),
                            decoration: BoxDecoration(
                              color: kCallToAction,
                              borderRadius: BorderRadius.circular(
                                getProportionateScreenWidth(16),
                              ),
                            ),
                            child: SvgPicture.asset("assets/icons/Send.svg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(height: getProportionateScreenHeight(58)),
        ],
      ),
    );
  }

  Expanded _listMessagesWidget(Color primaryColor) {
    return Expanded(
      child: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state is ChatLoaded) {
            List<TextMessageEntity> messages = [];
            for (TextMessageEntity message in state.messages) {
              if ((widget.user.uid == message.senderId ||
                      widget.user.uid == message.recipientId) &&
                  (widget.partner.partnerId == message.senderId ||
                      widget.partner.partnerId == message.recipientId)) {
                messages.add(message);
              }
              messages.sort((a, b) =>
                  a.timestamp.compareTo(b.timestamp)); // sort by timestamp
            }

            return ListView.builder(
              shrinkWrap: true,
              itemCount: messages.length,
              itemBuilder: (_, index) {
                return messages[index].senderId == widget.user.uid
                    ? MessageLayout(
                        text: messages[index].message,
                        time: DateFormat('hh:mm a')
                            .format(messages[index].timestamp.toDate()),
                        color: primaryColor,
                        align: TextAlign.left,
                        boxAlignment: CrossAxisAlignment.end,
                        nip: BubbleNip.rightBottom,
                        senderName: widget.user.name,
                        boxMainAxisAlignment: MainAxisAlignment.end,
                        pfpUrl: widget.user.pfpURL,
                      )
                    : MessageLayout(
                        text: messages[index].message,
                        time: DateFormat('hh:mm a')
                            .format(messages[index].timestamp.toDate()),
                        color: kLightGreys,
                        align: TextAlign.left,
                        boxAlignment: CrossAxisAlignment.start,
                        nip: BubbleNip.leftBottom,
                        senderName: widget.partner.partnerName,
                        boxMainAxisAlignment: MainAxisAlignment.start,
                        pfpUrl: widget.partner.partnerPfpURL,
                      );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  void _sendMessage() {
    BlocProvider.of<ChatCubit>(context).sendTextMessage(
      textMessageEntity: TextMessageEntity(
        widget.partner.partnerId,
        widget.user.uid,
        Timestamp.now(),
        _messageController.text,
        widget.partner.partnerName,
        widget.user.name,
      ),
    );
  }
}
