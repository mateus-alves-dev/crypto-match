import 'package:crypto_match/features/profile/domain/entities/crypto_persona.dart';
import 'package:flutter/material.dart';

class PersonaTagPicker extends StatelessWidget {
  const PersonaTagPicker({
    required this.selectedTags,
    required this.onChanged,
    super.key,
  });

  final List<String> selectedTags;
  final ValueChanged<List<String>> onChanged;

  void _toggle(String key) {
    final updated = List<String>.from(selectedTags);
    if (updated.contains(key)) {
      updated.remove(key);
    } else if (updated.length < CryptoPersona.maxSelectable) {
      updated.add(key);
    }
    onChanged(updated);
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: CryptoPersona.all.map((persona) {
        final selected = selectedTags.contains(persona.key);
        final atMax = selectedTags.length >= CryptoPersona.maxSelectable;
        final disabled = !selected && atMax;

        return FilterChip(
          label: Text(persona.label),
          selected: selected,
          onSelected: disabled ? null : (_) => _toggle(persona.key),
          selectedColor: const Color(0xFFFFB74D).withValues(alpha: 0.25),
          checkmarkColor: const Color(0xFFFFB74D),
          labelStyle: TextStyle(
            color: selected
                ? const Color(0xFFFFB74D)
                : disabled
                    ? Colors.white24
                    : Colors.white70,
            fontSize: 13,
            fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
          ),
          side: BorderSide(
            color: selected
                ? const Color(0xFFFFB74D)
                : disabled
                    ? Colors.white12
                    : Colors.white24,
          ),
          backgroundColor: const Color(0xFF1A1A2E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        );
      }).toList(),
    );
  }
}
