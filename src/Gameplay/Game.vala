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

public class Game : Object {
    public unowned List<Player> players { get; set; }
    public uint current_turn { get; set; }
    
    public uint rolls_remaining { get; set; }

    public unowned List<Die> dice { get; set; }
    
    public Game() {
        players = new List<Player>();
        players.append(new Player(new PlayerInfo(Environment.get_real_name(), false)));
        
        rolls_remaining = 3;
        
        dice = new List<Die>();
        dice.append(new Die());
        dice.append(new Die());
        dice.append(new Die());
        dice.append(new Die());
        dice.append(new Die());
    }
    
    public bool next_player() {
        if (current_turn == players.length() - 1) {
            current_turn = 0;
        } else {
            current_turn++;
        }
        
        foreach (Die die in dice) {
            die.reset();
        }
        
        rolls_remaining = 3;
        
        foreach (var player in players) {
            if (!player.scores.finished()) {
                return true;
            }
        }
        
        return false;
    }
    
    public void roll_dice() {
        rolls_remaining--;
        foreach (Die die in dice) {
            die.roll();
        }
    }
    
    public uint count_held() {
        var count = 0;
        foreach (Die die in dice) {
            if (die.hold) {
                count++;
            }
        }
        return count;
    }
}
