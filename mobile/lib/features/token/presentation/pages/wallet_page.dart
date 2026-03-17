import 'package:crypto_match/core/router/app_router.dart';
import 'package:crypto_match/features/token/presentation/cubit/token_cubit.dart';
import 'package:crypto_match/features/token/presentation/cubit/token_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();
    context.read<TokenCubit>().loadWallet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wallet'),
        actions: [
          IconButton(
            icon: const Icon(Icons.leaderboard_rounded),
            tooltip: 'Leaderboard',
            onPressed: () => context.push(AppRoutes.leaderboard),
          ),
        ],
      ),
      body: BlocBuilder<TokenCubit, TokenState>(
        builder: (BuildContext context, TokenState state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (balance, history) => Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      children: [
                        Text(
                          'Balance',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '${balance.balance.toStringAsFixed(2)} CMT',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton.icon(
                onPressed: () => context.push(AppRoutes.rewards),
                icon: const Icon(Icons.bolt_rounded),
                label: const Text('Ganhar Tokens'),
              ),
              const SizedBox(height: 8),
              OutlinedButton.icon(
                onPressed: () => context.push(AppRoutes.missions),
                icon: const Icon(Icons.flag_rounded),
                label: const Text('Missões Diárias'),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (BuildContext context, int index) {
                    final tx = history[index];
                    return ListTile(
                      leading: Icon(
                        tx.type.name == 'credit'
                            ? Icons.arrow_downward
                            : Icons.arrow_upward,
                        color: tx.type.name == 'credit'
                            ? Colors.green
                            : Colors.red,
                      ),
                      title: Text(tx.reason),
                      trailing: Text(
                        '${tx.type.name == 'credit' ? '+' : '-'}${tx.amount}',
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          failure: (message) => Center(child: Text(message)),
        ),
      ),
    );
  }
}
