import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gutter/flutter_gutter.dart';
import 'package:pinput/pinput.dart';

import '../../../../../../core/constants/colors.dart';
import '../../../view_models/otp_verification_state.dart';

/// Interactive 6-digit OTP slots input powered by [Pinput].
class OtpSlotsInput extends StatefulWidget {
  /// The current OTP string entered by the user.
  final String code;

  /// Callback emitted whenever the user modifies the OTP value.
  final ValueChanged<String> onCodeChanged;

  /// Callback triggered when all slots have been filled.
  final VoidCallback? onCompleted;

  /// Whether the input fields are active for user interaction.
  final bool enabled;

  const OtpSlotsInput({
    super.key,
    required this.code,
    required this.onCodeChanged,
    this.onCompleted,
    this.enabled = true,
  });

  @override
  State<OtpSlotsInput> createState() => _OtpSlotsInputState();
}

class _OtpSlotsInputState extends State<OtpSlotsInput> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _isSynchronizingController = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.code);
    _focusNode = FocusNode();
  }

  @override
  void didUpdateWidget(covariant OtpSlotsInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.code != _controller.text) {
      _isSynchronizingController = true;
      try {
        _controller.value = TextEditingValue(
          text: widget.code,
          selection: TextSelection.collapsed(offset: widget.code.length),
        );
      } finally {
        _isSynchronizingController = false;
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [_buildHeader(), const Gutter.small(), _buildPinput()],
    );
  }

  /// Builds the informational header row showing the field title and digit count.
  Widget _buildHeader() {
    return const Wrap(
      alignment: WrapAlignment.spaceBetween,
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 8,
      runSpacing: 4,
      children: [
        Text(
          'الرمز الرقمي السريع (OTP)',
          style: TextStyle(fontSize: 12, color: AppColors.onSurfaceMuted),
        ),
        Text(
          '6 خانات',
          style: TextStyle(
            fontFamily: 'Manrope',
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.primary,
          ),
        ),
      ],
    );
  }

  /// Creates and configures the [Pinput] widget with responsive industrial themes.
  Widget _buildPinput() {
    final defaultPinTheme = PinTheme(
      width: 52,
      height: 56,
      textStyle: const TextStyle(
        fontFamily: 'Manrope',
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: AppColors.ink,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary, width: 2),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0C00439B),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: BoxDecoration(
        color: AppColors.surfaceMuted,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.outline.withAlpha(80)),
        boxShadow: const [
          BoxShadow(
            color: Color(0x06000000),
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
    );

    return Directionality(
      textDirection: TextDirection.ltr,
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Material(
            type: MaterialType.transparency,
            child: Pinput(
              length: OtpVerificationState.maxDigits,
              controller: _controller,
              focusNode: _focusNode,
              enabled: widget.enabled,
              autofocus: true,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              separatorBuilder: (index) => const SizedBox(width: 8),
              onChanged: (value) {
                if (!_isSynchronizingController) {
                  widget.onCodeChanged(value);
                }
              },
              onCompleted: (_) => widget.onCompleted?.call(),
            ),
          ),
        ),
      ),
    );
  }
}
