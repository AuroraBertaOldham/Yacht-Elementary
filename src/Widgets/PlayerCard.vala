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

public class PlayerCard : Gtk.FlowBoxChild {

    Player _player;
    Scores _available_scores;

    Gtk.Label name_label;
    Gtk.Label points_label;
    
    Gtk.Label bonus_label;
    Gtk.Button bonus_value_button;

    Gtk.Button[] score_buttons;

    public PlayerCard() {   
        var box = new Gtk.Box(Gtk.Orientation.HORIZONTAL, 0);
        box.get_style_context().add_class (Gtk.STYLE_CLASS_VIEW);
        box.get_style_context().add_class (Granite.STYLE_CLASS_CARD);
        add(box);
    
        var main_grid = new Gtk.Grid();
        main_grid.margin = 10;
        main_grid.column_spacing = 20;
        main_grid.column_homogeneous = true;
        box.pack_start(main_grid, true, true, 0);
        
        name_label = new Gtk.Label("Player Name");
        name_label.expand = true;
        name_label.xalign = 0;
        name_label.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        main_grid.attach(name_label, 0, 0, 2, 1);
                
        points_label = new Gtk.Label("250 pts");
        points_label.expand = true;
        points_label.xalign = 1;
        points_label.get_style_context ().add_class (Granite.STYLE_CLASS_H2_LABEL);
        main_grid.attach(points_label, 2, 0, 2, 1);
        
        score_buttons = new Gtk.Button[SCORE_CATEGORY_COUNT];
   
        for (var i = 0; i < SCORE_CATEGORY_COUNT; i++) {
            var category = (ScoreCategory)i;
            var button = new Gtk.Button.with_label("");
            button.halign = Gtk.Align.END;
            button.relief = Gtk.ReliefStyle.NONE;
            button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
            button.clicked.connect(() => {
                _player.scores.copy_score(category, _available_scores);
                display_scores();
                player_input_done(); 
            });
            if (i < 6) {
                main_grid.attach(button, 1, i + 1, 1, 1);
            } else {
                main_grid.attach(button, 3, (i - 6) + 1, 1, 1);
            }
            score_buttons[i] = button;
        }
        
        var ones_label = new Gtk.Label(_("Ones"));
        ones_label.expand = true;
        ones_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        ones_label.xalign = 0;
        main_grid.attach(ones_label, 0, 1, 1, 1);

        var twos_label = new Gtk.Label(_("Twos"));
        twos_label.expand = true;
        twos_label.xalign = 0;
        twos_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(twos_label, 0, 2, 1, 1);
                
        var threes_label = new Gtk.Label(_("Threes"));
        threes_label.expand = true;
        threes_label.xalign = 0;
        threes_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(threes_label, 0, 3, 1, 1);
                
        var fours_label = new Gtk.Label(_("Fours"));
        fours_label.expand = true;
        fours_label.xalign = 0;
        fours_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(fours_label, 0, 4, 1, 1);
                
        var fives_label = new Gtk.Label(_("Fives"));
        fives_label.expand = true;
        fives_label.xalign = 0;
        fives_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(fives_label, 0, 5, 1, 1);
                
        var sixes_label = new Gtk.Label(_("Sixes"));
        sixes_label.expand = true;
        sixes_label.xalign = 0;
        sixes_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(sixes_label, 0, 6, 1, 1);    
             
        bonus_label = new Gtk.Label(_("Lower Bonus (0/63)"));
        bonus_label.expand = true;
        bonus_label.xalign = 0;
        bonus_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(bonus_label, 0, 7, 1, 1);    

        //TODO Ideally this should be a label rather than a button. However, using a button helps align with the score buttons. Is there a better way to do this?

        bonus_value_button = new Gtk.Button.with_label("");
        bonus_value_button.halign = Gtk.Align.END;
        bonus_value_button.relief = Gtk.ReliefStyle.NONE;
        bonus_value_button.sensitive = false;
        bonus_value_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(bonus_value_button, 1, 7, 1, 1);    

        var full_house_label = new Gtk.Label(_("Full House"));
        full_house_label.expand = true;
        full_house_label.xalign = 0;
        full_house_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(full_house_label, 2, 1, 1, 1);

        var three_of_a_kind_label = new Gtk.Label(_("Three of a Kind"));
        three_of_a_kind_label.expand = true;
        three_of_a_kind_label.xalign = 0;
        three_of_a_kind_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(three_of_a_kind_label, 2, 2, 1, 1);

        var four_of_a_kind_label = new Gtk.Label(_("Four of a Kind"));
        four_of_a_kind_label.expand = true;
        four_of_a_kind_label.xalign = 0;
        four_of_a_kind_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(four_of_a_kind_label, 2, 3, 1, 1);

        var little_straight_label = new Gtk.Label(_("Little Straight"));
        little_straight_label.expand = true;
        little_straight_label.xalign = 0;
        little_straight_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(little_straight_label, 2, 4, 1, 1);
        
        var big_straight_label = new Gtk.Label(_("Big Straight"));
        big_straight_label.expand = true;
        big_straight_label.xalign = 0;
        big_straight_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(big_straight_label, 2, 5, 1, 1);
                
        var choice_label = new Gtk.Label(_("Choice"));
        choice_label.expand = true;
        choice_label.xalign = 0;
        choice_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(choice_label, 2, 6, 1, 1);
        
        var yacht_label = new Gtk.Label(_("Yacht"));
        yacht_label.expand = true;
        yacht_label.xalign = 0;
        yacht_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(yacht_label, 2, 7, 1, 1);
    }
    
    public Player player 
    { 
        get { return _player; }
        set {
            _player = value;
            name_label.label = _player.info.name;
            display_scores();
        }
    }
    
    public signal void player_input_done();
    
    public void request_player_input(List<Die> dice) {
        _available_scores = _player.scores.get_potential_scores(dice);
    
        for (var i = 0; i < SCORE_CATEGORY_COUNT; i++) {
            var score = _available_scores.get_score((ScoreCategory)i);
            if (score != null) {
                var button = score_buttons[i];
                button.label = score.to_string();
                button.sensitive = true;
            }
        }
    }
    
    void display_scores() {
        points_label.label = _("%u Points").printf(_player.scores.sum());
        bonus_label.label = _("Lower Bonus (%u/63)").printf(_player.scores.sum_lower());
        bonus_value_button.label = _player.scores.lower_bonus().to_string();
            
        for (var i = 0; i < SCORE_CATEGORY_COUNT; i++) {
            var button = score_buttons[i];
            var score = _player.scores.get_score((ScoreCategory)i);
            button.label = score != null ? score.to_string() : _("Open");
            button.sensitive = false;
        }
    }
}
