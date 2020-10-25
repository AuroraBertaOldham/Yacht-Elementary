# project name and programming language
project('com.github.AuroraBertaOldham.Yacht-Elementary', 'vala', 'c', version: '1.0.0')

# Set our translation domain
add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

# Create a new executable, list the files we want to compile, list the dependencies we need, and install
executable(
    meson.project_name(),
    'src/Application.vala',
    'src/MainWindow.vala',
    'src/Views/Welcome.vala',
    'src/Views/Game.vala',
    'src/Dialog/NewGame.vala',
    'src/Dialog/NewPlayer.vala',
    'src/Dialog/Scores.vala',
    'src/Widgets/PlayerListRow.vala',
    'src/Gameplay/Game.vala',
    'src/Gameplay/Player.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('gdk-3.0'),
        dependency('granite')
    ],
    install: true
)

# Include the translations module
i18n = import('i18n')

#Translate and install our .desktop file
i18n.merge_file(
    input: join_paths('data', 'yacht.desktop.in'),
    output: meson.project_name() + '.desktop',
    po_dir: join_paths(meson.source_root(), 'po'),
    type: 'desktop',
    install: true,
    install_dir: join_paths(get_option('datadir'), 'applications')
)

#Translate and install our .appdata file
i18n.merge_file(
    input: join_paths('data', 'yacht.appdata.xml.in'),
    output: meson.project_name() + '.appdata.xml',
    po_dir: join_paths(meson.source_root(), 'po'),
    install: true,
    install_dir: join_paths(get_option('datadir'), 'metainfo')
)

subdir('po')
