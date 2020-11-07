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

    List<Gtk.ToggleButton> dice_buttons;
    Gtk.Label turn_label;
    Gtk.Label holding_label;
    Gtk.Label rolls_remaining_label;
    Gtk.Button roll_button;
    
    Gtk.FlowBox players_flow_box;

    public GameView() {      
        Object(orientation: Gtk.Orientation.VERTICAL, spacing: 0);
    
        var dice_area_box = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        dice_area_box.get_style_context ().add_class (Gtk.STYLE_CLASS_VIEW);
        pack_start(dice_area_box, false, false, 0);
    
        var dice_area_grid = new Gtk.Grid();
        dice_area_grid.column_spacing = 12;
        dice_area_grid.row_spacing = 8;
        dice_area_grid.halign = Gtk.Align.CENTER;
        dice_area_grid.margin_top = 10;
        dice_area_grid.margin_bottom = 15;
        dice_area_grid.margin_start = 20;
        dice_area_grid.margin_end = 20;
        dice_area_box.pack_start(dice_area_grid);
        
        turn_label = new Gtk.Label(null);
        turn_label.get_style_context ().add_class (Granite.STYLE_CLASS_H1_LABEL);
        dice_area_grid.attach(turn_label, 0, 0, 9, 1);
        
        rolls_remaining_label = new Gtk.Label(null);
        rolls_remaining_label.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        dice_area_grid.attach(rolls_remaining_label, 0, 2, 1, 1);
        
        dice_buttons = new List<Gtk.ToggleButton>();
        
        var first_dice = new Gtk.ToggleButton();
        first_dice.relief = Gtk.ReliefStyle.NONE;
        first_dice.clicked.connect(() => {
           _game.dice.nth_data(0).hold = dice_buttons.nth_data(0).active;
           update_states();
        });
        dice_area_grid.attach(first_dice, 2, 1, 1, 3);
        dice_buttons.append(first_dice);
        
        var second_dice = new Gtk.ToggleButton();
        second_dice.relief = Gtk.ReliefStyle.NONE;
        second_dice.clicked.connect(() => {
           _game.dice.nth_data(1).hold = dice_buttons.nth_data(1).active;
           update_states();
        });
        dice_area_grid.attach(second_dice, 3, 1, 1, 3);
        dice_buttons.append(second_dice);
                
        var third_dice = new Gtk.ToggleButton();
        third_dice.relief = Gtk.ReliefStyle.NONE;
        third_dice.clicked.connect(() => {
           _game.dice.nth_data(2).hold = dice_buttons.nth_data(2).active;
           update_states();
        });
        dice_area_grid.attach(third_dice, 4, 1, 1, 3);
        dice_buttons.append(third_dice);
                
        var fourth_dice = new Gtk.ToggleButton();
        fourth_dice.relief = Gtk.ReliefStyle.NONE;
        fourth_dice.clicked.connect(() => {
           _game.dice.nth_data(3).hold = dice_buttons.nth_data(3).active;
           update_states();
        });
        dice_area_grid.attach(fourth_dice, 5, 1, 1, 3);
        dice_buttons.append(fourth_dice);
        
        var fifth_dice = new Gtk.ToggleButton();
        fifth_dice.relief = Gtk.ReliefStyle.NONE;
        fifth_dice.clicked.connect(() => {
           _game.dice.nth_data(4).hold = dice_buttons.nth_data(4).active;
           update_states();
        });
        dice_area_grid.attach(fifth_dice, 6, 1, 1, 3);
        dice_buttons.append(fifth_dice);
        
        holding_label = new Gtk.Label(null);
        holding_label.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        dice_area_grid.attach(holding_label, 8, 2, 1, 1);
        
        roll_button = new Gtk.Button.with_label(_("Roll Dice"));     
        roll_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        roll_button.clicked.connect(() => {
            _game.roll_dice();
            update_states();
        });
        dice_area_grid.attach(roll_button, 3, 5, 3, 1);
        
        pack_start(new Gtk.Separator(Gtk.Orientation.HORIZONTAL), false, false, 0);
        
        var players_list_scroll = new Gtk.ScrolledWindow(null, null);
        players_list_scroll.propagate_natural_height = false;
        pack_start(players_list_scroll, true, true, 0);
        
        players_flow_box = new Gtk.FlowBox();
        players_flow_box.orientation = Gtk.Orientation.VERTICAL;
        players_flow_box.selection_mode = Gtk.SelectionMode.NONE;
        players_flow_box.margin = 10;
        players_flow_box.column_spacing = 10;
        players_flow_box.row_spacing = 10;
        players_list_scroll.add(players_flow_box);
    }

    public Game game { 
        get { 
            return _game; 
        } 
        set {
            _game = value;
            create_cards();
            prepare();
            update_states();
        } 
    }
    
    void create_cards() {
        foreach (var player in _game.players) {
            var card = new PlayerCard();
            card.player = player;
            card.show_all();
            players_flow_box.add(card);
        }
    }
    
    PlayerCard get_current_player_card() {
        return (PlayerCard)players_flow_box.get_child_at_index((int)_game.current_turn);
    }
    
    void update_states() {
        var held_dice = _game.count_held();
    
        turn_label.label = _("It's your turn %s").printf(_game.players.nth_data(_game.current_turn).info.name);
        rolls_remaining_label.label = _("%u Rolls Left").printf(_game.rolls_remaining);
        holding_label.label = _("Holding %u").printf(held_dice);
        
        roll_button.sensitive = held_dice < 5 && _game.rolls_remaining > 0;
        
        PlayerCard card = get_current_player_card();
        card.request_player_input(_game.dice);
        card.is_focus = true;
        
        for (var i = 0; i < 5; i++) {
            dice_buttons.nth_data(i).sensitive = _game.rolls_remaining != 3;
        }
        
        update_dice_images();
    }
    
    void prepare() {
        PlayerCard card = get_current_player_card();
        card.request_player_input(_game.dice);
        card.player_input_done.connect(finish_player_score_input);
        
        for (var i = 0; i < 5; i++) {
            dice_buttons.nth_data(i).active = false;
        }
    }
    
    void finish_player_score_input() {
        PlayerCard card = get_current_player_card();
        card.player_input_done.disconnect(finish_player_score_input);
        _game.next_player();
        prepare();
        update_states();
    }
    
    void update_dice_images() {
        for (var i = 0; i < 5; i++) {
            apply_die_image(dice_buttons.nth_data(i), _game.dice.nth_data(i));
        }
    }
    
    void apply_die_image(Gtk.ToggleButton die_button, Die die) {
        switch (die.side) {
            case 0:
                clear_die_image(die_button);
                break;
            case 1:
                die_button.image = new Gtk.Image.from_icon_name ("dice_one", Gtk.IconSize.DIALOG) { pixel_size = 80 };
                break;
            case 2:
                die_button.image = new Gtk.Image.from_icon_name ("dice_two", Gtk.IconSize.DIALOG) { pixel_size = 80 };
                break;
            case 3:
                die_button.image = new Gtk.Image.from_icon_name ("dice_three", Gtk.IconSize.DIALOG) { pixel_size = 80 };
                break;
            case 4:
                die_button.image = new Gtk.Image.from_icon_name ("dice_four", Gtk.IconSize.DIALOG) { pixel_size = 80 };
                break;
            case 5:
                die_button.image = new Gtk.Image.from_icon_name ("dice_five", Gtk.IconSize.DIALOG) { pixel_size = 80 };
                break;
            case 6:
                die_button.image = new Gtk.Image.from_icon_name ("dice_six", Gtk.IconSize.DIALOG) { pixel_size = 80 };
                break;
        }
    }
    
    void clear_die_image(Gtk.ToggleButton die_button) {
        die_button.image = new Gtk.Image.from_icon_name ("dice_none", Gtk.IconSize.DIALOG) { pixel_size = 80 };
    }
}
