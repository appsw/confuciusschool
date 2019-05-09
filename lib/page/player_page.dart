import 'dart:async';
import 'dart:isolate';
import 'dart:ui';

import 'package:audio_service/audio_service.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:confuciusschool/utils/ColorsUtil.dart';
import 'package:flutter/material.dart';
MediaControl playControl = MediaControl(
  androidIcon: 'mipmap/home02_3tinggushituwen_zanting',
  label: 'Play',
  action: MediaAction.play,
);
MediaControl pauseControl = MediaControl(
  androidIcon: 'mipmap/zanting',
  label: 'Pause',
  action: MediaAction.pause,
);
MediaControl stopControl = MediaControl(
  androidIcon: 'mipmap/tingzhi',
  label: 'Stop',
  action: MediaAction.stop,
);


class Player extends StatefulWidget {
  /// [AudioPlayer] 播放地址
  final String audioUrl;

  /// 音量
  final double volume;

  /// 错误回调
  final Function(String) onError;

  ///播放完成
  final Function() onCompleted;

  /// 上一首
  final Function() onPrevious;

  ///下一首
  final Function() onNext;

  final Function(bool) onPlaying;

  final Key key;

  final Color color;

  /// 是否是本地资源
  final bool isLocal;

  const Player(
      {@required this.audioUrl,
        @required this.onCompleted,
        @required this.onError,
        @required this.onNext,
        @required this.onPrevious,
        this.key,
        this.volume: 1.0,
        this.onPlaying,
        this.color: Colors.red,
        this.isLocal: false});

  @override
  State<StatefulWidget> createState() {
    return new PlayerState();
  }
}

class PlayerState extends State<Player> with WidgetsBindingObserver{
  bool isPlaying = false;
  Duration duration;
  Duration position;
  double sliderValue;
  PlaybackState _state;
  StreamSubscription _playbackStateSubscription;
  Completer _completer = Completer();
  IsolateNameServer isolateNameServer;

  @override
  void initState() {
    super.initState();
    ReceivePort receivePort = new ReceivePort();
    SendPort sendPort = receivePort.sendPort;
    IsolateNameServer.registerPortWithName(sendPort, "audio");
    receivePort.listen((data){
      print(data);
      if(data["type"] == 1){
        Duration duration = data["value"];
        setState(() {
          this.duration = duration;

          if (position != null) {
            this.sliderValue = (position.inSeconds / duration.inSeconds);
          }
        });
      }else if(data["type"] == 2){
        Duration position = data["value"];
        setState(() {
          this.position = position;

          if (duration != null) {
            this.sliderValue = (position.inSeconds / duration.inSeconds);
          }
        });
      }else if(data["type"] == 3){
        bool playing = data["value"];
        OnPlayStateChange(playing);
      }
    });

    WidgetsBinding.instance.addObserver(this);

    connect();
//    audioPlayer.play(widget.audioUrl,volume: 0.0);
//    audioPlayer.stop();
//    AudioService.start(
//      backgroundTask: _backgroundAudioPlayerTask,
//      resumeOnClick: true,
//      androidNotificationChannelName: 'Audio Service Demo',
//      notificationColor: 0xFF2196f3,
//      androidNotificationIcon: 'mipmap/ic_launcher',
//    );
    InitService();
//    setState(() {
//      isPlaying = true;
//      widget.onPlaying(isPlaying);
//    });
  }
  void InitService() async {
    bool success = await AudioService.start(
      backgroundTask: _backgroundAudioPlayerTask,
      resumeOnClick: true,
      androidNotificationChannelName: 'Audio Service Demo',
      notificationColor: 0xFF2196f3,
      androidNotificationIcon: 'mipmap/ic_launcher',
    );
    if (success) {
      AudioService.customAction('url', widget.audioUrl);
    }
  }

