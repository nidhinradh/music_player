import 'package:flutter/material.dart';
import 'package:fluttery_audio/fluttery_audio.dart';
import 'package:music_player/songs/songs.dart';
import 'package:music_player/theme/theme.dart';

class BottomControls extends StatelessWidget {
  const BottomControls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: double.infinity,
      child: Material(
        shadowColor: const Color(0x44000000),
        color: accentColor,
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
          child: new Column(
            children: <Widget>[
              new SongTitle(),
              new ArtistName(),
              new Controls(),
            ],
          ),
        ),
      ),
    );
  }
}

class SongTitle extends StatelessWidget {
  const SongTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AudioPlaylistComponent(
      playlistBuilder: (BuildContext context, Playlist playlist, Widget child) {
        String songTitle = demoPlaylist.songs[playlist.activeIndex].songTitle;

        return new RichText(
          text: new TextSpan(
            text: '',
            children: [
              new TextSpan(
                text: songTitle.toUpperCase(),
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 4.0,
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ArtistName extends StatelessWidget {
  const ArtistName({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AudioPlaylistComponent(
      playlistBuilder: (BuildContext context, Playlist playlist, Widget child) {
        String artistName = demoPlaylist.songs[playlist.activeIndex].artist;

        return new RichText(
          text: new TextSpan(
            text: '',
            children: [
              new TextSpan(
                text: artistName.toUpperCase(),
                style: new TextStyle(
                  color: Colors.white.withOpacity(0.75),
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  height: 1.5,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Controls extends StatelessWidget {
  const Controls({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Container(),
          ),
          new PreviousButton(),
          new Expanded(
            child: new Container(),
          ),
          new PlayPauseButton(),
          new Expanded(
            child: new Container(),
          ),
          new NextButton(),
          new Expanded(
            child: new Container(),
          ),
        ],
      ),
    );
  }
}

class PreviousButton extends StatelessWidget {
  const PreviousButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AudioPlaylistComponent(
      playlistBuilder: (BuildContext context, Playlist playlist, Widget child) {
        return new IconButton(
          splashColor: lightAccentColor,
          highlightColor: Colors.transparent,
          icon: new Icon(
            Icons.skip_previous,
            color: Colors.white,
            size: 35.0,
          ),
          onPressed: playlist.previous,
        );
      },
    );
  }
}

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AudioComponent(
      updateMe: [
        WatchableAudioProperties.audioPlayerState,
      ],
      playerBuilder: (BuildContext context, AudioPlayer player, Widget child) {
        IconData iconData = Icons.music_note;
        Color buttnColor = lightAccentColor;
        Function onPressed;

        if (player.state == AudioPlayerState.playing) {
          iconData = Icons.pause;
          onPressed = player.pause;
          buttnColor = Colors.white;
        } else if (player.state == AudioPlayerState.paused ||
            player.state == AudioPlayerState.completed) {
          iconData = Icons.play_arrow;
          onPressed = player.play;
          buttnColor = Colors.white;
        }

        return new RawMaterialButton(
          shape: new CircleBorder(),
          fillColor: buttnColor,
          splashColor: lightAccentColor,
          highlightColor: lightAccentColor.withOpacity(0.5),
          elevation: 10.0,
          highlightElevation: 5.0,
          onPressed: onPressed,
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Icon(
              iconData,
              color: darkAccentColor,
              size: 35.0,
            ),
          ),
        );
      },
    );
  }
}

class NextButton extends StatelessWidget {
  const NextButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AudioPlaylistComponent(
      playlistBuilder: (BuildContext context, Playlist playlist, Widget child) {
        return new IconButton(
          splashColor: lightAccentColor,
          highlightColor: Colors.transparent,
          icon: new Icon(
            Icons.skip_next,
            color: Colors.white,
            size: 35.0,
          ),
          onPressed: playlist.next,
        );
      },
    );
  }
}
