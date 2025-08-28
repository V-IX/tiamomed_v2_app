import "package:flutter/material.dart";

class PlayerButton extends StatefulWidget {
  const PlayerButton({super.key, required this.onTap });

  final VoidCallback onTap;

  @override
  _PlayerButtonState createState() => _PlayerButtonState();
}

class _PlayerButtonState extends State<PlayerButton> {

  bool _isPlay = false;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: const CircleBorder(),
        backgroundColor: Colors.red,
      ),
      child: Icon(_isPlay ? Icons.pause : Icons.play_arrow),
      onPressed: ()  {
        widget.onTap();
        setState(() {
          _isPlay = !_isPlay;
        });
      },
    );
  }
}
