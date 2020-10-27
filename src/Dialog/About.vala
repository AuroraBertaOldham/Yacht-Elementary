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

public class AboutDialog : Gtk.AboutDialog {
    public AboutDialog() {
        logo_icon_name = "com.github.AuroraBertaOldham.Yacht-Elementary";
	    program_name = "Yacht";
	    comments = "An implementation of the public domain dice game for Elementary OS.";
	    copyright = "Copyright © 2020 Aurora Berta-Oldham";
	    version = "1.0";

        authors = {"Aurora Berta-Oldham"};

	    license_type = Gtk.License.GPL_3_0;
	    license = "Yacht
Copyright (c) 2020 Aurora Berta-Oldham

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.";

	    wrap_license = true;

	    website_label = "Github Repository";
	    website = "https://github.com/AuroraBertaOldham/Yacht-Elementary";
    }
}
