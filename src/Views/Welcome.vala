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

public class WelcomeView : Gtk.Grid {

    NewGameWindow new_game_window;
    ScoresWindow scores_window;
    
    Granite.Widgets.Welcome welcome_widget;
    
    int continue_game_button;
    int new_game_button;
    int scores_button;

    public WelcomeView() {
        new_game_window = new NewGameWindow();
        new_game_window.transient_for = (Gtk.Window)get_window();
        new_game_window.modal = true;
        
        scores_window = new ScoresWindow();
        scores_window.transient_for = (Gtk.Window)get_window();
        scores_window.modal = true;
        
        welcome_widget = new Granite.Widgets.Welcome(_("Welcome to Yacht"), _("How about a game?"));
        
        continue_game_button = welcome_widget.append("media-playback-start", _("Continue Game"), _("Resume your current game from where you left off."));
        new_game_button = welcome_widget.append("input-gaming", _("New Game"), _("Start a new game with real or simulated players."));
        scores_button = welcome_widget.append("trophy-gold", _("View Scores"), _("View all time highscores."));
        
        welcome_widget.activated.connect ((index) => {
            if (index == continue_game_button) {
                game_continued();
            } else if (index == new_game_button) {
                new_game_window.new_game = new Game();
                new_game_window.show_all();
                if (new_game_window.run() == 1) {
                    game_started(new_game_window.new_game);
                }
                new_game_window.hide();
            } else if (index == scores_button) {
                scores_window.show_all();
                scores_window.run();
                scores_window.hide();
            }
        });
        
        add(welcome_widget);
    }
    
    public signal void game_started(Game game);
    
    public signal void game_continued();
    
    public void set_continue_allowed(bool allowed) {
        welcome_widget.set_item_sensitivity(continue_game_button, allowed);
    }
}
