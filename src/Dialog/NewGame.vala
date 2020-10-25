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

public class NewGameWindow : Gtk.Dialog {

    Game _new_game;
    
    NewPlayerWindow new_player_window;
    
    Gtk.ListBox players_list_box;
    Gtk.Button remove_player_button;
    Gtk.Button start_game_button;

    public NewGameWindow() {
        default_width = 400;
        default_height = 350;
        deletable = false;
        resizable = false;
        border_width = 5;
        title = _("New Game");

        new_player_window = new NewPlayerWindow();
        new_player_window.modal = true;
        new_player_window.transient_for = this;
            
        var window_content = get_content_area();

        var main_grid = new Gtk.Grid ();
        main_grid.column_spacing = 12;
        main_grid.row_spacing = 8;
        window_content.add (main_grid);
        
        var players_icon = new Gtk.Image.from_icon_name("avatar-default", Gtk.IconSize.DIALOG);
        main_grid.attach(players_icon, 0, 0, 1, 1);
                
        var players_label = new Gtk.Label("Players");
        players_label.xalign = 0;
        players_label.hexpand = true;
        players_label.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        main_grid.attach(players_label, 1, 0, 1, 1);
        
        // Player List 
        
        // This list and action bar is based off of https://github.com/elementary/switchboard-plug-keyboard/blob/master/src/Views/Shortcuts.vala
        
        var players_frame = new Gtk.Frame(null);
        main_grid.attach(players_frame, 0, 1, 2, 1);
                
        var players_grid = new Gtk.Grid();
        players_frame.add(players_grid);       
                
        var players_list_scroll = new Gtk.ScrolledWindow(null, null);
        players_list_scroll.expand = true;
        players_grid.attach(players_list_scroll, 0, 0, 1, 1);
                
        players_list_box = new Gtk.ListBox();
        players_list_box.selection_mode = Gtk.SelectionMode.SINGLE;
        players_list_box.row_selected.connect((row) => {
            remove_player_button.sensitive = row != null;
        });
        players_list_scroll.add(players_list_box);
         
         var player_list_action_bar = new Gtk.ActionBar ();
        player_list_action_bar.hexpand = true;
        player_list_action_bar.get_style_context ().add_class (Gtk.STYLE_CLASS_INLINE_TOOLBAR);
        player_list_action_bar.get_style_context ().add_class (Gtk.STYLE_CLASS_FLAT);
        players_grid.attach(player_list_action_bar, 0, 1, 1, 1);
         
        var add_player_button = new Gtk.Button.from_icon_name ("list-add-symbolic", Gtk.IconSize.SMALL_TOOLBAR);
        add_player_button.tooltip_text = _("Add");
	    add_player_button.clicked.connect (() => {
	        new_player_window.player = new Player.empty();
            new_player_window.show_all();
            if (new_player_window.run() == 1) {
                new_game.players.append(new_player_window.player);
                refresh_widgets();
            }
            new_player_window.hide();
	    });
        player_list_action_bar.add(add_player_button);
		        
        remove_player_button = new Gtk.Button.from_icon_name ("list-remove-symbolic", Gtk.IconSize.SMALL_TOOLBAR);
        remove_player_button.sensitive = false;
        remove_player_button.tooltip_text = _("Remove");
        remove_player_button.clicked.connect(() => {
            var row = (PlayerListRow)players_list_box.get_selected_row();
            _new_game.players.remove(row.player);
            refresh_widgets();
        });
        player_list_action_bar.add(remove_player_button);
             
        // Action Buttons
        
        var cancel_button = new Gtk.Button.with_label(_("Cancel")); 
        add_action_widget(cancel_button, 0);
        
        start_game_button = new Gtk.Button.with_label(_("Start Game"));
        start_game_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);
        add_action_widget(start_game_button, 1);
    }
    
    public Game new_game { 
        get { 
            return _new_game; 
        } 
        set {
            _new_game = value;
            refresh_widgets();
        } 
    }
    
    void refresh_widgets() {
        foreach (Gtk.Widget row in players_list_box.get_children ()) {
            row.destroy();
        }
            
        var playerCount = new_game.players.length();
            
        for (var i = 0; i < playerCount; i++) {
            var player_row = new PlayerListRow();
            player_row.player = new_game.players.nth_data(i);
            player_row.show_all();
            players_list_box.add(player_row);
        }
        
        start_game_button.sensitive = playerCount > 0;
    }
}
