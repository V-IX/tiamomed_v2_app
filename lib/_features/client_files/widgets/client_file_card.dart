import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' as bloc;
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../constants/image_paths.dart';
import '../../../utils/other/file_utils.dart';
import '../models/client_file.dart';
import '../state/download_client_file_bloc.dart';

class ClientFileCard extends StatefulWidget {
  const ClientFileCard({super.key, required this.file});

  final ClientFile file;

  @override
  State<ClientFileCard> createState() => _ClientFileCardState();
}

class _ClientFileCardState extends State<ClientFileCard> {
  bool _fileExists = false;
  bool _isLoaded = false;

  @override
  void initState() {
    _checkFile();
    super.initState();
  }

  Future<void> _checkFile() async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final File file = File('${dir.path}/${widget.file.name}');
    final bool exists = await file.exists();
    setState(() {
      _fileExists = exists;
      _isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_fileExists) {
      return _body(
        icon: SizedBox(width: 64, height: 64, child: Image.asset(pdfFileIconPath)),
        file: widget.file,
        onTap: () async {
          final Directory dir = await getApplicationDocumentsDirectory();
          final String filePath = '${dir.path}/${widget.file.name}';
          await OpenFile.open(filePath, type: 'application/pdf');
        },
      );
    }
    return bloc.BlocProvider(
      create: (BuildContext context) {
        return DownloadClientFileBloc(clientFilesRepository: context.read());
      },
      child: bloc.BlocConsumer<DownloadClientFileBloc, DownloadClientFileState>(
        listener: (BuildContext context, DownloadClientFileState downloadState) {
          if (downloadState.status == DownloadClientFileStatus.success) {
            _checkFile();
          }
        },
        builder: (BuildContext context, DownloadClientFileState downloadState) {
          return _body(
            file: widget.file,
            icon: SizedBox(
              width: 64,
              height: 64,
              child: Stack(
                children: [
                  Align(child: Image.asset(pdfFileEmptyIconPath)),
                  if (downloadState.status == DownloadClientFileStatus.loading)
                    Positioned(
                      left: 16,
                      right: 16,
                      bottom: 10,
                      top: 22,
                      child: Stack(
                        children: [
                          Align(child: CircularProgressIndicator(value: downloadState.progress/100, color: Colors.white, strokeWidth: 2)),
                          Align(
                            child: Text(
                              '${downloadState.progress}',
                              style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                    )
                  else if (downloadState.status == DownloadClientFileStatus.initial)
                    const Positioned(
                        top: 22,
                        bottom: 10,
                        left: 0,
                        right: 0,
                        child: Icon(Icons.download, color: Colors.white))
                ],
              )
            ),
            onTap: () async {
              if (_fileExists) {
                final Directory dir = await getApplicationDocumentsDirectory();
                final String filePath = '${dir.path}/${widget.file.name}';
                await OpenFile.open(filePath, type: 'application/pdf');
              } else {
                if (_isLoaded) {
                  try {
                    final Directory directory =
                        await getApplicationDocumentsDirectory();
                    final String targetSavePath = directory.path;
                    print("Will save to: $targetSavePath");

                    context.read<DownloadClientFileBloc>().add(
                      StartDownloadClientFileEvent(
                        fileName: widget.file.name,
                        // The name of the file to download
                        savePath: targetSavePath,
                      ),
                    );
                  } catch (e) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text('Error getting save path: $e')));
                  }
                }
              }
            },
          );
        },
      ),
    );
  }

  Widget _body({required Widget icon, required ClientFile file, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      title: Row(
        children: <Widget>[
          icon,
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(file.modified),
              Text(file.name),
              Text(formatBytes(file.size, 2)),
            ],
          ),
        ],
      ),
    );
  }
}
