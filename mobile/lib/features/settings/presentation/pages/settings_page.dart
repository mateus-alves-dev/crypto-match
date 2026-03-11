import 'package:crypto_match/core/router/app_router.dart';
import 'package:crypto_match/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:crypto_match/features/settings/domain/entities/user_settings.dart';
import 'package:crypto_match/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:crypto_match/features/settings/presentation/cubit/settings_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  double _maxDistance = 50;
  RangeValues _ageRange = const RangeValues(18, 50);
  bool _slidersInitialized = false;

  @override
  void initState() {
    super.initState();
    context.read<SettingsCubit>().loadSettings();
  }

  void _initSliders(UserSettings settings) {
    if (_slidersInitialized) return;
    setState(() {
      _maxDistance = settings.matchPreferences.maxDistanceKm.toDouble();
      _ageRange = RangeValues(
        settings.matchPreferences.minAge.toDouble(),
        settings.matchPreferences.maxAge.toDouble(),
      );
      _slidersInitialized = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Configurações',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocConsumer<SettingsCubit, SettingsState>(
        listener: (context, state) {
          state.whenOrNull(
            loaded: _initSliders,
            updateSuccess: _initSliders,
            accountDeleted: () => context.go(AppRoutes.login),
            failure: (message) => ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.redAccent,
                behavior: SnackBarBehavior.floating,
              ),
            ),
          );
        },
        builder: (context, state) => state.when(
          initial: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (settings) => _SettingsContent(
            settings: settings,
            maxDistance: _maxDistance,
            ageRange: _ageRange,
            onMaxDistanceChanged: (v) => setState(() => _maxDistance = v),
            onMaxDistanceChangeEnd: (v) {
              setState(() => _maxDistance = v);
              context.read<SettingsCubit>().updateMatchPreferences(
                    settings.matchPreferences
                        .copyWith(maxDistanceKm: v.round()),
                  );
            },
            onAgeRangeChanged: (v) => setState(() => _ageRange = v),
            onAgeRangeChangeEnd: (v) {
              setState(() => _ageRange = v);
              context.read<SettingsCubit>().updateMatchPreferences(
                    settings.matchPreferences.copyWith(
                      minAge: v.start.round(),
                      maxAge: v.end.round(),
                    ),
                  );
            },
          ),
          updating: (settings) => _SettingsContent(
            settings: settings,
            maxDistance: _maxDistance,
            ageRange: _ageRange,
            isUpdating: true,
            onMaxDistanceChanged: (v) => setState(() => _maxDistance = v),
            onMaxDistanceChangeEnd: (v) {
              setState(() => _maxDistance = v);
              context.read<SettingsCubit>().updateMatchPreferences(
                    settings.matchPreferences
                        .copyWith(maxDistanceKm: v.round()),
                  );
            },
            onAgeRangeChanged: (v) => setState(() => _ageRange = v),
            onAgeRangeChangeEnd: (v) {
              setState(() => _ageRange = v);
              context.read<SettingsCubit>().updateMatchPreferences(
                    settings.matchPreferences.copyWith(
                      minAge: v.start.round(),
                      maxAge: v.end.round(),
                    ),
                  );
            },
          ),
          updateSuccess: (settings) => _SettingsContent(
            settings: settings,
            maxDistance: _maxDistance,
            ageRange: _ageRange,
            onMaxDistanceChanged: (v) => setState(() => _maxDistance = v),
            onMaxDistanceChangeEnd: (v) {
              setState(() => _maxDistance = v);
              context.read<SettingsCubit>().updateMatchPreferences(
                    settings.matchPreferences
                        .copyWith(maxDistanceKm: v.round()),
                  );
            },
            onAgeRangeChanged: (v) => setState(() => _ageRange = v),
            onAgeRangeChangeEnd: (v) {
              setState(() => _ageRange = v);
              context.read<SettingsCubit>().updateMatchPreferences(
                    settings.matchPreferences.copyWith(
                      minAge: v.start.round(),
                      maxAge: v.end.round(),
                    ),
                  );
            },
          ),
          failure: (message) => _ErrorView(
            message: message,
            onRetry: () => context.read<SettingsCubit>().loadSettings(),
          ),
          accountDeleted: () => const SizedBox.shrink(),
        ),
      ),
    );
  }
}

