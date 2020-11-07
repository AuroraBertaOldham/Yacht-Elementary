project('com.github.AuroraBertaOldham.Yacht-Elementary', 'vala', 'c', version: '1.0.0')

add_global_arguments('-DGETTEXT_PACKAGE="@0@"'.format (meson.project_name()), language:'c')

gnome = import('gnome')
i18n = import('i18n')

subdir('data')
subdir('po')

executable(
    meson.project_name(),
    icons_gresource,
    'src/Application.vala',
    'src/MainWindow.vala',
    'src/Views/Welcome.vala',
    'src/Views/Game.vala',
    'src/Dialog/NewGame.vala',
    'src/Dialog/NewPlayer.vala',
    'src/Dialog/Scores.vala',
    'src/Dialog/About.vala',
    'src/Widgets/PlayerListRow.vala',
    'src/Widgets/PlayerCard.vala',
    'src/Gameplay/Game.vala',
    'src/Gameplay/Player.vala',
    'src/Gameplay/Die.vala',
    dependencies: [
        dependency('gtk+-3.0'),
        dependency('gdk-3.0'),
        dependency('granite'),
        dependency('gee-0.8')
    ],
    install: true
)
