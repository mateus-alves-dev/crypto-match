import 'package:crypto_match/core/router/app_router.dart';
import 'package:crypto_match/features/chat/domain/entities/message.dart';
import 'package:crypto_match/features/chat/presentation/cubit/conversations_cubit.dart';
import 'package:crypto_match/features/chat/presentation/cubit/conversations_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ConversationsPage extends StatefulWidget {
  const ConversationsPage({super.key});

  @override
  State<ConversationsPage> createState() => _ConversationsPageState();
}

class _ConversationsPageState extends State<ConversationsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ConversationsCubit>().loadConversations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mensagens',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        leading: const BackButton(),
      ),
      body: BlocBuilder<ConversationsCubit, ConversationsState>(
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const _LoadingView(),
          loaded: (conversations) => conversations.isEmpty
              ? const _EmptyView()
              : _ConversationsList(conversations: conversations),
          failure: (message) => _ErrorView(
            message: message,
            onRetry: () =>
                context.read<ConversationsCubit>().loadConversations(),
          ),
        ),
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text('Carregando conversas...'),
        ],
      ),
    );
  }
}

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('💬', style: TextStyle(fontSize: 64)),
          const SizedBox(height: 16),
          Text(
            'Nenhuma conversa ainda',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          const Text(
            'Seus matches aparecerão aqui quando vocês iniciarem uma conversa.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white54),
          ),
        ],
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});
  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 12),
          Text(message),
          const SizedBox(height: 16),
          ElevatedButton(
              onPressed: onRetry, child: const Text('Tentar novamente'),),
        ],
      ),
    );
  }
}

class _ConversationsList extends StatelessWidget {
  const _ConversationsList({required this.conversations});
  final List<Conversation> conversations;

  @override
  Widget build(BuildContext context) {
    final totalUnread = conversations.fold(
      0,
      (sum, c) => sum + (c.unreadCount ?? 0),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
          child: Text(
            totalUnread > 0
                ? '$totalUnread não lida${totalUnread == 1 ? '' : 's'}'
                : '${conversations.length} conversa${conversations.length == 1 ? '' : 's'}',
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: Colors.white38,
                  letterSpacing: 0.5,
                ),
          ),
        ),
        const Divider(height: 1, color: Color(0xFF1A1A2E)),
        Expanded(
          child: ListView.separated(
            itemCount: conversations.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, color: Color(0xFF1A1A2E)),
            itemBuilder: (context, index) {
              final conv = conversations[index];
              return _ConversationTile(
                conversation: conv,
                onTap: () => context.push(
                  AppRoutes.chat(conv.id),
                  extra: conv,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _ConversationTile extends StatelessWidget {
  const _ConversationTile({required this.conversation, required this.onTap});
  final Conversation conversation;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasUnread = (conversation.unreadCount ?? 0) > 0;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
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
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conversation.participantName,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    conversation.lastMessage ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: hasUnread ? Colors.white70 : Colors.white38,
                      fontWeight:
                          hasUnread ? FontWeight.w500 : FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  _formatDate(conversation.lastMessageAt),
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: hasUnread ? const Color(0xFF6C63FF) : Colors.white38,
                  ),
                ),
                const SizedBox(height: 4),
                if (hasUnread)
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Color(0xFF6C63FF),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '${conversation.unreadCount}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                else
                  const SizedBox(width: 20, height: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime? date) {
    if (date == null) return '';
    final now = DateTime.now();
    final diff = now.difference(date);
    if (diff.inDays == 0) {
      final h = date.hour.toString().padLeft(2, '0');
      final m = date.minute.toString().padLeft(2, '0');
      return '$h:$m';
    }
    if (diff.inDays == 1) return 'Ontem';
    final day = date.day.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    return '$day/$month';
  }
}
