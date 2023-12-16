import os

# self-defined
_app = 'Toyimk.app'
_im = 'Input Methods'

# recognized by dmgbuild
files = [f'{os.environ["BUILD_DIR"]}/{_app}']
symlinks = { _im: f'/Library/{_im}' }
badge_icon = 'dmg/toyimk.icns'
icon_locations = {
    _app: (100, 130),
    _im: (470, 130)
}
background = 'dmg/background.png'
window_rect = (100, 100), (600, 300)
