{...}: {
  rysieko.subtui = {
    enable = true;
    settings = {
      app = {
        replaygain = "track";
        gapless_playback = "yes";
        desktop_notifications = false;
        discord_rich_presence = true;
        default_volume = 90;
      };
      theme = {
        display_album_art = true;
      };
      columns = {
        songs = {
          track_number = false;
          title = true;
          artist = true;
          album = true;
          year = false;
          genre = false;
          rating = false;
          play_count = false;
          duration = true;
        };
        albums = {
          name = true;
          artist = true;
          song_count = false;
          year = false;
          genre = false;
          rating = true;
          duration = true;
        };
        artist = {
          name = true;
          album_count = true;
          rating = true;
        };
      };
      binds = {
        global = {
          cycle_focus_next = ["tab"];
          cycle_focus_prev = ["shift+tab"];
          back = ["backspace" "esc"];
          help = ["?"];
          quit = ["q"];
          hard_quit = ["ctrl+c"];
        };
        navigation = {
          up = ["k" "up"];
          down = ["j" "down"];
          top = ["gg"];
          bottom = ["G"];
          select = ["enter"];
          toggle_selection = ["x"];
          play_shuffled = ["alt+enter"];
          go_half_page_up = ["ctrl+u"];
          go_half_page_down = ["ctrl+d"];
        };
        search = {
          focus_search = ["/"];
          filter_next = ["ctrl+n"];
          filter_prev = ["ctrl+b"];
        };
        library = {
          add_to_playlist = ["A"];
          add_rating = ["R"];
          go_to_album = ["ga"];
          go_to_artist = ["gr"];
          rate_0 = ["0"];
          rate_1 = ["1"];
          rate_2 = ["2"];
          rate_3 = ["3"];
          rate_4 = ["4"];
          view_favorites = ["F"];

          rate_5 = ["5"];
        };
        media = {
          play_pause = ["p" "P"];
          next = ["n"];
          prev = ["b"];
          shuffle = ["S"];
          loop = ["L"];
          restart = ["w"];
          rewind = [","];
          forward = [";"];
          volume_up = ["v"];
          volume_down = ["V"];
          toggle_media_player = ["m" "M"];
        };
        queue = {
          toggle_queue_view = ["Q"];
          queue_next = ["N"];
          queue_last = ["a"];
          remove_from_queue = ["d"];
          clear_queue = ["D"];
          move_up = ["K"];
          move_down = ["J"];
        };
      };
    };
  };
}
