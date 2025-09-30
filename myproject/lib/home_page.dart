import 'package:flutter/material.dart';
import 'Chapter1 _page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // --------- Theme colors ให้ใกล้แบบในภาพ ---------
  static const _green = Color(0xFF43A047);
  static const _red = Color(0xFFD32F2F);
  static const _amber = Color(0xFFF9A825);
  static const _avatarGreen = Color(0xFFA6D873);
  static const _greyText = Color(0xFF8C8C99);

  // ข้อมูลบทเรียนจำลอง
  final List<Map<String, dynamic>> lessons = [
    {
      "title":
          "1.การใช้ภาษาในการสื่อสาร\nความหมายในชีวิตประจำวัน\n(Language in Daily Life)",
      "progress": 100,
      "color": _green,
    },
    {
      "title": "2.คุณรู้สึกอย่างไร\n(how do you feel?)",
      "progress": 0,
      "color": _red,
    },
    {
      "title": "3.คุณคิดอย่างไร\n(What do you think?)",
      "progress": 50,
      "color": _amber,
    },
    {
      "title": "4.รูปแบบประโยคในภาษาอังกฤษ\n(Types of English Sentence)",
      "progress": 100,
      "color": _green,
    },
    {"title": "5.อดีตกาล\n(Past Tense)", "progress": 100, "color": _green},
    {"title": "6.อาชีพพนักงานขับรถรับจ้าง", "progress": 100, "color": _green},
    {
      "title": "7.ภาษาอังกฤษสำหรับพนักงาน\nบริการในสถานที่ต่าง ๆ",
      "progress": 100,
      "color": _green,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // ----------------- BODY -----------------
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header + Avatar
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(child: _Greeting()),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: _avatarGreen,
                    child: const Text(
                      'N',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // การ์ด แบบทดสอบประเมินความรู้
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/quiz');
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: _green, width: 1.2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.06),
                        blurRadius: 12,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'แบบทดสอบประเมินความรู้',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        'ทำแบบทดสอบเพื่อประเมินระดับความรู้\nเริ่มทำแบบทดสอบ >',
                        style: TextStyle(color: _greyText, height: 1.4),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              const Text(
                'บทเรียน',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 12),

              // ✅ รายการบทเรียน: เช็ค index เพื่อกำหนด onLearn ของบทที่ 1
              ...lessons.asMap().entries.map((entry) {
                final index = entry.key;
                final l = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 14),
                  child: _LessonCard(
                    title: l['title'] as String,
                    color: l['color'] as Color,
                    progress: l['progress'] as int,
                    onLearn: () {
                      if (index == 0) {
                        // ✅ บทที่ 1 → ไปหน้า Chapter 1 Topics
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const Chapter1TopicsPage(),
                          ),
                        );
                      } else {
                        // บทอื่น ๆ: ใช้ route เดิมหรือไปหน้าเรียนรวม
                        Navigator.pushNamed(context, '/lesson');
                      }
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),

      // ----------------- BOTTOM NAV -----------------
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: _amber,
        unselectedItemColor: _greyText,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'หน้าหลัก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_outlined),
            label: 'แบบทดสอบ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'โปรไฟล์',
          ),
        ],
        onTap: (i) {
          if (i == 1) Navigator.pushNamed(context, '/quiz');
          if (i == 2) Navigator.pushNamed(context, '/profile');
        },
      ),
    );
  }
}

// ---------- Widgets & Helpers ----------

class _Greeting extends StatelessWidget {
  const _Greeting();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          'มาเรียนรู้ภาษาอังกฤษกันเถอะ!',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 4),
        Text(
          'สวัสดี,น้องอินอิน',
          style: TextStyle(
            fontSize: 22,
            height: 1.2,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}

class _LessonCard extends StatelessWidget {
  final String title;
  final Color color;
  final int progress;
  final VoidCallback onLearn;

  const _LessonCard({
    required this.title,
    required this.color,
    required this.progress,
    required this.onLearn,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 12, 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ชื่อบทเรียน
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                height: 1.35,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),

          // กล่องความคืบหน้า + ปุ่ม "เรียน"
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _ProgressPill(percent: progress),
              const SizedBox(height: 8),
              _SmallWhiteButton(label: 'เรียน', onTap: onLearn),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProgressPill extends StatelessWidget {
  final int percent;
  const _ProgressPill({required this.percent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 64,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: const _GreenText(), // ✅ สีเขียว
    );
  }
}

/// แยกตัวหนังสือสีเขียวไว้ให้ชัด (อ่านง่าย/แก้ง่าย)
class _GreenText extends StatelessWidget {
  const _GreenText({this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    // ถ้ามี text จะใช้ข้อความนั้น (เช่น 100%), ถ้าไม่มีก็คืน Container เปล่า
    return Builder(
      builder: (context) {
        final parent = context.findAncestorWidgetOfExactType<_ProgressPill>();
        final percent = (parent?.percent ?? 0);
        return Text(
          '${percent}%',
          style: const TextStyle(
            color: Color(0xFF43A047),
            fontWeight: FontWeight.w700,
            fontSize: 12,
          ),
        );
      },
    );
  }
}

class _SmallWhiteButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _SmallWhiteButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onTap,
      child: Container(
        width: 64,
        height: 32,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          label,
          style: const TextStyle(
            color: Color(0xFF43A047), // ✅ คำว่า "เรียน" สีเขียว
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
