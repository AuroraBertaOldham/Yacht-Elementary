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
            null, // Three of a Kind
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
        uint sum = lower_bonus();
        foreach (uint? score in _scores) {
            if (score != null) {
                sum += (uint)score;
            }
        }
        return sum;
    }
    
    public uint sum_lower() {
        uint sum = 0;
        for (var i = 0; i < 6; i++) {
            var score = _scores[i];
            if (score != null) {
                sum += (uint)score;
            }
        }
        return sum;
    }
    
    public uint lower_bonus() {
        if (sum_lower() >= 63) {
            return 35;
        }
        return 0;
    }
    
    public Scores get_potential_scores(List<Die> dice) {
        var scores = new Scores();
        
        var count_set = new Gee.HashMap<uint, uint>();
        foreach (Die die in dice) {
            var current = count_set.get(die.side);
            count_set.set(die.side, current + 1);
        }
        
        // Lower Section
        
        for (var i = 0; i < 6; i++) {
            if (_scores[i] == null) {
                var side = i + 1;
                scores._scores[i] = count_set.get(side) * side;
            }
        }
        
        // Full House
        
        if (_scores[6] == null) {
            uint score = 0;
            if (count_set.size == 2 && count_set.values.contains(2)) {
                foreach (var dice_count in count_set) {
                    score += dice_count.key * dice_count.value;
                }
            }
            scores._scores[6] = score;
        }
        
        // Three of a Kind
        
        if (_scores[7] == null) {
            uint score = 0;
            foreach (var dice_count in count_set) {
                if (dice_count.value >= 3) {
                    score += dice_count.key * 3;
                    break;
                }
            }
            scores._scores[7] = score;
        }
        
        // Four of a Kind
        
        if (_scores[8] == null) {
            uint score = 0;
            foreach (var dice_count in count_set) {
                if (dice_count.value >= 4) {
                    score += dice_count.key * 4;
                    break;
                }
            }
            scores._scores[8] = score;
        }
        
        // Little Straight
        
        if (_scores[9] == null) {
            uint score = 0;
            if (count_set.size == 5 && !count_set.has_key(6)) {
                score = 30;
            }
            scores._scores[9] = score;
        }
        
        // Big Straight
        
        if (_scores[10] == null) {
            uint score = 0;
            if (count_set.size == 5 && !count_set.has_key(1)) {
                score = 30;
            }
            scores._scores[10] = score;
        }
        
        // Choice
        
        if (_scores[11] == null) {
            uint score = 0;
            foreach (var dice_count in count_set) {
                score += dice_count.key * dice_count.value;
            }
            scores._scores[11] = score;
        }
        
        // Yacht
        
        if (_scores[12] == null) {
            uint score = 0;
            if (count_set.size == 1 && !count_set.has_key(0)) {
                score = 50;
            }
            scores._scores[12] = score;
        }
        
        
        return scores;
    }
}

const uint SCORE_CATEGORY_COUNT = 13;

public enum ScoreCategory {
    ONES = 0,
    TWOS = 1,
    THREES = 2,
    FOURS = 3,
    FIVES = 4,
    SIXES = 5,
    FULL_HOUSE = 6,
    THREE_OF_A_KIND = 7,
    FOUR_OF_A_KIND = 8,
    LITTLE_STRAIGHT = 9,
    BIG_STRAIGHT = 10,
    CHOICE = 11,
    YACHT = 12
}
