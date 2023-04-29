
let g:lightline                                          = {}
let g:lightline.colorscheme                              = 'PaperColor'
let g:lightline.separator                                = {}
let g:lightline.separator.left                           = "\ue0b0"
let g:lightline.separator.right                          = "\ue0b2"
let g:lightline.subseparator                             = {}
let g:lightline.subseparator.left                        = "\ue0b1"
let g:lightline.subseparator.right                       = "\ue0b3"
let g:lightline.component                                = {}
let g:lightline.component.coc                            = "%{coc#status()}%{get(b:,'coc_current_function','')}"
let g:lightline.component_function                       = {}
let g:lightline.component_function.gitbranch             = 'FugitiveHead'
let g:lightline.active                                   = {}
let g:lightline.active.left                              = [[  'filename'  ]]
let g:lightline.active.right                             = []
let g:lightline.inactive                                 = {}
let g:lightline.inactive.left                            = [[  'filename'  ]]
let g:lightline.inactive.right                           = []
let g:lightline.tabline                                  = {}
let g:lightline.tabline.right                            = [ [ 'gitbranch' ], [ 'coc' ] ]


let g:tmuxline_preset                                    = 'minimal'
let g:gh_line_map                                        = 'gh'

let g:coc_global_extensions                              = [ 'coc-tsserver', 'coc-css', 'coc-json', 'coc-html', 'coc-vimlsp', 'coc-highlight', 'coc-ember', 'coc-tailwindcss' ]

let g:undotree_CustomUndotreeCmd                         = 'UndotreeCustom'
let g:undotree_SplitWidth                                = 35
let g:undotree_SetFocusWhenToggle                        = 1


let &clipboard='unnamed,unnamedplus'

let &showtabline                                         = 2

let &pumwidth                                            = 25
let &pumheight                                           = 10

let &ignorecase                                          = 1
let &smartcase                                           = 1

let &cursorline                                          = 1
let &hlsearch                                            = 1
let &cmdheight                                           = 2
let &laststatus                                          = 2
let &expandtab                                           = 1
let &softtabstop                                         = 2
let &tabstop                                             = 2
let &shiftwidth                                          = 2
let &mouse                                               = ''
let &autoindent                                          = 1
let &wrap                                                = 0
let &encoding                                            ='utf-8'

let &splitbelow                                          = 1
let &splitright                                          = 1

let &updatetime                                          = 300

let &signcolumn                                          = 'yes'

let &ruler                                               = 1
let &number                                              = 1
let &relativenumber                                      = 1

let &startofline                                         = 1

let &undofile                                            = 1
let &backup                                              = 1

let &background                                          = 'light'

let &directory                                           = printf('%s/nvim/swap/', $TMPDIR)
let &undodir                                             = printf('%s/nvim/undo//', $TMPDIR)
let &backupdir                                           = printf('%s/nvim/backup//', $TMPDIR)