class _SettingsContent extends StatelessWidget {
  const _SettingsContent({
    required this.settings,
    required this.maxDistance,
    required this.ageRange,
    required this.onMaxDistanceChanged,
    required this.onMaxDistanceChangeEnd,
    required this.onAgeRangeChanged,
    required this.onAgeRangeChangeEnd,
    this.isUpdating = false,
  });

  final UserSettings settings;
  final double maxDistance;
  final RangeValues ageRange;
  final ValueChanged<double> onMaxDistanceChanged;
  final ValueChanged<double> onMaxDistanceChangeEnd;
  final ValueChanged<RangeValues> onAgeRangeChanged;
  final ValueChanged<RangeValues> onAgeRangeChangeEnd;
  final bool isUpdating;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildMatchPreferences(context),
              const SizedBox(height: 32),
              _buildNotifications(context),
              const SizedBox(height: 32),
              _buildPrivacy(context),
              const SizedBox(height: 32),
              _buildAccount(context),
            ],
          ),
        ),
        if (isUpdating)
          const Positioned(
            top: 8,
            right: 16,
            child: SizedBox(
              width: 18,
              height: 18,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          ),
      ],
    );
  }

  Widget _buildMatchPreferences(BuildContext context) {
    final prefs = settings.matchPreferences;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Preferências de Match'),
        const SizedBox(height: 16),
        _buildCard(
          children: [
            _SliderTile(
              title: 'Distância máxima',
              subtitle: '${maxDistance.round()} km',
              child: Slider(
                value: maxDistance,
                min: 5,
                max: 200,
                divisions: 39,
                label: '${maxDistance.round()} km',
                activeColor: const Color(0xFF6C63FF),
                onChanged: onMaxDistanceChanged,
                onChangeEnd: onMaxDistanceChangeEnd,
              ),
            ),
            const Divider(height: 1, color: Color(0xFF1A1A2E)),
            _SliderTile(
              title: 'Faixa etária',
              subtitle:
                  '${ageRange.start.round()} – ${ageRange.end.round()} anos',
              child: RangeSlider(
                values: ageRange,
                min: 18,
                max: 70,
                divisions: 52,
                labels: RangeLabels(
                  '${ageRange.start.round()}',
                  '${ageRange.end.round()}',
                ),
                activeColor: const Color(0xFF6C63FF),
                onChanged: onAgeRangeChanged,
                onChangeEnd: onAgeRangeChangeEnd,
              ),
            ),
            const Divider(height: 1, color: Color(0xFF1A1A2E)),
            _SwitchTile(
              title: 'Filtrar por interesses em cripto',
              subtitle: 'Mostrar apenas perfis com interesses similares',
              value: prefs.filterByCryptoInterests,
              onChanged: (v) =>
                  context.read<SettingsCubit>().updateMatchPreferences(
                        prefs.copyWith(filterByCryptoInterests: v),
                      ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildNotifications(BuildContext context) {
    final notif = settings.notificationSettings;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Notificações'),
        const SizedBox(height: 16),
        _buildCard(
          children: [
            _SwitchTile(
              title: 'Novos matches',
              subtitle: 'Notificar quando der match com alguém',
              value: notif.newMatches,
              onChanged: (v) =>
                  context.read<SettingsCubit>().updateNotificationSettings(
                        notif.copyWith(newMatches: v),
                      ),
            ),
            const Divider(height: 1, color: Color(0xFF1A1A2E)),
            _SwitchTile(
              title: 'Novas mensagens',
              subtitle: 'Notificar ao receber uma mensagem',
              value: notif.newMessages,
              onChanged: (v) =>
                  context.read<SettingsCubit>().updateNotificationSettings(
                        notif.copyWith(newMessages: v),
                      ),
            ),
            const Divider(height: 1, color: Color(0xFF1A1A2E)),
            _SwitchTile(
              title: 'Recompensas de token',
              subtitle: 'Notificar ao ganhar tokens',
              value: notif.tokenRewards,
              onChanged: (v) =>
                  context.read<SettingsCubit>().updateNotificationSettings(
                        notif.copyWith(tokenRewards: v),
                      ),
            ),
            const Divider(height: 1, color: Color(0xFF1A1A2E)),
            _SwitchTile(
              title: 'Atualizações do app',
              subtitle: 'Novidades e melhorias do CryptoMatch',
              value: notif.appUpdates,
              onChanged: (v) =>
                  context.read<SettingsCubit>().updateNotificationSettings(
                        notif.copyWith(appUpdates: v),
                      ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPrivacy(BuildContext context) {
    final privacy = settings.privacySettings;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Privacidade'),
        const SizedBox(height: 16),
        _buildCard(
          children: [
            _SwitchTile(
              title: 'Mostrar status online',
              subtitle: 'Outros usuários podem ver quando você está online',
              value: privacy.showOnlineStatus,
              onChanged: (v) =>
                  context.read<SettingsCubit>().updatePrivacySettings(
                        privacy.copyWith(showOnlineStatus: v),
                      ),
            ),
            const Divider(height: 1, color: Color(0xFF1A1A2E)),
            _SwitchTile(
              title: 'Mostrar distância',
              subtitle: 'Exibir sua distância aproximada no perfil',
              value: privacy.showDistance,
              onChanged: (v) =>
                  context.read<SettingsCubit>().updatePrivacySettings(
                        privacy.copyWith(showDistance: v),
                      ),
            ),
            const Divider(height: 1, color: Color(0xFF1A1A2E)),
            _SwitchTile(
              title: 'Perfil visível',
              subtitle: 'Aparecer no feed de busca de outros usuários',
              value: privacy.profileVisible,
              onChanged: (v) =>
                  context.read<SettingsCubit>().updatePrivacySettings(
                        privacy.copyWith(profileVisible: v),
                      ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAccount(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _SectionLabel('Conta'),
        const SizedBox(height: 16),
        _buildCard(
          children: [
            _ActionTile(
              icon: Icons.logout_rounded,
              title: 'Sair',
              onTap: () {
                context.read<AuthCubit>().logout();
                context.go(AppRoutes.login);
              },
            ),
            const Divider(height: 1, color: Color(0xFF1A1A2E)),
            _ActionTile(
              icon: Icons.delete_outline_rounded,
              iconColor: Colors.redAccent,
              title: 'Excluir conta',
              titleColor: Colors.redAccent,
              onTap: () => _showDeleteDialog(context),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildCard({required List<Widget> children}) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: const Color(0xFF1A1A2E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Excluir conta',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        content: const Text(
          'Esta ação é irreversível. Todos os seus dados, matches e tokens serão permanentemente apagados.',
          style: TextStyle(color: Colors.white70, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<SettingsCubit>().deleteAccount();
            },
            style: TextButton.styleFrom(
              foregroundColor: Colors.redAccent,
            ),
            child: const Text('Excluir'),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────── Shared Widgets ────────────────────────────────

class _SectionLabel extends StatelessWidget {
  const _SectionLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: const TextStyle(
        color: Color(0xFF6C63FF),
        fontSize: 12,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
      ),
    );
  }
}

class _SwitchTile extends StatelessWidget {
  const _SwitchTile({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF6C63FF),
          ),
        ],
      ),
    );
  }
}

class _SliderTile extends StatelessWidget {
  const _SliderTile({
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  color: Color(0xFF6C63FF),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          child,
        ],
      ),
    );
  }
}

class _ActionTile extends StatelessWidget {
  const _ActionTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.iconColor,
    this.titleColor,
  });

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(icon, color: iconColor ?? Colors.white70, size: 20),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: titleColor ?? Colors.white,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.chevron_right_rounded,
              color: iconColor ?? Colors.white38,
              size: 20,
            ),
          ],
        ),
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
          const Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
          const SizedBox(height: 12),
          Text(message, textAlign: TextAlign.center),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onRetry,
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}
