import 'package:flutter/material.dart';

class GridSizeSelector extends StatefulWidget {
  final int initialRows;
  final int initialColumns;
  final ValueChanged<int> onRowsChanged;
  final ValueChanged<int> onColumnsChanged;

  const GridSizeSelector({
    super.key,
    this.initialRows = 3,
    this.initialColumns = 3,
    required this.onRowsChanged,
    required this.onColumnsChanged,
  });

  @override
  _GridSizeSelectorState createState() => _GridSizeSelectorState();
}

class _GridSizeSelectorState extends State<GridSizeSelector> {
  late int _rows;
  late int _columns;

  @override
  void initState() {
    super.initState();
    _rows = widget.initialRows;
    _columns = widget.initialColumns;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Select Grid Size:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSizeSelector('Rows', _rows, (value) {
              setState(() {
                _rows = value;
                widget.onRowsChanged(value);
              });
            }),
            const SizedBox(width: 16),
            _buildSizeSelector('Columns', _columns, (value) {
              setState(() {
                _columns = value;
                widget.onColumnsChanged(value);
              });
            }),
          ],
        ),
      ],
    );
  }

  Widget _buildSizeSelector(String label, int currentValue, ValueChanged<int> onChanged) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: currentValue > 3
                    ? () {
                        onChanged(currentValue - 1);
                      }
                    : null,
              ),
              Text(
                '$currentValue',
                style: const TextStyle(fontSize: 16),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle_outline),
                onPressed: () {
                  onChanged(currentValue + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
