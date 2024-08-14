part of "../game_create_view.dart";

final class _OnboardColorOptionListView extends StatefulWidget {
  const _OnboardColorOptionListView({super.key, required this.onSelect});

  final Function(Color color) onSelect;

  @override
  State<_OnboardColorOptionListView> createState() => __OnboardColorOptionListViewState();
}

class __OnboardColorOptionListViewState extends State<_OnboardColorOptionListView> {
  int? _selectedIndex;
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.indigo,
    Colors.cyan
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ListView.builder(
        itemCount: _colors.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          Color color = _colors[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _ColorOptionWidget(
                color: color,
                selectedIndex: _selectedIndex,
                onSelect: (id) {
                  setState(() {
                    _selectedIndex = id;
                  });
                  widget.onSelect(color);
                },
                index: index),
          );
        },
      ),
    );
  }
}

class _ColorOptionWidget extends StatelessWidget {
  const _ColorOptionWidget({required this.color, required this.onSelect, this.selectedIndex, required this.index});
  final Color color;
  final int index;
  final Function(int id) onSelect;
  final int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => onSelect(index),
        child: Container(
          width: 40,
          height: 50,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(
              color: Colors.black,
              width: selectedIndex == index ? 3 : 0,
            ),
          ),
        ));
  }
}
