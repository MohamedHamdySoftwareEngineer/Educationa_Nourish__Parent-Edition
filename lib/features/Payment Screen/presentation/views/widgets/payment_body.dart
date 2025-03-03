import 'package:educational_nourish/core/utils/assets.dart';
import 'package:educational_nourish/core/widgets/base_widgets.dart';
import 'package:educational_nourish/features/Payment%20Screen/presentation/views/widgets/card_number_input_formatter.dart';
import 'package:educational_nourish/features/Payment%20Screen/presentation/views/widgets/header_section.dart';
import 'package:educational_nourish/features/Payment%20Screen/presentation/views/widgets/payment_method_selector.dart';
import 'package:educational_nourish/features/Payment%20Screen/presentation/views/widgets/valid_until_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaymentBody extends StatefulWidget {
  final bool isNavigateFromBody;

  const PaymentBody({super.key, this.isNavigateFromBody = false});

  @override
  State<PaymentBody> createState() => _PaymentBodyState();
}

class _PaymentBodyState extends State<PaymentBody> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _validUntilController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();
  final TextEditingController _cardHolderController = TextEditingController();
  bool _isSaveCardData = false;
  String _selectedPaymentMethod = 'Credit';

  @override
  void dispose() {
    _cardNumberController.dispose();
    _validUntilController.dispose();
    _cvvController.dispose();
    _cardHolderController.dispose();
    super.dispose();
  }

  // Simplified validation
  Map<String, String?> _validateFields() {
    return {
      'cardNumber': _cardNumberController.text.replaceAll(' ', '').length != 16 
          ? 'Enter a valid card number' : null,
      'validUntil': !RegExp(r"^(0[1-9]|1[0-2])\/\d{2}$").hasMatch(_validUntilController.text)
          ? 'Enter a valid date (MM/YY)' : null,
      'cvv': _cvvController.text.length != 3 
          ? 'Enter a valid 3-digit CVV' : null,
      'cardHolder': _cardHolderController.text.isEmpty 
          ? 'Card holder name is required' 
          : (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(_cardHolderController.text)
              ? 'Enter a valid name (letters only)' : null),
    };
  }

  void _onPayButtonPressed() {
    final errors = _validateFields().values.where((error) => error != null);
    
    if (errors.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please correct the errors before proceeding.')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment processing...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidgets(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderSection(),
              const SizedBox(height: 21),
              PaymentMethodSelector(
                selectedMethod: _selectedPaymentMethod,
                onMethodSelected: (method) => setState(() => _selectedPaymentMethod = method),
              ),
              const SizedBox(height: 21),
              _buildCardNumberField(),
              const SizedBox(height: 21),
              _buildCardDetailsRow(),
              const SizedBox(height: 21),
              _buildCardHolderField(),
              const SizedBox(height: 8),
              _buildSaveCardOption(),
              const SizedBox(height: 40),
              _buildPayButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardNumberField() {
    return TextField(
      controller: _cardNumberController,
      decoration: InputDecoration(
        labelText: 'Card number',
        prefixIcon: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Image.asset(masterCardImage, width: 45),
            ),
            const SizedBox(width: 20),
          ],
        ),
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(16),
        CardNumberInputFormatter(),
      ],
    );
  }

  Widget _buildCardDetailsRow() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: _validUntilController,
            decoration: const InputDecoration(
              labelText: 'Valid until (MM/YY)',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4),
              ValidUntilInputFormatter(),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: _cvvController,
            decoration: const InputDecoration(
              labelText: 'CVV',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardHolderField() {
    return TextField(
      controller: _cardHolderController,
      decoration: const InputDecoration(
        labelText: 'Card holder',
        hintText: 'Your name and username',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSaveCardOption() {
    return Row(
      children: [
        const Expanded(
          child: Text('Save card data for future payment', style: TextStyle(fontSize: 16)),
        ),
        Switch(
          value: _isSaveCardData,
          onChanged: (value) => setState(() => _isSaveCardData = value),
        ),
      ],
    );
  }

  Widget _buildPayButton() {
    return GestureDetector(
      onTap: _onPayButtonPressed,
      child: Center(
        child: Container(
          width: 145,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Pay',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
