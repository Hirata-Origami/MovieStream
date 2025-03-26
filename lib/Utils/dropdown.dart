import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestream/Backend/episode.dart';
import 'package:moviestream/Utils/player.dart';

class Dropdown extends StatefulWidget {
  var season = <int, List<EpisodeElement>>{}.obs;
  final String id;

  Dropdown({required this.season, required this.id});

  @override
  _DropdownState createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? _selectedValue;
  List<EpisodeElement> selectedSeasonEpisodes = [];

  @override
  void initState() {
    super.initState();
    _selectedValue = 'Season 1';
    selectedSeasonEpisodes = widget.season[1] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    List<String> _options =
        List.generate(widget.season.length, (index) => 'Season ${index + 1}');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: DropdownButton<String>(
            value: _selectedValue,
            onChanged: (String? newValue) {
              setState(() {
                _selectedValue = newValue;
                int seasonNumber = int.parse(newValue!.split(' ')[1]);
                selectedSeasonEpisodes = widget.season[seasonNumber] ?? [];
              });
            },
            items: _options.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ),
        Container(
          height: 300,
          child: ListView.builder(
            itemCount: selectedSeasonEpisodes.length,
            itemBuilder: (context, index) {
              return EpisodeListTile(
                  episode: selectedSeasonEpisodes[index], id: widget.id);
            },
          ),
        ),
      ],
    );
  }
}

class EpisodeListTile extends StatelessWidget {
  final EpisodeElement episode;
  final String id;

  const EpisodeListTile({required this.episode, required this.id, super.key});

  @override
  Widget build(BuildContext context) {
    String truncatedOverview =
        '${episode.overview!.split(' ').take(6).join(' ')}...';

    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: episode.stillPath != null
              ? Image.network(
                  'https://image.tmdb.org/t/p/w500${episode.stillPath!}',
                  width: 80,
                  height: 45,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.broken_image),
                )
              : const Icon(Icons.image, size: 45),
        ),
        title: Text(
          episode.name ?? 'Unknown Episode',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            truncatedOverview,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ),
        trailing: const Icon(Icons.play_circle_outline, size: 28),
        onTap: () {
          Get.to(() => VideoPlayerScreen(
                isTv: true,
                movieId: id,
                seriesId: id,
                seasonNumber: episode.seasonNumber!,
                episodeNumber: episode.episodeNumber!,
              ));
        },
      ),
    );
  }
}