  @override
  void dispose() {

    disconnect();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        connect();
        break;
      case AppLifecycleState.paused:
        disconnect();
        break;
      default:
        break;
    }
  }

  void connect() async {
    await AudioService.connect();
    if (_playbackStateSubscription == null) {
      _playbackStateSubscription = AudioService.playbackStateStream
          .listen((PlaybackState playbackState) {
        setState(() {
          _state = playbackState;
        });
      });
    }
  }

  void disconnect() {
    if (_playbackStateSubscription != null) {
      _playbackStateSubscription.cancel();
      _playbackStateSubscription = null;
    }
    AudioService.disconnect();
  }

  @override
  void deactivate() {

    super.deactivate();
  }



  String _formatDuration(Duration d) {
    int minute = d.inMinutes;
    int second = (d.inSeconds > 60) ? (d.inSeconds % 60) : d.inSeconds;
    print(d.inMinutes.toString() + "======" + d.inSeconds.toString());
    String format = ((minute < 10) ? "0$minute" : "$minute") +
        ":" +
        ((second < 10) ? "0$second" : "$second");
    return format;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.end,
      children: _controllers(context),
    );
  }

  Widget _timer(BuildContext context) {
    var style = new TextStyle(color: ColorsUtil.GreyTextColor);
    return new Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Text(
          position == null ? "--:--" : _formatDuration(position),
          style: style,
        ),
        Expanded(
          flex: 1,
          child: new Slider(
            onChanged: (newValue) {
              if (duration != null) {
                int seconds = (duration.inSeconds * newValue).round();
                print("audioPlayer.seek: $seconds");
                SendPort sendPort1 = IsolateNameServer.lookupPortByName("audio1");
                var data = Map();
                data["type"] = 2;
                data["value"] = seconds;
                sendPort1.send(data);
              }
            },
            value: sliderValue ?? 0.0,
            activeColor: Colors.red,
            inactiveColor: Colors.grey,
          ),
        ),
        new Text(
          duration == null ? "--:--" : _formatDuration(duration),
          style: style,
        ),
      ],
    );
  }

  List<Widget> _controllers(BuildContext context) {
    print("_controllers");

    return [

      const Divider(color: Colors.transparent),
      const Divider(
        color: Colors.transparent,
        height: 32.0,
      ),
      new Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new IconButton(
              onPressed: () {
                widget.onPrevious();
              },
              icon: new Icon(
                Icons.skip_previous,
                size: 32.0,
                color: widget.color,
              ),
            ),
            new IconButton(
              onPressed: () {
                onPlayBtn();
              },
              padding: const EdgeInsets.all(0.0),
              icon: new Icon(
                isPlaying ? Icons.pause : Icons.play_arrow,
                size: 48.0,
                color: widget.color,
              ),
            ),
            new IconButton(
              onPressed: widget.onNext,
              icon: new Icon(
                Icons.skip_next,
                size: 32.0,
                color: widget.color,
              ),
            ),
          ],
        ),
      ),

      new Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: _timer(context),
      ),
    ];
  }
  void onPlayBtn(){
    if (isPlaying) {
      AudioService.pause();
    } else {
      if(AudioServiceBackground.state.basicState == BasicPlaybackState.stopped){
        AudioService.start(
          backgroundTask: _backgroundAudioPlayerTask,
          resumeOnClick: true,
          androidNotificationChannelName: 'Audio Service Demo',
          notificationColor: 0xFF2196f3,
          androidNotificationIcon: 'mipmap/ic_launcher',
        );
      }else{
        AudioService.play();
      }
    }
    setState(() {
      isPlaying = !isPlaying;
      widget.onPlaying(isPlaying);
    });
  }
  void OnPlayStateChange(bool playing){
    if(playing){
      setState(() {
        isPlaying = true;
        widget.onPlaying(isPlaying);
      });
    }else{
      setState(() {
        isPlaying = false;
        widget.onPlaying(isPlaying);
      });
    }

  }

}

void _backgroundAudioPlayerTask() async {
  CustomAudioPlayer player = new CustomAudioPlayer();
  AudioServiceBackground.run(
    onStart: player.run,
    onPlay: player.play,
    onPause: player.pause,
    onStop: player.stop,
    onClick: (MediaButton button) => player.playPause(),
    onCustomAction: (String name, dynamic arguments) {
      switch (name) {
        case "url":
          String url = arguments;
          player.streamUri = url;
        break;
      }
    },
  );
}

class CustomAudioPlayer {
  String _streamUri;
  AudioPlayer _audioPlayer = new AudioPlayer();
  Completer _completer = Completer();
  SendPort sendPort = IsolateNameServer.lookupPortByName("audio");

  set streamUri(String value) {
    _streamUri = value;
  }

  Future<void> run() async {

    MediaItem mediaItem = MediaItem(
        id: 'audio_1',
        album: 'Sample Album',
        title: 'Sample Title',
        artist: 'Sample Artist');

    AudioServiceBackground.setMediaItem(mediaItem);
    var data = Map();
    _audioPlayer
    ..durationHandler = ((duration) {
      data["type"] = 1;
      data["value"] = duration;
      sendPort.send(data);
    })
    ..positionHandler = ((position) {
      data["type"] = 2;
      data["value"] = position;
      sendPort.send(data);
    });
    ReceivePort receivePort = new ReceivePort();
    SendPort sendPort1 = receivePort.sendPort;
    IsolateNameServer.registerPortWithName(sendPort1, "audio1");
    receivePort.listen((data){
      switch(data["type"]){
        case 1:
          streamUri = data;
          break;
        case 2:
          _audioPlayer.seek(new Duration(seconds: data));
          break;
      }

    });

    var playerStateSubscription = _audioPlayer.onPlayerStateChanged
        .where((state) => state == AudioPlayerState.COMPLETED)
        .listen((state) {
      stop();
    });
//    play();
    await _completer.future;
    playerStateSubscription.cancel();
  }

  void playPause() {

    if (AudioServiceBackground.state.basicState == BasicPlaybackState.playing){
      pause();

    }
    else{
      play();

    }

  }

  void play() {
    _audioPlayer.play(_streamUri);
    AudioServiceBackground.setState(
      controls: [pauseControl, stopControl],
      basicState: BasicPlaybackState.playing,
    );
    var data = Map();
    data["type"] = 3;
    data["value"] = true;
    sendPort.send(data);
  }

  void pause() {
    _audioPlayer.pause();
    AudioServiceBackground.setState(
      controls: [playControl, stopControl],
      basicState: BasicPlaybackState.paused,
    );
    var data = Map();
    data["type"] = 3;
    data["value"] = false;
    sendPort.send(data);
  }

  void stop() {
    _audioPlayer.stop();
    AudioServiceBackground.setState(
      controls: [],
      basicState: BasicPlaybackState.stopped,
    );
    _completer.complete();
  }

}