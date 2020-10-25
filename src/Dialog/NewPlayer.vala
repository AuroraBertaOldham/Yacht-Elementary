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

public class NewPlayerWindow : Gtk.Dialog {

    Player _player;

    Gtk.Entry name_entry;
    Gtk.Switch simulated_switch;
    
    Gtk.Button add_player_button;

    public NewPlayerWindow() {
        default_width = 200;
        default_height = 130;
        deletable = false;
        resizable = false;
        border_width = 5;
        title = _("New Player");

        var window_content = get_content_area();

        var main_grid = new Gtk.Grid ();
        main_grid.column_spacing = 12;
        main_grid.row_spacing = 8;
        window_content.add (main_grid);

        var name_label = new Gtk.Label(_("Name:"));
        name_label.xalign = 0;
        main_grid.attach(name_label, 0, 0, 1, 1);
        
        name_entry = new Gtk.Entry();
        name_entry.halign = Gtk.Align.END;
        name_entry.changed.connect(() => {
           _player.name = name_entry.text; 
           add_player_button.sensitive = _player.name.length > 0;
        });
        main_grid.attach(name_entry, 1, 0, 1, 1);

        var simulated_label = new Gtk.Label(_("Simulated:"));
        simulated_label.xalign = 0;
        main_grid.attach(simulated_label, 0, 1, 1, 1);

        simulated_switch = new Gtk.Switch();
        simulated_switch.halign = Gtk.Align.START;
        simulated_switch.notify["active"].connect(() => {
           _player.simulated = simulated_switch.active;
        });
        main_grid.attach(simulated_switch, 1, 1, 1, 1);

        // Action Buttons
        
        var cancel_button = new Gtk.Button.with_label(_("Cancel")); 
        add_action_widget(cancel_button, 0);
        
        add_player_button = new Gtk.Button.with_label(_("Add Player"));
        add_player_button.sensitive = false;
        //add_player_button.get_style_context ().add_class (Gtk.STYLE_CLASS_SUGGESTED_ACTION);
        add_action_widget(add_player_button, 1);
    }
    
    public Player player 
    { 
        get { return _player; }
        set {
            _player = value;
            name_entry.text = _player.name;
            simulated_switch.active = _player.simulated;
        }
    }
}
