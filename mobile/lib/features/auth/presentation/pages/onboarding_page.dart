import 'package:crypto_match/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:crypto_match/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:crypto_match/features/profile/presentation/cubit/profile_state.dart';
import 'package:crypto_match/features/profile/presentation/widgets/persona_tag_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _pageController = PageController();
  int _currentStep = 0;

  // Step 0 — basic info
  final _nameController = TextEditingController();
  final _bioController = TextEditingController();
  final _ageController = TextEditingController();
  final _locationController = TextEditingController();

  // Step 1 — interests
  final List<String> _selectedInterests = [];

  // Step 2 — persona
  List<String> _selectedPersonaTags = [];

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _bioController.dispose();
    _ageController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => _currentStep++);
  }

  void _skipToNext() => _nextPage();

  bool _validateStep0() {
    if (_nameController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Por favor, insira seu nome.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
      return false;
    }
    return true;
  }

  void _finish() {
    context.read<ProfileCubit>().updateProfile(
          displayName: _nameController.text.trim(),
          bio: _bioController.text.trim().isEmpty
              ? null
              : _bioController.text.trim(),
          age: int.tryParse(_ageController.text.trim()),
          location: _locationController.text.trim().isEmpty
              ? null
              : _locationController.text.trim(),
          cryptoInterests:
              _selectedInterests.isEmpty ? null : _selectedInterests,
          personaTags:
              _selectedPersonaTags.isEmpty ? null : _selectedPersonaTags,
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        state.whenOrNull(
          updateSuccess: (_) => context.read<AuthCubit>().completeOnboarding(),
          failure: (message) => ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
              behavior: SnackBarBehavior.floating,
            ),
          ),
        );
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              _StepIndicator(currentStep: _currentStep, totalSteps: 3),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _Step0BasicInfo(
                      nameController: _nameController,
                      bioController: _bioController,
                      ageController: _ageController,
                      locationController: _locationController,
                      onContinue: () {
                        if (_validateStep0()) _nextPage();
                      },
                    ),
                    _Step1Interests(
                      selectedInterests: _selectedInterests,
                      onToggle: (interest) {
                        setState(() {
                          if (_selectedInterests.contains(interest)) {
                            _selectedInterests.remove(interest);
                          } else {
                            _selectedInterests.add(interest);
                          }
                        });
                      },
                      onContinue: _nextPage,
                      onSkip: _skipToNext,
                    ),
                    _Step2Persona(
                      selectedTags: _selectedPersonaTags,
                      onChanged: (tags) =>
                          setState(() => _selectedPersonaTags = tags),
                      onFinish: _finish,
                      onSkip: _finish,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────── Step indicator ───────────────────────────

class _StepIndicator extends StatelessWidget {
  const _StepIndicator({required this.currentStep, required this.totalSteps});

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: List.generate(totalSteps, (index) {
          final isActive = index <= currentStep;
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(left: index == 0 ? 0 : 6),
              height: 4,
              decoration: BoxDecoration(
                color: isActive
                    ? const Color(0xFF6C63FF)
                    : const Color(0xFF1A1A2E),
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }
}

// ─────────────────────────── Step 0: Basic info ───────────────────────────

class _Step0BasicInfo extends StatelessWidget {
  const _Step0BasicInfo({
    required this.nameController,
    required this.bioController,
    required this.ageController,
    required this.locationController,
    required this.onContinue,
  });

  final TextEditingController nameController;
  final TextEditingController bioController;
  final TextEditingController ageController;
  final TextEditingController locationController;
  final VoidCallback onContinue;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 32),
          Text(
            'Bem-vindo! 👋',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w800,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          const Text(
            'Vamos criar seu perfil',
            style: TextStyle(color: Colors.white54, fontSize: 15),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36),
          _OnboardingField(
            label: 'Nome de exibição *',
            controller: nameController,
            hint: 'Como você quer ser chamado?',
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 16),
          _OnboardingField(
            label: 'Bio',
            controller: bioController,
            hint: 'Fale sobre você e sua relação com cripto...',
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _OnboardingField(
                  label: 'Idade',
                  controller: ageController,
                  hint: 'Ex: 28',
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _OnboardingField(
                  label: 'Localização',
                  controller: locationController,
                  hint: 'Cidade, País',
                ),
              ),
            ],
          ),
          const SizedBox(height: 36),
          ElevatedButton(
            onPressed: onContinue,
            child: const Text('Continuar'),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

// ─────────────────────────── Step 1: Interests ───────────────────────────

class _Step1Interests extends StatelessWidget {
  const _Step1Interests({
    required this.selectedInterests,
    required this.onToggle,
    required this.onContinue,
    required this.onSkip,
  });

  final List<String> selectedInterests;
  final void Function(String) onToggle;
  final VoidCallback onContinue;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Seus interesses',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 6),
              Text(
                '${selectedInterests.length} selecionado${selectedInterests.length == 1 ? '' : 's'}',
                style: const TextStyle(color: Colors.white38, fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _kAllCryptos.map((crypto) {
                final selected = selectedInterests.contains(crypto);
                return GestureDetector(
                  onTap: () => onToggle(crypto),
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
                        color:
                            selected ? const Color(0xFF6C63FF) : Colors.white12,
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
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ElevatedButton(
                onPressed: onContinue,
                child: const Text('Continuar'),
              ),
              const SizedBox(height: 8),
              TextButton(
                onPressed: onSkip,
                child: const Text(
                  'Pular',
                  style: TextStyle(color: Colors.white38),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────── Step 2: Persona ───────────────────────────

class _Step2Persona extends StatelessWidget {
  const _Step2Persona({
    required this.selectedTags,
    required this.onChanged,
    required this.onFinish,
    required this.onSkip,
  });

  final List<String> selectedTags;
  final void Function(List<String>) onChanged;
  final VoidCallback onFinish;
  final VoidCallback onSkip;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        final isSaving = state.maybeWhen(
          updating: (_) => true,
          orElse: () => false,
        );
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sua identidade cripto',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w800,
                        ),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Escolha até 3 personas que combinam com você',
                    style: TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: PersonaTagPicker(
                  selectedTags: selectedTags,
                  onChanged: onChanged,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    onPressed: isSaving ? null : onFinish,
                    child: isSaving
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Text('Entrar no CryptoMatch 🚀'),
                  ),
                  const SizedBox(height: 8),
                  TextButton(
                    onPressed: isSaving ? null : onSkip,
                    child: const Text(
                      'Pular',
                      style: TextStyle(color: Colors.white38),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

// ─────────────────────────── Shared field widget ───────────────────────────

class _OnboardingField extends StatelessWidget {
  const _OnboardingField({
    required this.label,
    required this.controller,
    required this.hint,
    this.maxLines = 1,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
  });

  final String label;
  final TextEditingController controller;
  final String hint;
  final int maxLines;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;

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
          textCapitalization: textCapitalization,
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
