import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show basename;
import 'package:provider/provider.dart';

import 'package:musify/configs/configs.dart';
import 'package:musify/models/song/song.dart';
import 'package:musify/providers/song_provider.dart';
import 'package:musify/utils/utils.dart';
import 'package:musify/widgets/custom_snackbar.dart';

class PlayingNowScreen extends StatefulWidget {
  const PlayingNowScreen({Key? key}) : super(key: key);

  @override
  State<PlayingNowScreen> createState() => _PlayingNowScreenState();
}

class _PlayingNowScreenState extends State<PlayingNowScreen> {
  double playing = 0;
  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);
    bool alreadyLiked = songProvider.likedSongs.contains(
      Song(
        songPath: songProvider.current!,
      ),
    );

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Space.all(1, 0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${basename(songProvider.current!).substring(0, 10)}...',
                      style: AppText.h1b,
                    ),
                  ),
                  Space.x!,
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    iconSize: AppDimensions.normalize(20),
                    splashRadius: AppDimensions.normalize(10),
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: AppTheme.c!.primary,
                    ),
                  ),
                ],
              ),
              Text(
                'By Artist',
                style: AppText.b2b!.copyWith(
                  color: AppTheme.c!.primary,
                ),
              ),
              Space.y2!,
              Container(
                height: AppDimensions.normalize(150),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage(
                      AppUtils.playing,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Space.y1!,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: AppDimensions.normalize(20),
                    splashRadius: AppDimensions.normalize(10),
                    onPressed: () {},
                    color: AppTheme.c!.primary,
                    icon: const Icon(
                      Icons.skip_previous,
                    ),
                  ),
                  IconButton(
                    iconSize: AppDimensions.normalize(20),
                    splashRadius: AppDimensions.normalize(10),
                    color: AppTheme.c!.primary,
                    onPressed: () {
                      if (songProvider.isPlaying) {
                        songProvider.pauseSong();
                      } else {
                        songProvider.playSong();
                      }
                    },
                    icon: Icon(
                      songProvider.isPlaying ? Icons.pause : Icons.play_arrow,
                    ),
                  ),
                  IconButton(
                    iconSize: AppDimensions.normalize(20),
                    splashRadius: AppDimensions.normalize(10),
                    onPressed: () {},
                    color: AppTheme.c!.primary,
                    icon: const Icon(
                      Icons.skip_next,
                    ),
                  ),
                ],
              ),
              Space.y1!,
              Slider(
                value: playing,
                onChanged: (value) {
                  setState(() {
                    playing = value;
                  });
                },
              ),
              Space.y1!,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    splashRadius: AppDimensions.normalize(10),
                    onPressed: () {
                      if (!alreadyLiked) {
                        songProvider.liked(
                          Song(
                            songPath: songProvider.current!,
                          ),
                        );
                        CustomSnackBars.success(context, 'Added to Liked!');
                      } else {
                        songProvider.unLiked(
                          Song(
                            songPath: songProvider.current!,
                          ),
                        );
                        CustomSnackBars.failure(context, 'Removed from Liked!');
                      }
                    },
                    icon: Icon(
                      alreadyLiked ? Icons.favorite : Icons.favorite_border,
                      color: alreadyLiked ? AppTheme.c!.primary : null,
                    ),
                  ),
                  IconButton(
                    splashRadius: AppDimensions.normalize(10),
                    onPressed: () {},
                    icon: const Icon(Icons.download),
                  ),
                  IconButton(
                    splashRadius: AppDimensions.normalize(10),
                    onPressed: () {},
                    icon: const Icon(Icons.comment),
                  ),
                  IconButton(
                    splashRadius: AppDimensions.normalize(10),
                    onPressed: () {},
                    icon: const Icon(Icons.playlist_add),
                  ),
                  IconButton(
                    splashRadius: AppDimensions.normalize(10),
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
