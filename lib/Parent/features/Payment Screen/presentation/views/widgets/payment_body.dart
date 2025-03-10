import 'package:educational_nourish/Parent/core/utils/assets.dart';
import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';
import 'package:educational_nourish/Parent/features/Payment%20Screen/presentation/views/widgets/card_number_input_formatter.dart';
import 'package:educational_nourish/Parent/features/Payment%20Screen/presentation/views/widgets/header_section.dart';
import 'package:educational_nourish/Parent/features/Payment%20Screen/presentation/views/widgets/payment_method_selector.dart';
import 'package:educational_nourish/Parent/features/Payment%20Screen/presentation/views/widgets/valid_until_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../constants.dart';

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

  // Color scheme
  final Color primaryBlue = Colors.blue;
  final Color lightBlue = Colors.blue.shade50;
  final Color darkBlue = Colors.blue.shade800;
  final Color textColor = Colors.grey.shade800;

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
          ? 'Enter a valid card number'
          : null,
      'validUntil': !RegExp(r"^(0[1-9]|1[0-2])\/\d{2}$")
              .hasMatch(_validUntilController.text)
          ? 'Enter a valid date (MM/YY)'
          : null,
      'cvv':
          _cvvController.text.length != 3 ? 'Enter a valid 3-digit CVV' : null,
      'cardHolder': _cardHolderController.text.isEmpty
          ? 'Card holder name is required'
          : (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(_cardHolderController.text)
              ? 'Enter a valid name (letters only)'
              : null),
    };
  }

  void _onPayButtonPressed() {
    final errors = _validateFields().values.where((error) => error != null);

    if (errors.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Please correct the errors before proceeding.'),
          backgroundColor: Colors.red.shade400,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Row(
            children: [
              SizedBox(
                width: 20, 
                height: 20, 
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
              SizedBox(width: 12),
              Text('Processing payment...'),
            ],
          ),
          backgroundColor: darkBlue,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const HeaderSection(),
              const SizedBox(height: 24),
              PaymentMethodSelector(
                selectedMethod: _selectedPaymentMethod,
                onMethodSelected: (method) =>
                    setState(() => _selectedPaymentMethod = method),
              ),
              const SizedBox(height: 28),
              _buildCardNumberField(),
              const SizedBox(height: 24),
              _buildCardDetailsRow(),
              const SizedBox(height: 24),
              _buildCardHolderField(),
              const SizedBox(height: 16),
              _buildSaveCardOption(),
              const SizedBox(height: 48),
              _buildPayButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card number',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _cardNumberController,
            decoration: InputDecoration(
              hintText: '1234 5678 9012 3456',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Image.asset(masterCardImage, width: 32, height: 32),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
            ),
            style: TextStyle(fontSize: 16, color: textColor),
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberInputFormatter(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardDetailsRow() {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Valid until',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _validUntilController,
                  decoration: InputDecoration(
                    hintText: 'MM/YY',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                  style: TextStyle(fontSize: 16, color: textColor),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    ValidUntilInputFormatter(),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'CVV',
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _cvvController,
                  decoration: InputDecoration(
                    hintText: '123',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  ),
                  style: TextStyle(fontSize: 16, color: textColor),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                  obscureText: true,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCardHolderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Card holder',
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _cardHolderController,
            decoration: InputDecoration(
              hintText: 'Your name as shown on card',
              hintStyle: TextStyle(color: Colors.grey.shade400),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            style: TextStyle(fontSize: 16, color: textColor),
            textCapitalization: TextCapitalization.words,
          ),
        ),
      ],
    );
  }

  Widget _buildSaveCardOption() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: lightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Expanded(
            child: Text(
              'Save card data for future payment',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ),
          Switch(
            value: _isSaveCardData,
            onChanged: (value) => setState(() => _isSaveCardData = value),
            activeColor: primaryBlue,
          ),
        ],
      ),
    );
  }

  Widget _buildPayButton() {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: primaryBlue.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: _onPayButtonPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlue,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          'Pay Now',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
      ),
    );
  }
}