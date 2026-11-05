import 'package:easy_four_diy/core/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildInputRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Function(String)? onChanged;
  const BuildInputRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InputRow(
      icon: icon,
      label: label,
      value: value,
      onChanged: onChanged,
    );
  }
}

class InputRow extends StatefulWidget {
  final IconData icon;
  final String label;
  final String value;
  final Function(String)? onChanged;

  const InputRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    this.onChanged,
  });

  @override
  State<InputRow> createState() => _InputRowState();
}

class _InputRowState extends State<InputRow> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // Auto-select all text when focused so tapping allows replacing immediately
      _controller.selection = TextSelection(
        baseOffset: 0,
        extentOffset: _controller.text.length,
      );
    } else {
      // Restore formatted value if empty when focus is lost
      if (_controller.text.trim().isEmpty) {
        _controller.text = widget.value;
      }
    }
  }

  @override
  void didUpdateWidget(InputRow oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sync controller if external value changed and field is not currently focused
    if (widget.value != oldWidget.value &&
        !_focusNode.hasFocus &&
        widget.value != _controller.text) {
      _controller.text = widget.value;
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditable = widget.onChanged != null;
    return Row(
      children: [
        Icon(widget.icon, color: Utils.kDarkBlue, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            widget.label,
            style: Utils.getTextStyle(
              baseSize: 14,
              isBold: false,
              color: Colors.black87,
            ),
          ),
        ),
        Container(
          width: 130,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
          decoration: BoxDecoration(
            color: isEditable
                ? Utils.kDarkBlue.withValues(alpha: 0.05)
                : Utils.kLightGrey.withValues(alpha: 0.5),
            border: isEditable
                ? Border.all(color: Utils.kDarkBlue.withValues(alpha: 0.3))
                : null,
            borderRadius: BorderRadius.circular(8),
          ),
          child: isEditable
              ? TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
                    _SingleDecimalSeparatorFormatter(),
                  ],
                  textAlign: TextAlign.end,
                  style: Utils.getTextStyle(
                    baseSize: 13,
                    isBold: true,
                    color: Colors.black87,
                  ),
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                  ),
                  onChanged: widget.onChanged,
                )
              : Text(
                  widget.value,
                  textAlign: TextAlign.end,
                  style: Utils.getTextStyle(
                    baseSize: 13,
                    isBold: true,
                    color: Colors.black87,
                  ),
                ),
        ),
      ],
    );
  }
}

class _SingleDecimalSeparatorFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    final count = text.split('').where((c) => c == '.' || c == ',').length;
    if (count > 1) {
      return oldValue;
    }
    return newValue;
  }
}
