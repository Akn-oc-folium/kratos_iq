import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:kratos_iq/ui/common/app_colors.dart';
import 'package:kratos_iq/ui/common/ui_helpers.dart';
import 'package:kratos_iq/ui/views/main_layout/main_layout_view.dart';
import 'package:kratos_iq/ui/views/video_feed/video_feed_viewmodel.dart';
import 'package:stacked/stacked.dart';

class VideoFeedViewDesktop extends ViewModelWidget<VideoFeedViewModel> {
  const VideoFeedViewDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, VideoFeedViewModel viewModel) {
    return ViewModelBuilder<VideoFeedViewModel>.reactive(
      viewModelBuilder: () => VideoFeedViewModel(),
      onViewModelReady: (model) async {
        await model.initRendererAndConnect();
      },
      builder: (context, viewModel, child) => MainLayoutView(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 32.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'KratosIQ Live Video Feed',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    vertical16,
                    Container(
                      height: 400,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Stack(
                          children: [
                            if (!viewModel.isStreaming)
                              const Center(
                                child: Text(
                                  'Video placeholder\n(connected, waiting for stream)',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            if (viewModel.isStreaming)
                              RTCVideoView(
                                viewModel.renderer,
                                objectFit: RTCVideoViewObjectFit
                                    .RTCVideoViewObjectFitCover,
                              ),
                          ],
                        ),
                      ),
                    ),
                    vertical16,
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: viewModel.isStreaming ? 0.4 : 0.0,
                              backgroundColor: Colors.grey.shade300,
                              color: kcLime500,
                              minHeight: 6,
                            ),
                          ),
                          vertical08,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                viewModel.isStreaming
                                    ? '21:05 / 51:30'
                                    : '00:00 / 00:00',
                                style: const TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed:
                                        viewModel.isStreaming ? () {} : null,
                                    icon: const Icon(Icons.fast_rewind),
                                  ),
                                  horizontal04,
                                  Container(
                                    width: 36,
                                    height: 36,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: viewModel.isStreaming
                                          ? kcLime300
                                          : Colors.grey,
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        viewModel.isStreaming
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                      onPressed: viewModel.isStreaming
                                          ? () {
                                              viewModel.stopStream();
                                            }
                                          : () async {
                                              await viewModel
                                                  .initRendererAndConnect();
                                            },
                                    ),
                                  ),
                                  horizontal04,
                                  IconButton(
                                    onPressed:
                                        viewModel.isStreaming ? () {} : null,
                                    icon: const Icon(Icons.fast_forward),
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 6),
                                decoration: BoxDecoration(
                                  color: viewModel.isStreaming
                                      ? kcLime300
                                      : kcGray400,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  viewModel.isStreaming ? 'Live' : 'Offline',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              horizontal32,
              horizontal16,
              const Expanded(
                flex: 1,
                child: _MeasurableColumn(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MeasurableColumn extends StatelessWidget {
  const _MeasurableColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Measurable',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        vertical16,
        Container(
          height: 140,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2E7D32), Color(0xFF388E3C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Text(
                    '24.3°C',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.cloud_queue,
                    size: 32,
                    color: Colors.white70,
                  ),
                ],
              ),
              vertical08,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildMiniWeatherColumn('Today', '20.3°', Icons.wb_sunny),
                  _buildMiniWeatherColumn('Tue', '20.1°', Icons.cloud),
                  _buildMiniWeatherColumn('Wed', '20.3°', Icons.cloud_queue),
                  _buildMiniWeatherColumn('Thu', '20.3°', Icons.wb_twilight),
                ],
              ),
            ],
          ),
        ),
        vertical08,
        vertical04,
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green.shade800,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Air Quality Index',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  vertical04,
                  Text(
                    'Good',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Humidity',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  vertical04,
                  Text(
                    '52%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        vertical08,
        vertical04,
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green.shade900,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '320 lux',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.lightbulb,
                size: 32,
                color: Colors.yellowAccent,
              ),
            ],
          ),
        ),
        vertical08,
        vertical04,
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green.shade800,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '47 dB',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.speaker,
                size: 32,
                color: Colors.white70,
              ),
            ],
          ),
        ),
        vertical08,
        vertical04,
        Container(
          height: 80,
          decoration: BoxDecoration(
            color: Colors.green.shade900,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '23 laptops',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.laptop_mac,
                size: 32,
                color: Colors.white70,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildMiniWeatherColumn(String day, String temp, IconData iconData) {
    return Column(
      children: [
        Text(
          day,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
        const SizedBox(height: 2),
        Icon(
          iconData,
          size: 16,
          color: Colors.white70,
        ),
        const SizedBox(height: 2),
        Text(
          temp,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
      ],
    );
  }
}
