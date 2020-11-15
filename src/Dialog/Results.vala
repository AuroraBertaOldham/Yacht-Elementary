/*
* Yacht
* Copyright (c) 2020 Aurora Berta-Oldham
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

public class ResultsDialog : Gtk.Dialog {
    
    Gtk.Label winner_label;
    Gtk.ListBox players_list;
    
    unowned List<Player> _players;
    
    public ResultsDialog() {
        default_width = 500;
        default_height = 600;
        deletable = false;
        resizable = false;
        border_width = 10;
        title = _("Scores");

        var window_content = get_content_area();

        var main_grid = new Gtk.Grid ();
        main_grid.column_spacing = 12;
        main_grid.row_spacing = 8;
        main_grid.margin_bottom = 5;
        window_content.add (main_grid);
        
        var trophy = new Gtk.Image.from_icon_name("trophy-gold", Gtk.IconSize.DIALOG);
        main_grid.attach(trophy, 0, 0, 1, 1);
                
        winner_label = new Gtk.Label("");
        winner_label.get_style_context ().add_class (Granite.STYLE_CLASS_H1_LABEL);
        winner_label.margin_bottom = 5;
        main_grid.attach(winner_label, 0, 1, 1, 1);
              
        var player_list_frame = new Gtk.Frame(null);
        main_grid.attach(player_list_frame, 0, 3, 1, 1);
      
        var players_list_scroll = new Gtk.ScrolledWindow(null, null);
        players_list_scroll.expand = true;
        player_list_frame.add(players_list_scroll);
      
        players_list = new Gtk.ListBox();
        players_list_scroll.add(players_list);
        
        var rematch_button = new Gtk.Button.with_label(_("Rematch"));          
        add_action_widget(rematch_button, 1);
        
        var main_menu_button = new Gtk.Button.with_label(_("Main Menu")); 
        main_menu_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);
        add_action_widget(main_menu_button, 0);                   
    }
    
    public unowned List<Player> players {
        get { 
            return _players; 
        } 
        set {
            _players = value;
            update_states();
        } 
    }
    
    void update_states() {
        var ordered_scores = _players.copy();
        
        ordered_scores.sort((left, right) => {
           var left_sum = left.scores.sum();
           var right_sum = right.scores.sum();
           return (int)(left_sum > right_sum) - (int)(left_sum < right_sum);
        });
        
        var winner = ordered_scores.nth_data(0);
        
        winner_label.label = _("%s Wins").printf(winner.info.name);
    }
}
