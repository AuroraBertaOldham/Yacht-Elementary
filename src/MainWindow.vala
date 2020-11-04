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
    AboutDialog about_dialog;

    Gtk.Stack view_stack;
    
    Gtk.Button menu_button;

    public MainWindow(Gtk.Application application) {
        Object(application: application);
    
        default_width = 1000;
        default_height = 800;
        
        
        about_dialog = new AboutDialog();             
        
        var header_bar = new Gtk.HeaderBar();
        header_bar.title = _("Yacht");
        header_bar.show_close_button = true;
        set_titlebar(header_bar);
        
        var info_button = new Gtk.MenuButton();
        info_button.image = new Gtk.Image.from_icon_name ("dialog-question", Gtk.IconSize.LARGE_TOOLBAR);
        info_button.tooltip_text = _("Information");
	    info_button.clicked.connect (() => {

	    });
        header_bar.pack_end(info_button);
        
        var info_menu = new Gtk.Menu();
        info_button.popup = info_menu;

        var how_to_play_item = new Gtk.MenuItem.with_label("How to Play");
        info_menu.append(how_to_play_item);
        
        var about_item = new Gtk.MenuItem.with_label("About");
	    about_item.activate.connect(() => {
            about_dialog.show_all();
            about_dialog.run();
            about_dialog.hide();
	    });
        info_menu.append(about_item);
        
        info_menu.show_all ();
                
        menu_button = new Gtk.Button.with_label(_("Main Menu"));
        menu_button.no_show_all =true;
        menu_button.get_style_context ().add_class (Granite.STYLE_CLASS_BACK_BUTTON);
        menu_button.valign = Gtk.Align.CENTER;
	    menu_button.clicked.connect (() => {
            go_to_welcome();
	    });
        header_bar.pack_start(menu_button);
                
        view_stack = new Gtk.Stack();
        add(view_stack);
        
        welcome_view = new WelcomeView();
        welcome_view.game_started.connect((game) => {
            game_view.game = game;
            go_to_game();
        });
        welcome_view.game_continued.connect(() => {
           go_to_game(); 
        });
        view_stack.add(welcome_view);
        
        game_view = new GameView();
        view_stack.add(game_view);
        
        go_to_welcome();
    }
    
    public void go_to_welcome() {
        view_stack.visible_child = welcome_view;
        welcome_view.set_continue_allowed(game_view.game != null);
        menu_button.hide();
    }
    
    public void go_to_game() {
        view_stack.visible_child = game_view;
        menu_button.show();

    }
}
