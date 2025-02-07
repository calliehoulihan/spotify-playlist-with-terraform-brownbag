terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.6"
      source  = "conradludgate/spotify"
    }
  }
}

provider "spotify" {
  api_key = var.spotify_api_key
}

#### Examples ####

# Song by URL
data "spotify_track" "ninetofive_dollyp" {
  url = "https://open.spotify.com/track/4w3tQBXhn5345eUXDGBWZG?si=dc7cdcab78ef406d"
}

# Song by ID
data "spotify_track" "jolene_dollyp" {
  # Take a look at the url below --> track == 5fdhThPDe6jQQDqCyWrdAn
  # https://open.spotify.com/track/5fdhThPDe6jQQDqCyWrdAn?si=615eb81192da4028
  spotify_id = "5fdhThPDe6jQQDqCyWrdAn"
}

## List of Songs by Artist Search
data "spotify_search_track" "queen_topsongs" {
  artist = "Queen"
  #  album = "A Night At The Opera"
  #  name  = "Bohemian Rhapsody - Remastered 2011"
}

data "spotify_track" "ribs_lorde" {
  spotify_id = "2MvvoeRt8NcOXWESkxWn3g"
}

data "spotify_track" "DontBringMeDown_ELO" {
  spotify_id = "72ahyckBJfTigJCFCviVN7"
}

data "spotify_track" "Goodbye_Stranger_Supertramp" {
  spotify_id = "5dE8s6uWRGNc1Ac7y8rULq"
}

data "spotify_track" "cheeseburger_jimmybuffet" {
  spotify_id = "6VeZ970uI0Yi6sjBgyFBrp"
}

## Added by Sydney Cholewinski
data "spotify_track" "callmeback_thestrokes" {
  spotify_id = "6z5mh42xSM54RncKZMM8hS"
}

## Added by Mithell Ciupak
data "spotify_track" "dreams_fleetwoodmac" {
  spotify_id = "0ofHAoxe9vBkTCp2UQIavz"
}

## Added by Ana Dalipi
data "spotify_track" "modjo_jojo" {
  spotify_id = "49X0LAl6faAusYq02PRAY6"
}


#### Playlsit ####

resource "spotify_playlist" "playlist" {
  name        = "Nashville 2022 Brownbag Playlist"
  description = "Learn more at https://github.com/mitchellciupak/spotify-playlist-with-terraform-brownbag"
  public      = true

  tracks = [
    data.spotify_track.ninetofive_dollyp.id,
    data.spotify_track.jolene_dollyp.id,
    data.spotify_search_track.queen_topsongs.tracks[0].id,
    data.spotify_search_track.queen_topsongs.tracks[1].id,
    data.spotify_search_track.queen_topsongs.tracks[2].id,
    data.spotify_track.dreams_fleetwoodmac.id,
    data.spotify_track.cheeseburger_jimmybuffet.id,
    data.spotify_track.ribs_lorde.id,
    data.spotify_track.DontBringMeDown_ELO.id,
    data.spotify_track.Goodbye_Stranger_Supertramp.id,
    data.spotify_track.callmeback_thestrokes.id,
  ]
}
