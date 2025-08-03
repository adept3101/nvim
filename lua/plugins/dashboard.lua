local function default_header()
    return {
"      ,l;             c,      ",
"   .:ooool'           loo:.   ",
" .,oooooooo:.         looooc, ",
"ll:,loooooool,        looooool",
"llll,;ooooooooc.      looooooo",
"lllllc,coooooooo;     looooooo",
"lllllll;,loooooool'   looooooo",
"lllllllc .:oooooooo:. looooooo",
"lllllllc   'loooooool,:ooooooo",
"lllllllc     ;ooooooooc,cooooo",
"lllllllc      .coooooooo;;looo",
"lllllllc        ,loooooool,:ol",
" 'cllllc         .:oooooooo;. ",
"   .;llc           .loooo:.   ",
"      ,;             ;l;      "

      }
    end
    require('dashboard').setup {
    theme = 'doom',
    config = {
        header = default_header(),
        center = {
            {
                icon = '󰙅 ',
                icon_hl = 'Title',
                desc = 'Open tree',
                desc_hl = 'String',
                key = 'e',
                keymap = 'SPC e',
                key_hl = 'Number',
                action = ':Neotree'
            }, {
                icon = '󰈞 ',
                icon_hl = 'Title',
                desc = 'Find files',
                desc_hl = 'String',
                key = 'f',
                keymap = 'SPC f f',
                key_hl = 'Number',
                action = ':Telescope find_files'
            }, {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find text',
                desc_hl = 'String',
                key = 'w',
                keymap = 'SPC f w',
                key_hl = 'Number',
                action = ':Telescope live_grep'
            }, {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Git Braches',
                desc_hl = 'String',
                key = 'b',
                keymap = 'SPC g b',
                key_hl = 'Number',
                action = ':Telescope git_branches'
            }

        }
    }
}
