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

    Gtk.Label name_label;
    Gtk.Label points_label;

    Gtk.Button ones_button;
    Gtk.Button twos_button;
    Gtk.Button threes_button;
    Gtk.Button fours_button;
    Gtk.Button fives_button;
    Gtk.Button sixes_button;
    
    Gtk.Button full_house_button;
    Gtk.Button four_of_a_kind_button;
    Gtk.Button little_straight_button;
    Gtk.Button big_straight_button;
    Gtk.Button choice_button;
    Gtk.Button yacht_button;

    public PlayerCard() {   
        var frame = new Gtk.Frame(null);
        frame.get_style_context().add_class (Gtk.STYLE_CLASS_VIEW);
        add(frame);
    
        var main_grid = new Gtk.Grid();
        main_grid.margin = 10;
        frame.add(main_grid);
        
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
        
        var ones_label = new Gtk.Label(_("Ones"));
        ones_label.expand = true;
        ones_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        ones_label.xalign = 0;
        main_grid.attach(ones_label, 0, 1, 1, 1);
        
        ones_button = new Gtk.Button.with_label("Test");
        ones_button.expand = true;
        ones_button.relief = Gtk.ReliefStyle.NONE;
        ones_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(ones_button, 1, 1, 1, 1);
                
        var twos_label = new Gtk.Label(_("Twos"));
        twos_label.expand = true;
        twos_label.xalign = 0;
        twos_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(twos_label, 0, 2, 1, 1);
                
        twos_button = new Gtk.Button.with_label("Test");
        twos_button.expand = true;
        twos_button.relief = Gtk.ReliefStyle.NONE;
        twos_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(twos_button, 1, 2, 1, 1);
                
        var threes_label = new Gtk.Label(_("Threes"));
        threes_label.expand = true;
        threes_label.xalign = 0;
        threes_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(threes_label, 0, 3, 1, 1);
          
        threes_button = new Gtk.Button.with_label("Test");
        threes_button.expand = true;
        threes_button.relief = Gtk.ReliefStyle.NONE;
        threes_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(threes_button, 1, 3, 1, 1);
                
        var fours_label = new Gtk.Label(_("Fours"));
        fours_label.expand = true;
        fours_label.xalign = 0;
        fours_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(fours_label, 0, 4, 1, 1);
                
        fours_button = new Gtk.Button.with_label("Test");
        fours_button.expand = true;
        fours_button.relief = Gtk.ReliefStyle.NONE;
        fours_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(fours_button, 1, 4, 1, 1);
                
        var fives_label = new Gtk.Label(_("Fives"));
        fives_label.expand = true;
        fives_label.xalign = 0;
        fives_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(fives_label, 0, 5, 1, 1);
                              
        fives_button = new Gtk.Button.with_label("Test");
        fives_button.expand = true;
        fives_button.relief = Gtk.ReliefStyle.NONE;
        fives_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(fives_button, 1, 5, 1, 1);
                              
        var sixes_label = new Gtk.Label(_("Sixes"));
        sixes_label.expand = true;
        sixes_label.xalign = 0;
        sixes_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(sixes_label, 0, 6, 1, 1);    
        
        sixes_button = new Gtk.Button.with_label("Test");
        sixes_button.expand = true;
        sixes_button.relief = Gtk.ReliefStyle.NONE;
        sixes_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(sixes_button, 1, 6, 1, 1);
        
        var full_house_label = new Gtk.Label(_("Full House"));
        full_house_label.expand = true;
        full_house_label.xalign = 0;
        full_house_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(full_house_label, 2, 1, 1, 1);
        
        full_house_button = new Gtk.Button.with_label("Test");
        full_house_button.expand = true;
        full_house_button.relief = Gtk.ReliefStyle.NONE;
        full_house_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(full_house_button, 3, 1, 1, 1);
        
        var four_of_a_kind_label = new Gtk.Label(_("Four of a Kind"));
        four_of_a_kind_label.expand = true;
        four_of_a_kind_label.xalign = 0;
        four_of_a_kind_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(four_of_a_kind_label, 2, 2, 1, 1);
                
        four_of_a_kind_button = new Gtk.Button.with_label("Test");
        four_of_a_kind_button.expand = true;
        four_of_a_kind_button.relief = Gtk.ReliefStyle.NONE;
        four_of_a_kind_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(four_of_a_kind_button, 3, 2, 1, 1);
                
        var little_straight_label = new Gtk.Label(_("Little Straight"));
        little_straight_label.expand = true;
        little_straight_label.xalign = 0;
        little_straight_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(little_straight_label, 2, 3, 1, 1);
                      
        little_straight_button = new Gtk.Button.with_label("Test");
        little_straight_button.expand = true;
        little_straight_button.relief = Gtk.ReliefStyle.NONE;
        little_straight_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(little_straight_button, 3, 3, 1, 1);
                  
        var big_straight_label = new Gtk.Label(_("Big Straight"));
        big_straight_label.expand = true;
        big_straight_label.xalign = 0;
        big_straight_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(big_straight_label, 2, 4, 1, 1);
                
        big_straight_button = new Gtk.Button.with_label("Test");
        big_straight_button.expand = true;
        big_straight_button.relief = Gtk.ReliefStyle.NONE;
        big_straight_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(big_straight_button, 3, 4, 1, 1);
                
        var choice_label = new Gtk.Label(_("Choice"));
        choice_label.expand = true;
        choice_label.xalign = 0;
        choice_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(choice_label, 2, 5, 1, 1);
     
        choice_button = new Gtk.Button.with_label("Test");
        choice_button.expand = true;
        choice_button.relief = Gtk.ReliefStyle.NONE;
        choice_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(choice_button, 3, 5, 1, 1);
                              
        var yacht_label = new Gtk.Label(_("Yacht"));
        yacht_label.expand = true;
        yacht_label.xalign = 0;
        yacht_label.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(yacht_label, 2, 6, 1, 1);
        
        yacht_button = new Gtk.Button.with_label("Test");
        yacht_button.expand = true;
        yacht_button.relief = Gtk.ReliefStyle.NONE;
        yacht_button.get_style_context ().add_class (Granite.STYLE_CLASS_H3_LABEL);
        main_grid.attach(yacht_button, 3, 6, 1, 1);
    }
}
