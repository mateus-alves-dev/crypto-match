import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/presentation/cubit/messages_cubit.dart';
import 'package:crypto_match/features/chat/presentation/cubit/messages_state.dart';
import 'package:crypto_match/features/chat/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({required this.conversation, super.key});

  final Conversation conversation;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _controller = TextEditingController();
  final _scrollController = ScrollController();
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    context
        .read<MessagesCubit>()
        .loadMessages(conversation: widget.conversation);
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    _controller.clear();
    context.read<MessagesCubit>().sendMessage(content: text);
    _scrollToBottom();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        titleSpacing: 0,
        title: _AppBarTitle(conversation: widget.conversation),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<MessagesCubit, MessagesState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded: (_, __) => _scrollToBottom(),
                  sending: (_, __) => _scrollToBottom(),
                );
              },
              builder: (context, state) => state.when(
                initial: () => const SizedBox.shrink(),
                loading: () => const Center(child: CircularProgressIndicator()),
                loaded: (_, messages) => _MessagesList(
                  messages: messages,
                  scrollController: _scrollController,
                ),
                sending: (_, messages) => _MessagesList(
                  messages: messages,
                  scrollController: _scrollController,
                  isSending: true,
                ),
                failure: (message) => Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.red,
                      ),
                      const SizedBox(height: 12),
                      Text(message),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () =>
                            context.read<MessagesCubit>().loadMessages(
                                  conversation: widget.conversation,
                                ),
                        child: const Text('Tentar novamente'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          _MessageInput(
            controller: _controller,
            focusNode: _focusNode,
            onSend: _sendMessage,
          ),
        ],
      ),
    );
  }
}

class _AppBarTitle extends StatelessWidget {
  const _AppBarTitle({required this.conversation});
  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: const Color(0xFF1A1A2E),
          backgroundImage: conversation.participantAvatarUrl != null
              ? NetworkImage(conversation.participantAvatarUrl!)
              : null,
          child: conversation.participantAvatarUrl == null
              ? Text(
                  conversation.participantName.isNotEmpty
                      ? conversation.participantName[0].toUpperCase()
                      : '?',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white70,
                  ),
                )
              : null,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            conversation.participantName,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 17,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class _MessagesList extends StatelessWidget {
  const _MessagesList({
    required this.messages,
    required this.scrollController,
    this.isSending = false,
  });

  final List<Message> messages;
  final ScrollController scrollController;
  final bool isSending;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty && !isSending) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('👋', style: TextStyle(fontSize: 48)),
            const SizedBox(height: 12),
            Text(
              'Diga olá!',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 4),
            const Text(
              'Seja o primeiro a enviar uma mensagem.',
              style: TextStyle(color: Colors.white38, fontSize: 13),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      controller: scrollController,
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: messages.length + (isSending ? 1 : 0),
      itemBuilder: (context, index) {
        if (isSending && index == messages.length) {
          return const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 20, top: 4, bottom: 4),
              child: SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
            ),
          );
        }
        final msg = messages[index];
        return MessageBubble(
            message: msg, isMe: msg.senderId == 'current-user',);
      },
    );
  }
}

class _MessageInput extends StatelessWidget {
  const _MessageInput({
    required this.controller,
    required this.focusNode,
    required this.onSend,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onSend;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0D0D0D),
        border: Border(top: BorderSide(color: Color(0xFF1A1A2E))),
      ),
      padding: EdgeInsets.only(
        left: 12,
        right: 8,
        top: 8,
        bottom: 8 + MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              maxLines: 4,
              minLines: 1,
              textCapitalization: TextCapitalization.sentences,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                hintText: 'Mensagem...',
                hintStyle: const TextStyle(color: Colors.white38, fontSize: 15),
                filled: true,
                fillColor: const Color(0xFF1A1A2E),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (_) => onSend(),
            ),
          ),
          const SizedBox(width: 8),
          GestureDetector(
            onTap: onSend,
            child: Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                color: Color(0xFF6C63FF),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.send_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
