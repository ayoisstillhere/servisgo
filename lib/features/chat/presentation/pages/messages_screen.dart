import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:servisgo/features/auth/domain/entities/user_entity.dart';
import 'package:servisgo/features/chat/domain/entities/text_message_entity.dart';
import 'package:servisgo/features/chat/presentation/bloc/chat_cubit/chat_cubit.dart';
import 'package:servisgo/features/home/domain/entities/partner_entity.dart';
import 'package:servisgo/features/home/presentation/bloc/partner_cubit/partner_cubit.dart';

import '../../../../size_config.dart';
import '../widgets/message_tile.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({
    Key? key,
    required this.currentUser,
  }) : super(key: key);
  final UserEntity currentUser;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    BlocProvider.of<ChatCubit>(context).getTextMessages();
    BlocProvider.of<PartnerCubit>(context).getPartners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Messages",
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
      body: BlocBuilder<ChatCubit, ChatState>(
        builder: (context, state) {
          if (state is ChatLoaded) {
            final Map<String, TextMessageEntity> conversationMap = {};

            for (TextMessageEntity textMessageEntity in state.messages) {
              final String conversationId =
                  _getConversationId(textMessageEntity);
              if (!conversationMap.containsKey(conversationId) ||
                  textMessageEntity.timestamp.toDate().isAfter(
                        conversationMap[conversationId]!.timestamp.toDate(),
                      )) {
                conversationMap[conversationId] = textMessageEntity;
              }
            }

            final List<TextMessageEntity> allMessages =
                conversationMap.values.toList();
            allMessages.sort((a, b) =>
                b.timestamp.compareTo(a.timestamp)); // Sort by timestamp

            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(32),
              ),
              itemCount: allMessages.length,
              itemBuilder: (BuildContext context, int index) {
                return BlocBuilder<PartnerCubit, PartnerState>(
                  builder: (context, state) {
                    if (state is PartnerLoaded) {
                      final PartnerEntity partner = state.partners.firstWhere(
                        (partner) =>
                            partner.partnerId == allMessages[index].recipientId,
                      );
                      return Padding(
                        padding: EdgeInsets.only(
                            top: getProportionateScreenHeight(28)),
                        child: MessageTile(
                          imgUrl: widget.currentUser.pfpURL,
                          name: allMessages[index].recipientName,
                          lastMsg: allMessages[index].message,
                          time: DateFormat('hh:mm a')
                              .format(allMessages[index].timestamp.toDate()),
                          currentUser: widget.currentUser,
                          currentPartner: partner,
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  String _getConversationId(TextMessageEntity message) {
    List<String> participants = [];
    if (message.senderId == widget.currentUser.uid) {
      participants = [message.senderId, message.recipientId];
    } else {
      participants = [message.recipientId, message.senderId];
    }

    participants.sort();
    return participants.join('_');
  }
}
