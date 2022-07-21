import 'package:flutter/material.dart';
import 'package:musify/configs/configs.dart';
import 'package:musify/models/playlist/playlist.dart';
import 'package:musify/providers/song_provider.dart';
import 'package:musify/utils/utils.dart';
import 'package:provider/provider.dart';

part 'widgets/_playlist_card.dart';
part 'widgets/_playlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final songProvider = Provider.of<SongProvider>(context, listen: false);
      songProvider.getPlaylists();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.all(1, 1.5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Space.yf(3.5),
          Text(
            'Playlists',
            style: AppText.h1b,
          ),
          Space.y1!,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: context
                  .watch<SongProvider>()
                  .getLists
                  .map(
                    (e) => _PlaylistCard(
                      playlist: e,
                      isPlaylist: true,
                    ),
                  )
                  .toList(),
            ),
          ),
          Space.y2!,
          Text(
            'Artists',
            style: AppText.h1b,
          ),
          Space.y1!,
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                'Atif Aslam',
                'Arjit Singh',
                'Neha Kekar',
                'Ali Shethi',
              ]
                  .map(
                    (e) => _PlaylistCard(
                      playlist: Playlist(
                        name: e,
                        description: '',
                        playlist: [],
                      ),
                      isPlaylist: false,
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
