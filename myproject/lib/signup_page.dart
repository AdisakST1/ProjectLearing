import 'package:flutter/material.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  final _repeat = TextEditingController();
  final _nickname = TextEditingController();

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    _repeat.dispose();
    _nickname.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // สีและสไตล์หลักให้ใกล้ภาพ
    const hintColor = Color(0xFFB7BAC7); // สี placeholder เทาอมม่วง
    const underlineColor = Colors.black87; // สีเส้นใต้แท็บ
    const titleColor = Color(0xFF8D93A6); // สีข้อความ Welcome
    const orange = Color(0xFFFFA620); // สีปุ่ม Confirm

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF6F7FB), // ด้านบนออกเทาอมม่วงอ่อน
              Color(0xFFFFFFFF), // ล่างเป็นขาว
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 12),

                // โลโก้
                Image.asset("assets/images/logo.png", height: 100),
                const SizedBox(height: 16),

                const Text(
                  "Welcome to english learning app",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: titleColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),

                // Tabs: Sign-in (กดกลับ) / Sign-up (active + เส้นขีดใต้)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        "Sign-in",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF8F93A0),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      children: const [
                        Text(
                          "Sign-up",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 6),
                        SizedBox(
                          width: 96,
                          child: Divider(
                            thickness: 2,
                            height: 2,
                            color: underlineColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // ช่องกรอกทรงเม็ดยาพร้อมเงาฟุ้ง (neumorphic-like)
                _NeumorphicInput(
                  controller: _username,
                  hint: "Username",
                  hintColor: hintColor,
                ),
                const SizedBox(height: 14),
                _NeumorphicInput(
                  controller: _password,
                  hint: "Password",
                  isPassword: true,
                  hintColor: hintColor,
                ),
                const SizedBox(height: 14),
                _NeumorphicInput(
                  controller: _repeat,
                  hint: "Repeat Password",
                  isPassword: true,
                  hintColor: hintColor,
                ),
                const SizedBox(height: 14),
                _NeumorphicInput(
                  controller: _nickname,
                  hint: "ชื่อเล่น",
                  hintColor: hintColor,
                ),

                const SizedBox(height: 28),

                // ปุ่ม Confirm สีส้ม มุมโค้ง + เงาเล็กน้อย
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: orange,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      shadowColor: Colors.black.withOpacity(0.08),
                    ),
                    onPressed: () {
                      // ✅ เด้งไปหน้า HomePage
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    },
                    child: const Text(
                      "Confirm",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// ช่องกรอกทรงเม็ดยา + เงาฟุ้งเหมือนในภาพ
class _NeumorphicInput extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool isPassword;
  final Color hintColor;

  const _NeumorphicInput({
    required this.controller,
    required this.hint,
    this.isPassword = false,
    required this.hintColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: const [
          BoxShadow(
            color: Color(0x1A000000),
            blurRadius: 18,
            spreadRadius: 1,
            offset: Offset(0, 6),
          ),
          BoxShadow(color: Colors.white, blurRadius: 6, offset: Offset(0, -2)),
        ],
      ),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          isCollapsed: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          hintText: hint,
          hintStyle: TextStyle(color: hintColor, fontSize: 15),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
