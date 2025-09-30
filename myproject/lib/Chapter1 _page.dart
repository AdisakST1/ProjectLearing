import 'package:flutter/material.dart';

class Chapter1TopicsPage extends StatelessWidget {
  const Chapter1TopicsPage({super.key});

  // โทนสีให้ตรงภาพ
  static const _appbarOrange = Color(0xFFFFA620);
  static const _topicGreen = Color(0xFF43A047);
  static const _topicRed = Color(0xFFD32F2F);

  @override
  Widget build(BuildContext context) {
    final topics = <_Topic>[
      _Topic(1, 'Greeting Taking', '(การทักทาย)', _topicRed),
      _Topic(
        2,
        'Introducing Yourself and Others',
        '(การแนะนำตนเองและผู้อื่น)',
        _topicGreen,
      ),
      _Topic(
        3,
        'Sharing Personal Data',
        '(การให้และสอบถามข้อมูลส่วนตัว)',
        _topicGreen,
      ),
      _Topic(4, 'Body Language', '(การใช้ภาษากาย)', _topicGreen),
      _Topic(5, 'Telephone Conversation', '(การพูดโทรศัพท์)', _topicGreen),
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      // ✅ ใช้ AppBar เพื่อให้พื้นส้มเต็มกว้าง + title กึ่งกลางเป๊ะ
      appBar: AppBar(
        backgroundColor: _appbarOrange,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Chapter 1 Topics',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        // ปุ่มกลับ (ไอคอน + คำว่า กลับ) ชิดซ้าย เหมือนรูป
        leadingWidth: 88,
        leading: TextButton.icon(
          onPressed: () => Navigator.pop(context),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            padding: const EdgeInsets.only(left: 8),
          ),
          icon: const Icon(Icons.arrow_back_ios_new, size: 18),
          label: const Text('กลับ', style: TextStyle(fontSize: 16)),
        ),
      ),

      body: ListView.separated(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        itemCount: topics.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, i) => _TopicCard(topic: topics[i]),
      ),
    );
  }
}

// ===== Model =====
class _Topic {
  final int index;
  final String title;
  final String subtitle;
  final Color color;
  const _Topic(this.index, this.title, this.subtitle, this.color);
}

// ===== Card =====
class _TopicCard extends StatelessWidget {
  final _Topic topic;
  const _TopicCard({required this.topic});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: topic.color,
      borderRadius: BorderRadius.circular(18), // มุมโค้งใหญ่เหมือนรูป
      elevation: 8, // เงาทิ้งลงด้านล่าง
      shadowColor: Colors.black.withOpacity(0.18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () {
          // TODO: นำทางไปหน้าเนื้อหาใน Topic นี้
        },
        child: Padding(
          // ระยะในกล่องตามรูป
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // แคปชัน "Topic N" โปร่งนิด ๆ มุมมน
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.18),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  'Topic ${topic.index}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // ชื่ออังกฤษ (ตัวหนา/ขนาดใกล้แบบ)
              Text(
                topic.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  height: 1.25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 6),

              // ชื่อไทยในวงเล็บ สีขาวนวลกว่าเล็กน้อย
              Text(
                topic.subtitle,
                style: TextStyle(
                  color: Colors.white.withOpacity(0.92),
                  fontSize: 14,
                  height: 1.25,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
