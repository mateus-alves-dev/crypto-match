import 'package:crypto_match/features/match/domain/entities/match.dart';
import 'package:crypto_match/features/match/presentation/widgets/profile_card.dart';
import 'package:flutter/material.dart';

typedef OnSwiped = void Function(SwipeAction action);

class SwipeCardDeck extends StatefulWidget {
  const SwipeCardDeck({
    required this.suggestions,
    required this.onSwiped,
    super.key,
  });

  final List<MatchSuggestion> suggestions;
  final OnSwiped onSwiped;

  @override
  State<SwipeCardDeck> createState() => _SwipeCardDeckState();
}

class _SwipeCardDeckState extends State<SwipeCardDeck>
    with SingleTickerProviderStateMixin {
  static const _swipeThreshold = 100.0;
  static const _superLikeThreshold = -80.0;

  Offset _drag = Offset.zero;
  bool _isDragging = false;
  late final AnimationController _anim;
  late Animation<Offset> _offsetAnim;

  @override
  void initState() {
    super.initState();
    _anim = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    )
      ..addListener(() => setState(() => _drag = _offsetAnim.value))
      ..addStatusListener((s) {
        if (s == AnimationStatus.completed) {
          setState(() {
            _drag = Offset.zero;
            _isDragging = false;
          });
        }
      });
  }

  @override
  void dispose() {
    _anim.dispose();
    super.dispose();
  }

  void _onPanUpdate(DragUpdateDetails d) => setState(() {
        _isDragging = true;
        _drag += d.delta;
      });

  void _onPanEnd(DragEndDetails _) {
    final dx = _drag.dx;
    final dy = _drag.dy;

    if (dy < _superLikeThreshold && dx.abs() < 60) {
      _fly(const Offset(0, -2000));
      widget.onSwiped(SwipeAction.superLike);
    } else if (dx > _swipeThreshold) {
      _fly(Offset(2000, _drag.dy));
      widget.onSwiped(SwipeAction.like);
    } else if (dx < -_swipeThreshold) {
      _fly(Offset(-2000, _drag.dy));
      widget.onSwiped(SwipeAction.dislike);
    } else {
      _snapBack();
    }
  }

  void _fly(Offset target) {
    _offsetAnim = Tween<Offset>(begin: _drag, end: target).animate(
      CurvedAnimation(parent: _anim, curve: Curves.easeOut),
    );
    _anim.forward(from: 0);
  }

  void _snapBack() {
    _offsetAnim = Tween<Offset>(begin: _drag, end: Offset.zero).animate(
      CurvedAnimation(parent: _anim, curve: Curves.elasticOut),
    );
    _anim.forward(from: 0);
  }

  SwipeIndicator? get _indicator {
    if (!_isDragging || _drag == Offset.zero) return null;
    final dx = _drag.dx;
    final dy = _drag.dy;
    if (dy < _superLikeThreshold && dx.abs() < 60) {
      return SwipeIndicator.superLike;
    }
    if (dx > 40) return SwipeIndicator.like;
    if (dx < -40) return SwipeIndicator.nope;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    if (widget.suggestions.isEmpty) return const SizedBox.shrink();

    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth - 32;
        final h = constraints.maxHeight - 16;

        return SizedBox(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Back card
              if (widget.suggestions.length > 1)
                Positioned(
                  top: 16,
                  child: Transform.scale(
                    scale: 0.95,
                    child: SizedBox(
                      width: w,
                      height: h,
                      child: ProfileCard(suggestion: widget.suggestions[1]),
                    ),
                  ),
                ),

              // Top card (draggable)
              Positioned(
                top: 0,
                child: GestureDetector(
                  onPanUpdate: _onPanUpdate,
                  onPanEnd: _onPanEnd,
                  child: Transform.translate(
                    offset: _drag,
                    child: Transform.rotate(
                      angle: _drag.dx / 600,
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        width: w,
                        height: h,
                        child: ProfileCard(
                          suggestion: widget.suggestions.first,
                          swipeIndicator: _indicator,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
