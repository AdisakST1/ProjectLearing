import 'package:flutter/material.dart';
import 'signup_page.dart';

/// ใช้โทนสีให้ใกล้เคียงภาพ
class _AppColors {
  static const greyText = Color(0xFF8C8C99);
  static const divider = Color(0xFF1A1A1A);
  static const fbBlue = Color(0xFF1877F2);
  static const gmailRed = Color(0xFFDB4437);
  static const loginOrange = Color(0xFFF9A825); // โทนส้มปุ่ม Login
}

/// กล่องกรอกแบบ Neumorphic
class CustomInputField extends StatelessWidget {
  final String hintText;
  final bool isPassword;

  const CustomInputField({
    super.key,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            offset: const Offset(4, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
          const BoxShadow(
            color: Colors.white,
            offset: Offset(-4, -4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: _AppColors.greyText),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

/// ปุ่มแอ็กชันเต็มความกว้าง
class _FullButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  const _FullButton({
    required this.label,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 0,
        ),
        child: Text(
          label,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 8),

                Image.asset('assets/images/logo.png', height: 100),
                const SizedBox(height: 18),

                /// ข้อความต้อนรับสีเทาอ่อน
                const Text(
                  'Welcome to english learning app',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: _AppColors.greyText,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 22),

                /// แถบ Tab แบบเส้นใต้เหมือนภาพ
                DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                        indicatorColor: _AppColors.divider,
                        indicatorWeight: 2,
                        labelColor: Colors.black,
                        unselectedLabelColor: _AppColors.greyText,
                        tabs: const [
                          Tab(text: 'Sign-in'),
                          Tab(text: 'Sign-up'),
                        ],
                        onTap: (i) {
                          if (i == 1) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SignUpPage(),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 6),
                const SizedBox(height: 8),

                /// ฟอร์ม
                const CustomInputField(hintText: 'Username'),
                const CustomInputField(hintText: 'Password', isPassword: true),

                const SizedBox(height: 22),

                /// ปุ่ม Login สีส้ม
                _FullButton(
                  label: 'Login',
                  color: _AppColors.loginOrange,
                  onPressed: () {
                    // TODO: handle login
                  },
                ),

                const SizedBox(height: 22),

                /// ข้อความคั่น "or login with"
                const Text(
                  'or login with',
                  style: TextStyle(color: _AppColors.greyText, fontSize: 14),
                ),
                const SizedBox(height: 16),

                _FullButton(
                  label: 'Facebook',
                  color: _AppColors.fbBlue,
                  onPressed: () {
                    // TODO: Facebook login
                  },
                ),
                const SizedBox(height: 14),
                _FullButton(
                  label: 'Gmail',
                  color: _AppColors.gmailRed,
                  onPressed: () {},
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
