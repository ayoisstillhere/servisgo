import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';

import '../../../../constants.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../domain/entities/text_message_entity.dart';
import '../bloc/chat_cubit/chat_cubit.dart';
import '../../../home/domain/entities/partner_entity.dart';
import '../../../home/presentation/bloc/partner_cubit/partner_cubit.dart';

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
        leading: const SizedBox(
          height: 0,
          width: 0,
        ),
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

            List<TextMessageEntity> requiredMessages = [];
            for (TextMessageEntity textMessageEntity in allMessages) {
              if (textMessageEntity.senderId == widget.currentUser.uid ||
                  textMessageEntity.recipientId == widget.currentUser.uid) {
                requiredMessages.add(textMessageEntity);
              }
            }

            return ListView.builder(
              padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(32),
              ),
              itemCount: requiredMessages.length,
              itemBuilder: (BuildContext context, int index) {
                return BlocBuilder<PartnerCubit, PartnerState>(
                  builder: (context, state) {
                    if (state is PartnerLoaded) {
                      final PartnerEntity partner = state.partners.firstWhere(
                        (partner) =>
                            partner.partnerId ==
                                requiredMessages[index].recipientId ||
                            partner.partnerId ==
                                requiredMessages[index].senderId,
                      );
                      return Padding(
                        padding: EdgeInsets.only(
                            top: getProportionateScreenHeight(28)),
                        child: MessageTile(
                          imgUrl: partner.partnerPfpURL,
                          name: partner.partnerName,
                          lastMsg: requiredMessages[index].message,
                          time: DateFormat('hh:mm a').format(
                              requiredMessages[index].timestamp.toDate()),
                          currentUser: widget.currentUser,
                          currentPartner: partner,
                        ),
                      );
                    }
                    return Center(
                      child: SpinKitPulsingGrid(
                        color: kPrimaryColor,
                        size: getProportionateScreenWidth(100),
                      ),
                    );
                  },
                );
              },
            );
          }
          return Center(
            child: SpinKitPulsingGrid(
              color: kPrimaryColor,
              size: getProportionateScreenWidth(100),
            ),
          );
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
