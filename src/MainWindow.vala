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

public class MainWindow : Gtk.ApplicationWindow {
    
    WelcomeView welcome_view;
    GameView game_view;

    Gtk.Stack stack;

    public MainWindow(Gtk.Application application) {
        Object(application: application);
    
        default_width = 800;
        default_height = 600;
        title = _("Yacht");
        
        stack = new Gtk.Stack();
        add(stack);
        
        welcome_view = new WelcomeView();
        welcome_view.game_started.connect(() => {
            go_to_game();
        });
        stack.add(welcome_view);
        
        game_view = new GameView();
        stack.add(game_view);
        
        go_to_welcome();
    }
    
    public void go_to_welcome() {
        stack.visible_child = welcome_view;
    }
    
    public void go_to_game() {
        stack.visible_child = game_view;
    }
}
