import 'package:crypto_match/features/profile/domain/entities/profile.dart';
import 'package:crypto_match/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:crypto_match/features/profile/presentation/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// All crypto options available for selection
const _kAllCryptos = [
  'Bitcoin',
  'Ethereum',
  'Solana',
  'Lightning Network',
  'DeFi',
  'NFTs',
  'DAOs',
  'Web3',
  'Layer 2',
  'Optimism',
  'Arbitrum',
  'ZK Rollups',
  'Polygon',
  'Avalanche',
  'Cosmos',
  'Polkadot',
  'Stablecoins',
  'Self-custody',
  'Trading',
  'On-chain analysis',
  'Solidity',
  'Creator Economy',
  'Base',
  'Generative Art',
];

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({required this.profile, super.key});

  final Profile profile;

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  late final TextEditingController _nameController;
  late final TextEditingController _bioController;
  late final TextEditingController _locationController;
  late final TextEditingController _ageController;
  late List<String> _selectedInterests;

  @override
  void initState() {
    super.initState();
    final p = widget.profile;
    _nameController = TextEditingController(text: p.displayName);
    _bioController = TextEditingController(text: p.bio ?? '');
    _locationController = TextEditingController(text: p.location ?? '');
    _ageController =
        TextEditingController(text: p.age != null ? '${p.age}' : '');
    _selectedInterests = List<String>.from(p.cryptoInterests ?? []);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _bioController.dispose();
    _locationController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _save() {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('O nome não pode estar vazio.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }
    context.read<ProfileCubit>().updateProfile(
          displayName: name,
          bio: _bioController.text.trim().isEmpty
              ? null
              : _bioController.text.trim(),
          cryptoInterests:
              _selectedInterests.isEmpty ? null : _selectedInterests,
          age: int.tryParse(_ageController.text.trim()),
          location: _locationController.text.trim().isEmpty
              ? null
              : _locationController.text.trim(),
        );
  }

  void _toggleInterest(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          updateSuccess: (_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Perfil atualizado com sucesso! ✅'),
                behavior: SnackBarBehavior.floating,
              ),
            );
            Navigator.of(context).pop();
          },
          failure: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(message),
                backgroundColor: Colors.red,
                behavior: SnackBarBehavior.floating,
              ),
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
          centerTitle: true,
          title: const Text(
            'Editar Perfil',
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          actions: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                final isLoading = state.maybeWhen(
                  updating: (_) => true,
                  orElse: () => false,
                );
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: isLoading
                      ? const Center(
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          ),
                        )
                      : TextButton(
                          onPressed: _save,
                          child: const Text(
                            'Salvar',
                            style: TextStyle(
                              color: Color(0xFF6C63FF),
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                        ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AvatarSection(profile: widget.profile),
              const SizedBox(height: 28),
              const _SectionLabel('Sobre você'),
              const SizedBox(height: 12),
              _Field(
                label: 'Nome de exibição *',
                controller: _nameController,
                hint: 'Como você quer ser chamado?',
              ),
              const SizedBox(height: 16),
              _Field(
                label: 'Bio',
                controller: _bioController,
                hint: 'Fale sobre você e sua relação com cripto...',
                maxLines: 3,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: _Field(
                      label: 'Idade',
                      controller: _ageController,
                      hint: 'Ex: 28',
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _Field(
                      label: 'Localização',
                      controller: _locationController,
                      hint: 'Cidade, País',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              const _SectionLabel('Interesses em Cripto'),
              const SizedBox(height: 4),
              Text(
                '${_selectedInterests.length} selecionado${_selectedInterests.length == 1 ? '' : 's'}',
                style: const TextStyle(color: Colors.white38, fontSize: 13),
              ),
              const SizedBox(height: 12),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _kAllCryptos.map((crypto) {
                  final selected = _selectedInterests.contains(crypto);
                  return GestureDetector(
                    onTap: () => _toggleInterest(crypto),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF6C63FF)
                            : const Color(0xFF1A1A2E),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: selected
                              ? const Color(0xFF6C63FF)
                              : Colors.white12,
                        ),
                      ),
                      child: Text(
                        crypto,
                        style: TextStyle(
                          color: selected ? Colors.white : Colors.white60,
                          fontSize: 13,
                          fontWeight:
                              selected ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class _AvatarSection extends StatelessWidget {
  const _AvatarSection({required this.profile});
  final Profile profile;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 52,
            backgroundColor: const Color(0xFF1A1A2E),
            backgroundImage: profile.avatarUrl != null
                ? NetworkImage(profile.avatarUrl!)
                : null,
            child: profile.avatarUrl == null
                ? Text(
                    profile.displayName.isNotEmpty
                        ? profile.displayName[0].toUpperCase()
                        : '?',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                    ),
                  )
                : null,
          ),
          Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFF6C63FF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.camera_alt_rounded,
              size: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

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

class _Field extends StatelessWidget {
  const _Field({
    required this.label,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType,
  });

  final String label;
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white24, fontSize: 14),
            filled: true,
            fillColor: const Color(0xFF1A1A2E),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide:
                  const BorderSide(color: Color(0xFF6C63FF), width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
