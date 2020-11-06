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

public class Player : Object {
    public PlayerInfo info { get; set; }
    public Scores scores { get; set; }
    
    public Player(PlayerInfo player_info) {
        info = player_info;
        scores = new Scores();
    }
    public Player.empty() {
        info = new PlayerInfo.empty();
        scores = new Scores();
    }
}

public class PlayerInfo : Object {
    public string name { get; set; }
    public bool simulated { get; set; }
    
    public PlayerInfo(string name, bool simulated) {
        this.name = name;
        this.simulated = simulated;
    }
    public PlayerInfo.empty() {
        name = "";
        simulated = false;
    }
}

public class Scores : Object {
    uint?[] _scores;
    
    public Scores() {
        _scores = new uint?[] {
            null, // Ones
            null, // Twos
            null, // Threes
            null, // Fours
            null, // Fives
            null, // Sixes
            null, // Full House
            null, // Four of a Kind
            null, // Little Straight
            null, // Big Straight
            null, // Choice
            null, // Yacht
        };
    }
    
    public void set_score(ScoreCategory category, uint? score) {
        _scores[(uint)category] = score;
    }
    
    public uint? get_score(ScoreCategory category) {
        return _scores[(uint)category];
    }
    
    public void copy_score(ScoreCategory category, Scores scores) {
        set_score(category, scores.get_score(category));
    }
    
    public uint sum() {
        uint sum = 0;
        foreach (uint? score in _scores) {
            if (score != null) {
                sum += (uint)score;
            }
        }
        return sum;
    }
    
    public Scores get_potential_scores(List<Die> dice) {
        var scores = new Scores();
        for (var i = 0; i < 6; i++) {
            if (_scores[i] == null) {
                scores._scores[i] = get_potential_lower_score(dice, i + 1);
            }
        }
        
        if (_scores[6] == null) {

            
        }
        
        return scores;
    }
    
    uint? get_potential_lower_score(List<Die> dice, uint size) {
        uint sum = 0;     
        foreach (Die die in dice) {
            if (die.side == size) {
                sum += size;
            }
        }       
        return sum;
    }
}

public enum ScoreCategory {
    ONES = 0,
    TWOS = 1,
    THREES = 2,
    FOURS = 3,
    FIVES = 4,
    SIXES = 5,
    FULL_HOUSE = 6,
    FOUR_OF_A_KIND = 7,
    LITTLE_STRAIGHT = 8,
    BIG_STRAIGHT = 9,
    CHOICE = 10,
    YACHT = 11
}
