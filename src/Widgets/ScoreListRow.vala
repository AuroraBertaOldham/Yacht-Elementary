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

public class ScoreListRow : Gtk.ListBoxRow {

    Player _player;

    Gtk.Label name_label;
    Gtk.Label value_label;

    public ScoreListRow() {
        var main_box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 50);
        add(main_box);
        
        name_label = new Gtk.Label(null);
        name_label.xalign = 0;
        name_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_box.pack_start(name_label, true, true, 5);
        
        value_label = new Gtk.Label(_("Simulated"));
        value_label.xalign = 1;
        value_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_box.pack_end(value_label, true, true, 5);
    }
    
    public Player player 
    { 
        get { return _player; }
        set {
            _player = value;
            name_label.label = _player.info.name;
            value_label.label = _player.scores.sum().to_string();
        }
    }
    
}
