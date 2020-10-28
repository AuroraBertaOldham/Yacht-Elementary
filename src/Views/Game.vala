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

public class GameView : Gtk.Box {

    Game _game;

    Gtk.Button first_dice;
    Gtk.Button second_dice;
    Gtk.Button third_dice;
    Gtk.Button fourth_dice;
    Gtk.Button fifth_dice;

    public GameView() {
        Object(orientation: Gtk.Orientation.VERTICAL, spacing: 0);
                
        var dice_area_grid = new Gtk.Grid();
        pack_start(dice_area_grid, true, true, 0);

        first_dice = new Gtk.Button();
        dice_area_grid.attach(first_dice, 0, 0, 1, 1);
        
        second_dice = new Gtk.Button();
        dice_area_grid.attach(second_dice, 1, 0, 1, 1);
        
        third_dice = new Gtk.Button();
        dice_area_grid.attach(third_dice, 2, 0, 1, 1);
        
        fourth_dice = new Gtk.Button();
        dice_area_grid.attach(fourth_dice, 3, 0, 1, 1);
        
        fifth_dice = new Gtk.Button();
        dice_area_grid.attach(fifth_dice, 4, 0, 1, 1);
        
        var players_list_scroll = new Gtk.ScrolledWindow(null, null);
        players_list_scroll.expand = true;
        pack_start(players_list_scroll, true, true, 0);
        
        update_dice_images();
    }

    public Game game { 
        get { 
            return _game; 
        } 
        set {
            _game = value;
        } 
    }
    
    void update_dice_images() {
        first_dice.image = new Gtk.Image.from_icon_name ("dice_six", Gtk.IconSize.DIALOG) { pixel_size = 100 };
        second_dice.image = new Gtk.Image.from_icon_name ("dice_two", Gtk.IconSize.DIALOG) { pixel_size = 100 };
        third_dice.image = new Gtk.Image.from_icon_name ("dice_three", Gtk.IconSize.DIALOG) { pixel_size = 100 };
        fourth_dice.image = new Gtk.Image.from_icon_name ("dice_four", Gtk.IconSize.DIALOG) { pixel_size = 100 };
        fifth_dice.image = new Gtk.Image.from_icon_name ("dice_five", Gtk.IconSize.DIALOG) { pixel_size = 100 };
    }
}
