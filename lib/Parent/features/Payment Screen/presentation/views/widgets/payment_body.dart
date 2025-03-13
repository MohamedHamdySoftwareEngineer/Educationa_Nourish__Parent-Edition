import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:educational_nourish/Parent/core/widgets/base_scaffold.dart';
import 'package:educational_nourish/Parent/features/Payment%20Screen/presentation/views/widgets/card_number_input_formatter.dart';
import 'package:educational_nourish/Parent/features/Payment%20Screen/presentation/views/widgets/valid_until_input_formatter.dart';

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
  final TextEditingController _amountController = TextEditingController();
  int _selectedPaymentMethodIndex = 0;
  bool _isSaveCardData = false;
  double _amount = 0.0;

  // Enhanced color scheme
  final Color primaryColor = const Color(0xFF4A6FFF);
  final Color secondaryColor = const Color(0xFF8C9EFF);
  final Color backgroundColor = const Color(0xFFF8F9FF);
  final Color textColor = const Color(0xFF2A2D3E);
  final Color lightGrey = const Color(0xFFEEF1F7);
  final Color darkGrey = const Color(0xFF9CA3AF);
  final Color accentColor = const Color(0xFF6B5BDC);

  // Payment methods list
  final List<Map<String, dynamic>> paymentMethods = [
    {'name': 'Credit Card', 'icon': Icons.credit_card},
    {'name': 'PayPal', 'icon': Icons.account_balance_wallet},
    {'name': 'Apple Pay', 'icon': Icons.apple},
    {'name': 'Google Pay', 'icon': Icons.g_mobiledata},
  ];

  @override
  void initState() {
    super.initState();
    _amountController.addListener(_updateAmount);
  }

  void _updateAmount() {
    final newAmount = double.tryParse(_amountController.text);
    if (newAmount != null && newAmount >= 0) {
      setState(() => _amount = newAmount);
    }
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _validUntilController.dispose();
    _cvvController.dispose();
    _cardHolderController.dispose();
    _amountController.dispose();
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
      'amount': _amount <= 0 ? 'Please enter a valid amount' : null,
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
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(12),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Container(
                width: 24,
                height: 24,
                padding: const EdgeInsets.all(2),
                child: const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                'Processing payment...',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          backgroundColor: primaryColor,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(12),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      child: SingleChildScrollView(
       physics: const ClampingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeader(),
              const SizedBox(height: 32),
              _buildAmountSection(),
              const SizedBox(height: 32),
              // _buildPaymentMethodSection(),
              // const SizedBox(height: 32),
              _buildCardDetailsForm(),
              const SizedBox(height: 48),
              _buildPayButton(),
              const SizedBox(height: 32),
              _buildSecurePaymentNote(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentMethodSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Payment method title
        const Row(
          children: [
            Icon(
              Icons.payment,
              size: 20,
              color: Color(0xFF6B5BDC),
            ),
            SizedBox(width: 8),
            Text(
              'Payment method',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(height: 15),

        // Payment Methods Section
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 15,
                spreadRadius: 1,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            children: [
              // Payment methods grid
              GridView.builder(
                padding: const EdgeInsets.all(16),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  final method = paymentMethods[index];
                  final isSelected = _selectedPaymentMethodIndex == index;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedPaymentMethodIndex = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xFF6B5BDC)
                            : const Color(0xFFF5F5F7),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xFF6B5BDC)
                              : Colors.transparent,
                          width: 1.5,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            method['icon'],
                            color: isSelected
                                ? Colors.white
                                : const Color(0xFF6B5BDC),
                            size: 22,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            method['name'],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black87,
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6B5BDC), Color(0xFF8673FF)],
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF6B5BDC).withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: const Text(
        'Payment',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildAmountSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center, // Changed from start to center
    children: [
      const Text(
        'Payment Amount',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF2A2D3E),
        ),
        textAlign: TextAlign.center, // Added text alignment
      ),
      const SizedBox(height: 12),
      Container(
        width: double.infinity, // Added to make container take full width
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF6B5BDC), Color(0xFF8673FF)],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF6B5BDC).withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 12,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Changed from start to center
          children: [
            const Text(
              'Enter payment amount',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.white70,
              ),
              textAlign: TextAlign.center, // Added text alignment
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _amountController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center, // Added text alignment
              decoration: InputDecoration(
                prefixText: '\$',
                prefixStyle: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: '0.00',
                hintStyle: TextStyle(
                  color: Colors.white.withOpacity(0.5),
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              textInputAction: TextInputAction.done,
            ),
            const SizedBox(height: 4),
            Container(
              height: 1,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.3),
                    Colors.white.withOpacity(0.7),
                    Colors.white.withOpacity(0.3),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Changed from spaceBetween to center
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.credit_card,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'Credit Card',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

  Widget _buildCardDetailsForm() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInputField(
            label: 'Card Number',
            hintText: '1234 5678 9012 3456',
            controller: _cardNumberController,
            keyboardType: TextInputType.number,
            icon: Icons.credit_card,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberInputFormatter(),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _buildInputField(
                  label: 'Valid Until',
                  hintText: 'MM/YY',
                  controller: _validUntilController,
                  keyboardType: TextInputType.number,
                  icon: Icons.calendar_today,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(4),
                    ValidUntilInputFormatter(),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _buildInputField(
                  label: 'CVV',
                  hintText: '123',
                  controller: _cvvController,
                  keyboardType: TextInputType.number,
                  icon: Icons.lock_outline,
                  obscureText: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _buildInputField(
            label: 'Card Holder Name',
            hintText: 'Enter your full name',
            controller: _cardHolderController,
            keyboardType: TextInputType.name,
            icon: Icons.person_outline,
            textCapitalization: TextCapitalization.words,
          ),
          const SizedBox(height: 24),
          _buildSaveCardOption(),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required String hintText,
    required TextEditingController controller,
    required TextInputType keyboardType,
    required IconData icon,
    List<TextInputFormatter>? inputFormatters,
    bool obscureText = false,
    TextCapitalization textCapitalization = TextCapitalization.none,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: lightGrey,
            borderRadius: BorderRadius.circular(16),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: darkGrey),
              prefixIcon: Icon(icon, color: primaryColor),
              border: InputBorder.none,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            style: TextStyle(fontSize: 16, color: textColor),
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            obscureText: obscureText,
            textCapitalization: textCapitalization,
          ),
        ),
      ],
    );
  }

  Widget _buildSaveCardOption() {
    return GestureDetector(
      onTap: () => setState(() => _isSaveCardData = !_isSaveCardData),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: _isSaveCardData ? primaryColor.withOpacity(0.1) : lightGrey,
          borderRadius: BorderRadius.circular(16),
          border: _isSaveCardData
              ? Border.all(color: primaryColor, width: 1.5)
              : null,
        ),
        child: Row(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: _isSaveCardData ? primaryColor : Colors.white,
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: _isSaveCardData ? Colors.transparent : darkGrey,
                  width: 1.5,
                ),
              ),
              child: _isSaveCardData
                  ? const Icon(Icons.check, color: Colors.white, size: 18)
                  : null,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                'Save this card for future payments',
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPayButton() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: accentColor.withOpacity(0.3),
            blurRadius: 16,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: _amount > 0 ? _onPayButtonPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: accentColor,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.shade300,
          elevation: 0,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: _amount > 0
                ? LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [accentColor, const Color(0xFF8673FF)],
                  )
                : null,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pay Now \$${_amount.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.lock,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSecurePaymentNote() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.shield,
          color: accentColor,
          size: 20,
        ),
        const SizedBox(width: 8),
        const Text(
          'Secure Payment',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
