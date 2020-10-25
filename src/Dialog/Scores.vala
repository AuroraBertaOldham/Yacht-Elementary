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

public class ScoresWindow : Gtk.Dialog {
    public ScoresWindow() {
        default_width = 450;
        default_height = 450;
        deletable = false;
        resizable = false;
        border_width = 5;
        title = _("Scores");

        var window_content = get_content_area();

        var main_grid = new Gtk.Grid ();
        main_grid.column_spacing = 12;
        main_grid.row_spacing = 8;
        window_content.add (main_grid);
        
        var close_button = new Gtk.Button.with_label(_("Close")); 
        add_action_widget(close_button, 0);
    }
}
