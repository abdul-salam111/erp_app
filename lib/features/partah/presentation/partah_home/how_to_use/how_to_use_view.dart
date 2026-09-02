import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../../../core/theme/theme_exports.dart';

class YoutubePopup extends StatefulWidget {
  const YoutubePopup({super.key});

  @override
  State<YoutubePopup> createState() => _YoutubePopupState();
}

class _YoutubePopupState extends State<YoutubePopup> {
  late YoutubePlayerController _ytController;

  @override
  void initState() {
    super.initState();
    _ytController = YoutubePlayerController(
      initialVideoId: 'wjTdrOTYj9g',
      // iOS WKWebView blocks unmuted autoplay, which leaves the player on a
      // black frame if autoPlay is requested with sound — require a tap.
      flags: const YoutubePlayerFlags(autoPlay: false, mute: false),
    );
  }

  @override
  void dispose() {
    _ytController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _ytController,
        showVideoProgressIndicator: true,
        progressIndicatorColor: context.primary,
      ),
      builder: (ctx, player) {
        return Dialog(
          backgroundColor: context.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                children: [
                  Positioned.fill(child: player),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: .circle,
                        ),
                        child: Icon(Icons.close_rounded, color: context.white, size: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
