import 'package:flutter/material.dart';

void main() => runApp(const AiMagicStudio());

class AiMagicStudio extends StatelessWidget {
  const AiMagicStudio({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Magic Studio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF100B20),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF9B5CFF), brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class ToolItem {
  final String title, subtitle;
  final IconData icon;
  final Color color;
  const ToolItem(this.title, this.subtitle, this.icon, this.color);
}

const tools = <ToolItem>[
  ToolItem('AI Image', 'Create images from text', Icons.image_rounded, Color(0xFF9B5CFF)),
  ToolItem('AI Video', 'Turn prompts into videos', Icons.movie_creation_rounded, Color(0xFFFF5CA8)),
  ToolItem('Image to Video', 'Animate your picture', Icons.animation_rounded, Color(0xFF24C6DC)),
  ToolItem('3D Cartoon Maker', 'Create animated characters', Icons.toys_rounded, Color(0xFFFFA94D)),
  ToolItem('AI Story Maker', 'Build scene-by-scene stories', Icons.auto_stories_rounded, Color(0xFF65D6A6)),
  ToolItem('Hindi Voice', 'Create voiceovers', Icons.record_voice_over_rounded, Color(0xFFFFD166)),
  ToolItem('Lip Sync', 'Sync speech and characters', Icons.face_retouching_natural, Color(0xFF7C9CFF)),
  ToolItem('My Creations', 'View saved projects', Icons.video_library_rounded, Color(0xFFFF7A7A)),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF100B20),
        title: const Row(children: [
          Icon(Icons.auto_awesome, color: Color(0xFFC69BFF)),
          SizedBox(width: 9),
          Text('AI Magic Studio', style: TextStyle(fontWeight: FontWeight.w800, letterSpacing: .2)),
        ]),
        actions: [
          IconButton(onPressed: () => _notice(context, 'Profile setup will be added.'), icon: const Icon(Icons.account_circle_outlined)),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(18, 12, 18, 28),
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient: const LinearGradient(colors: [Color(0xFF6D35C7), Color(0xFF25164C), Color(0xFF172A55)], begin: Alignment.topLeft, end: Alignment.bottomRight),
                boxShadow: [BoxShadow(color: const Color(0xFF8B4DFF).withOpacity(.22), blurRadius: 24, offset: const Offset(0, 10))],
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('CREATE WITH AI', style: TextStyle(color: Color(0xFFE0C9FF), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 2)),
                const SizedBox(height: 10),
                const Text('Your ideas.\nYour AI studio.', style: TextStyle(fontSize: 29, height: 1.12, fontWeight: FontWeight.w900)),
                const SizedBox(height: 10),
                const Text('Make images, stories and animated videos in one place.', style: TextStyle(color: Colors.white70, height: 1.4)),
                const SizedBox(height: 18),
                FilledButton.icon(
                  style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: const Color(0xFF32145E), padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13)),
                  onPressed: () => _openTool(context, tools[1]),
                  icon: const Icon(Icons.play_arrow_rounded),
                  label: const Text('Start creating', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ]),
            ),
            const SizedBox(height: 25),
            const Text('Explore AI tools', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 5),
            const Text('Choose what you want to create', style: TextStyle(color: Colors.white60)),
            const SizedBox(height: 15),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tools.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.12),
              itemBuilder: (context, index) {
                final item = tools[index];
                return InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () => _openTool(context, item),
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(color: const Color(0xFF1C1530), borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.white.withOpacity(.07))),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                      Container(width: 44, height: 44, decoration: BoxDecoration(color: item.color.withOpacity(.17), borderRadius: BorderRadius.circular(14)), child: Icon(item.icon, color: item.color, size: 25)),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(item.title, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
                        const SizedBox(height: 4),
                        Text(item.subtitle, style: const TextStyle(color: Colors.white60, fontSize: 11.5), maxLines: 2, overflow: TextOverflow.ellipsis),
                      ]),
                    ]),
                  ),
                );
              },
            ),
            const SizedBox(height: 22),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(color: const Color(0xFF211A34), borderRadius: BorderRadius.circular(18)),
              child: const Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Icon(Icons.info_outline, color: Color(0xFFC69BFF)),
                SizedBox(width: 10),
                Expanded(child: Text('AI generation will become active after connecting secure image, video and voice services. This starter app currently contains the interface only.', style: TextStyle(color: Colors.white70, fontSize: 12, height: 1.4))),
              ]),
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF171126),
        indicatorColor: const Color(0xFF56328A),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.auto_awesome), label: 'Create'),
          NavigationDestination(icon: Icon(Icons.folder_rounded), label: 'My work'),
          NavigationDestination(icon: Icon(Icons.person_rounded), label: 'Profile'),
        ],
        onDestinationSelected: (i) {
          if (i != 0) _notice(context, const ['Home', 'Create tools', 'My work', 'Profile'][i] + ' screen will be added next.');
        },
      ),
    );
  }
}

void _openTool(BuildContext context, ToolItem item) {
  Navigator.of(context).push(MaterialPageRoute(builder: (_) => ToolPage(item: item)));
}

void _notice(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}

class ToolPage extends StatefulWidget {
  final ToolItem item;
  const ToolPage({super.key, required this.item});
  @override
  State<ToolPage> createState() => _ToolPageState();
}

class _ToolPageState extends State<ToolPage> {
  final controller = TextEditingController();
  String format = '9:16';
  @override
  void dispose() { controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    final isStory = widget.item.title == 'AI Story Maker';
    return Scaffold(
      appBar: AppBar(title: Text(widget.item.title)),
      body: ListView(padding: const EdgeInsets.all(20), children: [
        Icon(widget.item.icon, size: 54, color: widget.item.color),
        const SizedBox(height: 18),
        Text(widget.item.title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w900)),
        const SizedBox(height: 8),
        Text(widget.item.subtitle, style: const TextStyle(color: Colors.white60)),
        const SizedBox(height: 24),
        TextField(
          controller: controller,
          minLines: 4,
          maxLines: 7,
          decoration: InputDecoration(
            hintText: isStory ? 'Describe your story idea...' : 'Describe what you want to create...',
            filled: true, fillColor: const Color(0xFF211A34),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 16),
        const Text('Aspect ratio', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 9),
        Wrap(spacing: 8, children: ['9:16', '1:1', '16:9'].map((v) => ChoiceChip(label: Text(v), selected: format == v, onSelected: (_) => setState(() => format = v)).toList()).toList()),
        const SizedBox(height: 22),
        FilledButton.icon(
          onPressed: () {
            final prompt = controller.text.trim();
            if (prompt.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter a prompt first.')));
              return;
            }
            showDialog(context: context, builder: (_) => AlertDialog(
              title: const Text('Service connection needed'),
              content: const Text('Your prompt is ready. To generate real images or videos, the app owner must connect a secure AI API and backend. No fake result will be shown.'),
              actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
            ));
          },
          icon: const Icon(Icons.auto_awesome),
          label: const Text('Generate'),
          style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
        ),
      ]),
    );
  }
}
