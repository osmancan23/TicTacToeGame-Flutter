part of "../game_view.dart";

final class _UserContainerWidget extends StatelessWidget {
  const _UserContainerWidget({
    required this.name,
    required this.type,
  });
  final String name;
  final GameValueEnum type;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(type.icon.pngPath, width: 50, height: 50),
            Text(name),
            Text(
              type.value,
              style: TextStyle(fontSize: 30, color: type.color, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
