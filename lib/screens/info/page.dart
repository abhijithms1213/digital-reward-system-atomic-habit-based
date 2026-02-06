import 'package:drewardsystem/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenAbout extends GetView {
  const ScreenAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('About'),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      // backgroundColor: const Color.fromARGB(255, 224, 223, 223),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Theme.of(context).scaffoldBackgroundColor,
                Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero Section
                      _HeroSection(),

                      const SizedBox(height: 32),

                      // Purpose Section
                      _FeatureCard(
                        icon: Icons.emoji_objects_outlined,
                        iconColor: Colors.amber,
                        title: 'What\'s the purpose of this app?',
                        children: const [
                          _HighlightText(
                            'Building habits that last is hard — especially daily routines.',
                          ),
                          SizedBox(height: 12),
                          _BodyText(
                            'You already know what to do, but staying consistent feels difficult. '
                            'Thats because most habits lack instant reward.',
                          ),
                          SizedBox(height: 16),
                          _SubheadingText(
                            'This app is built for people who struggle to:',
                          ),
                          SizedBox(height: 8),
                          _BulletPoint('Stay consistent with daily habits'),
                          _BulletPoint('Feel rewarded for their progress'),
                          _BulletPoint(
                            'Continue after 1–2 weeks without losing motivation',
                          ),
                          SizedBox(height: 16),
                          _HighlightBox(
                            text:
                                'This app gives you instant dopamine rewards for real progress — '
                                'using attractive animations and satisfying sound effects — '
                                'so your brain feels good immediately after doing the habit.',
                            color: Colors.purple,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Lazy Section
                      _FeatureCard(
                        icon: Icons.self_improvement_outlined,
                        iconColor: Colors.blue,
                        title: 'Feeling lazy or overwhelmed to start?',
                        children: const [
                          _BodyText('That\'s normal.'),
                          SizedBox(height: 12),
                          _SubheadingText('Big tasks feel heavy:'),
                          SizedBox(height: 8),
                          _IconBullet(icon: '🏋️', text: '1 hour workout'),
                          _IconBullet(icon: '📚', text: '1.5 hours studying'),
                          _IconBullet(icon: '📖', text: '1 hour reading'),
                          SizedBox(height: 16),
                          _HighlightText(
                            'That\'s why this app introduces Mini Tasks.',
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Mini Tasks System
                      _GradientCard(
                        gradient: LinearGradient(
                          colors: [
                            Colors.deepPurple.shade400,
                            Colors.purple.shade300,
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            _CardTitle(
                              icon: Icons.extension_outlined,
                              title: 'Mini Tasks System',
                              isWhite: true,
                            ),
                            SizedBox(height: 16),
                            _WhiteBullet(
                              'Each habit can be split into up to 5 tiny tasks',
                            ),
                            _WhiteBullet('Each tile represents one small step'),
                            _WhiteBullet('Each step gives its own reward'),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Workflow Section
                      _SectionDivider(title: 'Example Workflow'),

                      const SizedBox(height: 16),

                      _FeatureCard(
                        icon: Icons.loop_outlined,
                        iconColor: Colors.teal,
                        title: 'How Mini Tasks Reduce Friction',
                        children: const [
                          _BodyText(
                            'Sometimes the problem isn\'t the habit itself — it\'s starting.',
                          ),
                          SizedBox(height: 12),
                          _ItalicText(
                            'You want to study, but the book isn\'t even on the table.',
                          ),
                          _ItalicText(
                            'You want to work on a project, but opening the laptop feels heavy.',
                          ),
                          _ItalicText(
                            'You want to work out, but getting into position already feels tiring.',
                          ),
                          SizedBox(height: 16),
                          _HighlightBox(
                            text:
                                'Mini Tasks are designed to reduce friction to near zero by breaking '
                                'the habit into the smallest possible actions.',
                            color: Colors.teal,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Examples
                      const _ExampleCard(
                        emoji: '📚',
                        title: 'Studying',
                        subtitle: 'When You Can\'t Even Start',
                        steps: [
                          'Lightly clean the study table and sit on the chair',
                          'Take the book from your bag and place it at the center of the table',
                          'Open the book, take a pen and required materials',
                          'Read or write just 1–2 lines only',
                          'Continue naturally from there…',
                        ],
                        note:
                            'After completing each mini task, mark it in the app and claim your instant reward.',
                      ),

                      const SizedBox(height: 20),

                      const _ExampleCard(
                        emoji: '💻',
                        title: 'Working on a Project',
                        subtitle: 'Feeling Overwhelmed to Begin',
                        steps: [
                          'Sit on the chair',
                          'Open your laptop and Chrome / task tab',
                          'Open your notes or required files',
                          'Do the first tiny task only',
                          'Continue step by step…',
                        ],
                        note:
                            'You\'re not forcing productivity — you\'re entering the flow naturally.',
                      ),

                      const SizedBox(height: 20),

                      const _ExampleCard(
                        emoji: '🏋️',
                        title: 'Workout',
                        subtitle: 'Zero Motivation State',
                        steps: [
                          'Get into workout position',
                          'Do one single push-up',
                          'Rest and breathe',
                          'Do one more small movement',
                          'Continue if you feel like it…',
                        ],
                        note:
                            'Even one rep counts. Action creates motivation — not the other way around.',
                      ),

                      const SizedBox(height: 32),

                      // Time Splitting Tip
                      _TipCard(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            _TipHeader(),
                            SizedBox(height: 12),
                            _BodyText(
                              'You can also split tasks by time. For example, instead of a 1-hour session, '
                              'divide it into 5 × 12-minute mini sessions or any duration that feels easy to start.',
                            ),
                            SizedBox(height: 12),
                            _HighlightText(
                              'There is no fixed rule — split your habit based on your own logic and plan. '
                              'The goal is to reduce friction, start easily, and reward progress step by step.',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Science Section
                      _GradientCard(
                        gradient: LinearGradient(
                          colors: [
                            Colors.indigo.shade400,
                            Colors.blue.shade400,
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            _CardTitle(
                              icon: Icons.science_outlined,
                              title: 'Is this scientifically backed?',
                              isWhite: true,
                            ),
                            SizedBox(height: 16),
                            _WhiteText(
                              'Yes. This app is based on behavioral psychology, inspired mainly by concepts '
                              'from the book Atomic Habits.',
                            ),
                            SizedBox(height: 8),
                            _WhiteText(
                              'But implemented here in a unique, visual, and interactive way.',
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),
                // Footer
                Container(
                  // color: Colors.amber,
                  height: 550,
                  width: double.infinity,
                  child: Stack(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // LEFT SIDE – WHY I BUILT THIS APP
                      Positioned(
                        top: 10,
                        left: 16,
                        // right: 190,
                        child: Row(
                          children: [
                            Icon(
                              Icons.psychology,
                              color: Color(0xff033047),
                              size: 30,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Why I built this app',
                              style: Theme.of(context).textTheme.titleLarge
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff033047),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 10,
                        left: 16,
                        right: 190, // leaves space for image
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 48),
                            Text(
                              'I built this app because I struggled to stay consistent '
                              'with good habits, even when I knew what to do.\n\n'
                              'Most habit apps only track progress, but they don’t make '
                              'progress feel rewarding. This app was created to solve that '
                              'problem by giving instant visual and sound-based rewards '
                              'for real effort.\n\n'
                              'contact: www.linkedin.com'
                              'github: www.github.com',
                              style: Theme.of(context).textTheme.bodyMedium
                                  ?.copyWith(
                                    height: 1.6,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ],
                        ),
                      ),

                      Positioned(
                        // left: 0,
                        // top: 0,
                        bottom: 50,
                        right: -60,
                        child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            image: DecorationImage(
                              image: AssetImage(AppAssets.me),
                              fit: BoxFit.contain,
                            ),
                          ),
                          height: 450,
                          width: 280,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),
                _Footer(),

                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================================
// Hero Section
// ============================================================================

class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.deepPurple.shade300,
            Colors.purple.shade400,
            Colors.pink.shade300,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.purple.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Icon(Icons.auto_awesome, size: 48, color: Colors.white),
          const SizedBox(height: 16),
          Text(
            'Build Lasting Habits',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Through instant rewards and tiny steps',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.9),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Feature Card
// ============================================================================

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final List<Widget> children;

  const _FeatureCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CardTitle(icon: icon, title: title, iconColor: iconColor),
          const SizedBox(height: 16),
          ...children,
        ],
      ),
    );
  }
}

// ============================================================================
// Gradient Card
// ============================================================================

class _GradientCard extends StatelessWidget {
  final Gradient gradient;
  final Widget child;

  const _GradientCard({required this.gradient, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.deepPurple.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: child,
    );
  }
}

// ============================================================================
// Example Card
// ============================================================================

class _ExampleCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String subtitle;
  final List<String> steps;
  final String note;

  const _ExampleCard({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.steps,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey.shade100, Colors.grey.shade50],
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Row(
              children: [
                Text(emoji, style: const TextStyle(fontSize: 32)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Steps
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...steps.asMap().entries.map((entry) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Text(
                              '${entry.key + 1}',
                              style: TextStyle(
                                color: Colors.deepPurple.shade700,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Text(
                              entry.value,
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium?.copyWith(height: 1.5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),

                const SizedBox(height: 8),

                // Note
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.amber.shade200, width: 1),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lightbulb_outline,
                        size: 20,
                        color: Colors.amber.shade700,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          note,
                          style: Theme.of(context).textTheme.bodySmall
                              ?.copyWith(
                                color: Colors.amber.shade900,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Tip Card
// ============================================================================

class _TipCard extends StatelessWidget {
  final Widget child;

  const _TipCard({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.blue.shade200, width: 2),
      ),
      child: child,
    );
  }
}

class _TipHeader extends StatelessWidget {
  const _TipHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.tips_and_updates, color: Colors.blue.shade700, size: 24),
        const SizedBox(width: 8),
        Text(
          'Pro Tip',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.blue.shade900,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// Section Divider
// ============================================================================

class _SectionDivider extends StatelessWidget {
  final String title;

  const _SectionDivider({required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey.shade300, thickness: 1)),
      ],
    );
  }
}

// ============================================================================
// Footer
// ============================================================================

class _Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.favorite, color: Colors.red.shade400, size: 20),
                const SizedBox(width: 8),
                Text(
                  'Made with care for your success',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey.shade700),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Text Widgets
// ============================================================================

class _CardTitle extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color? iconColor;
  final bool isWhite;

  const _CardTitle({
    required this.icon,
    required this.title,
    this.iconColor,
    this.isWhite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: isWhite
                ? Colors.white.withOpacity(0.2)
                : iconColor?.withOpacity(0.1) ?? Colors.grey.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            icon,
            color: isWhite ? Colors.white : iconColor ?? Colors.grey.shade700,
            size: 24,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: isWhite ? Colors.white : null,
            ),
          ),
        ),
      ],
    );
  }
}

class _BodyText extends StatelessWidget {
  final String text;

  const _BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        height: 1.6,
        color: Colors.grey.shade700,
      ),
    );
  }
}

class _WhiteText extends StatelessWidget {
  final String text;

  const _WhiteText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        height: 1.6,
        color: Colors.white.withOpacity(0.95),
      ),
    );
  }
}

class _HighlightText extends StatelessWidget {
  final String text;

  const _HighlightText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        height: 1.6,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade800,
      ),
    );
  }
}

class _SubheadingText extends StatelessWidget {
  final String text;

  const _SubheadingText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade800,
      ),
    );
  }
}

class _ItalicText extends StatelessWidget {
  final String text;

  const _ItalicText(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontStyle: FontStyle.italic,
          color: Colors.grey.shade600,
        ),
      ),
    );
  }
}

// ============================================================================
// Bullet Points
// ============================================================================

class _BulletPoint extends StatelessWidget {
  final String text;

  const _BulletPoint(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade400,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.6,
                color: Colors.grey.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _WhiteBullet extends StatelessWidget {
  final String text;

  const _WhiteBullet(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.6,
                color: Colors.white.withOpacity(0.95),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IconBullet extends StatelessWidget {
  final String icon;
  final String text;

  const _IconBullet({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================================
// Highlight Box
// ============================================================================

class _HighlightBox extends StatelessWidget {
  final String text;
  final Color color;

  const _HighlightBox({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 1.5),
      ),
      child: Row(
        children: [
          Icon(Icons.auto_awesome, color: color, size: 20),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                height: 1.6,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
