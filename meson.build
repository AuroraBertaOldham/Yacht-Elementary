# Based on build files for https://github.com/elementary/code

project('com.github.AuroraBertaOldham.Yacht-Elementary', 'vala', 'c', version: '1.0.0')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

executable(
    meson.project_name(),
    'src/Application.vala',
    'src/MainWindow.vala',
    'src/Views/Welcome.vala',
    'src/Views/Game.vala',
    'src/Dialog/NewGame.vala',
    'src/Dialog/NewPlayer.vala',
    'src/Dialog/Scores.vala',
    'src/Dialog/About.vala',
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

i18n = import('i18n')

subdir('data')
subdir('po')
