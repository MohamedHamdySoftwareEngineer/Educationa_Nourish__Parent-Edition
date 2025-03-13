import 'package:educational_nourish/Parent/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatefulWidget {
  const HeaderSection({super.key});

  @override
  State<HeaderSection> createState() => _HeaderSectionState();
}

class _HeaderSectionState extends State<HeaderSection> {
  double _amount = 0.0;
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateAmount);
  }

  void _updateAmount() {
    final newAmount = double.tryParse(_controller.text);
    if (newAmount != null && newAmount >= 0) {
      setState(() => _amount = newAmount);
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Center(
          child: Text(
            'Payment data',
            style: textBold28,
          ),
        ),
        const SizedBox(height: 30),
        const Text(
          'Enter a total amount:',
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _controller,
          focusNode: _focusNode,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          decoration: InputDecoration(
            prefixText: '\$',
            border: const OutlineInputBorder(),
            hintText: '0.00',
            hintStyle: TextStyle(
              color: Colors.grey[400],
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          textInputAction: TextInputAction.done,
        ),
        const SizedBox(height: 21),
        const Text(
          'Payment method',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}