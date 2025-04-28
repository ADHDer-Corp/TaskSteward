import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'package:tasksteward/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TaskSteward Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'TaskSteward Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final record = AudioRecorder();
  String? _tempFilePath;
  String? _audioBase64;

  Future<void> _handleRecording() async {
    if (await record.hasPermission()) {
      // 获取临时目录
      final tempDir = await getTemporaryDirectory();
      _tempFilePath = path.join(tempDir.path, 'audio_recording_${DateTime.now().millisecondsSinceEpoch}.mp3');

      if (_tempFilePath == null) {
        logger.e("临时文件路径为空");
        return;
      }
      
      logger.t("开始录音，保存到: $_tempFilePath");
      
      // 开始录音并保存为MP3文件
      await record.start(
        const RecordConfig(
          encoder: AudioEncoder.aacLc, // MP3编码器
          bitRate: 128000,
          sampleRate: 44100,
        ),
        path: _tempFilePath!,
      );
    }
  }

  Future<void> _handleStopRecording() async {
    // 停止录音
    final path = await record.stop();
    logger.t("录音结束，保存在: $path");
    
    if (path != null) {
      // 读取文件并转换为Base64
      await _convertAudioToBase64(path);
    }
  }
  
  Future<void> _convertAudioToBase64(String filePath) async {
    try {
      final File file = File(filePath);
      final bytes = await file.readAsBytes();
      _audioBase64 = base64Encode(bytes);
      
      logger.t("音频文件已转换为Base64，$_audioBase64}");
      
      setState(() {}); // 更新UI以反映有了base64数据
    } catch (e) {
      logger.e("转换音频文件到Base64时出错: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hi')
          ],
        ),
      ),
      floatingActionButton: GestureDetector(
        onLongPress: () {
          logger.t("Long Press Record button");
          _handleRecording();
        },
        onLongPressEnd: (_) {
          logger.t("Long Press End Record button");
          _handleStopRecording();
        },
        child: FloatingActionButton(
          onPressed: () {
            logger.t("Click Record button");
          },
          child: Icon(Icons.mic, color: theme.colorScheme.onPrimaryContainer,),
        ),
      )
    );
  }
}


