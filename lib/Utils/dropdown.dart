import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moviestream/Backend/episode.dart';

class Dropdown extends StatefulWidget {
  final int seasonCount;
  var episodes = <int, List<EpisodeElement>>{}.obs;

  Dropdown({required this.seasonCount, required this.episodes});

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
    selectedSeasonEpisodes = widget.episodes[1] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    List<String> _options =
        List.generate(widget.seasonCount, (index) => 'Season ${index + 1}');

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
                selectedSeasonEpisodes = widget.episodes[seasonNumber] ?? [];
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
              return EpisodeListTile(episode: selectedSeasonEpisodes[index]);
            },
          ),
        ),
      ],
    );
  }
}

class EpisodeListTile extends StatelessWidget {
  final EpisodeElement episode;

  EpisodeListTile({required this.episode});

  @override
  Widget build(BuildContext context) {
    String truncatedOverview =
        '${episode.overview!.split(' ').take(2).join(' ')}...';

    return ListTile(
      leading: episode.stillPath != null
          ? Image.network(episode.stillPath!)
          : Icon(Icons.image),
      title: Text(episode.name ?? 'Unknown Episode'),
      subtitle: Text(
        truncatedOverview,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {
        // Handle tap on the tile if needed
      },
    );
  }
}
