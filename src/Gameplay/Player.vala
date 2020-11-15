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
