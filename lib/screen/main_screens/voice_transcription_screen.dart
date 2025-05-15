import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class CombinedTranscriptionScreen extends StatefulWidget {
  @override
  _CombinedTranscriptionScreenState createState() => _CombinedTranscriptionScreenState();
}

class _CombinedTranscriptionScreenState extends State<CombinedTranscriptionScreen> with TickerProviderStateMixin {
  bool isRecording = false;
  String transcriptionText = "Tap mic or upload audio file.";
  String ocrText = "Select an image to extract text.";
  File? selectedImage;

  final picker = ImagePicker();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
        ocrText = "Extracting text from image..."; // Simulated
      });

      await Future.delayed(Duration(seconds: 2)); // Simulate delay
      setState(() {
        ocrText = "Simulated OCR text from selected image.";
      });
    }
  }

  void _toggleRecording() {
    setState(() {
      isRecording = !isRecording;
      transcriptionText = isRecording ? "Recording audio..." : "Recording stopped.";
    });
  }

  void _uploadAudio() {
    setState(() {
      transcriptionText = "Uploading audio and transcribing...";
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        transcriptionText = "Simulated transcription result.";
      });
    });
  }

  Widget buildAudioTab() {
    return Column(
      children: [
        SizedBox(height: 20),
        Center(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(20),
              backgroundColor: Color.fromARGB(255, 27, 19, 19),
            ),
            onPressed: _toggleRecording,
            child: Icon(
              isRecording ? Icons.stop : Icons.mic,
              size: 32,
              color: Color.fromARGB(255, 238, 110, 210),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
          child: ElevatedButton.icon(
            icon: Icon(Icons.upload_file),
            label: Text("Upload Audio", selectionColor: Colors.white12,),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 238, 110, 210),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            onPressed: _uploadAudio,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 120,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 238, 110, 210),
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              child: Text(
                transcriptionText,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text("Transcription History", style: TextStyle(color: Colors.black)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.history, color:Color.fromARGB(255, 238, 110, 210),),
                title: Text("Sample transcription #$index", style: TextStyle(color: Colors.black)),
                subtitle: Text("Lorem ipsum...", style: TextStyle(color: Colors.black)),
              );
            },
          ),
        )
      ],
    );
  }

  Widget buildOcrTab() {
    return Column(
      children: [
        SizedBox(height: 20),
        ElevatedButton.icon(
          icon: Icon(Icons.image),
          label: Text("Select Image"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red.shade800,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          onPressed: _pickImage,
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 120,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: SingleChildScrollView(
              child: Text(
                ocrText,
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text("OCR History", style: TextStyle(color: Colors.white70)),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Icon(Icons.text_snippet, color: Colors.redAccent),
                title: Text("OCR result #$index", style: TextStyle(color: Colors.black)),
                subtitle: Text("Lorem text from image...", style: TextStyle(color: Colors.black)),
              );
            },
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Smart Extractor"),
        backgroundColor: Color.fromARGB(159, 190, 97, 97),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: [
            Tab(icon: Icon(Icons.mic), text: "Voice"),
            Tab(icon: Icon(Icons.image), text: "Image"),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          buildAudioTab(),
          buildOcrTab(),
        ],
      ),
    );
  }
}
