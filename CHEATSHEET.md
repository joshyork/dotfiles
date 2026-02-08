# Dev Environment Cheatsheet

Caps Lock = tap for Escape, hold for Control (Karabiner).
Prefix in tmux is `Ctrl-a` (shown below as `C-a`).
Leader in nvim is `Space` (shown below as `SPC`).

---

## Shell Aliases

```
v             nvim
g             git
gwt/gwta/gwtl/gwtr   git worktree (add/list/remove)
gwhoami       show current git user email
n / nr        npm / npm run
p / pr        pnpm / pnpm run
y             yarn
d             docker
d-exec <id>   docker exec -it into container
ts            tig status
```

---

## Tmux

### Sessions & Windows

```
C-a d         detach from session
C-a c         new window (keeps current path)
C-a 1-9       switch to window N
C-a ,         rename window
C-a w         list all windows (interactive)
C-a &         close window
```

### Panes

```
C-a |         split vertical
C-a -         split horizontal
C-a x         close pane
```

### Pane Navigation

```
C-h/j/k/l    move between panes (also works from nvim)
C-a H/J/K/L  resize pane (repeatable)
C-a z         zoom/unzoom pane (fullscreen toggle)
```

### Copy Mode (scrollback)

```
C-a [         enter copy mode (scroll up)
q             exit copy mode
v             start selection (vi mode)
y             copy selection to clipboard
/             search forward in scrollback
?             search backward
```

### Other

```
C-a r         reload tmux config
C-a C-l       clear screen (since C-l is navigation)
```

---

## Neovim

### Opening & Closing

```
v .           open nvim in current directory
:w            save
:q            close window
:qa           quit all
:qa!          quit all without saving
:wqa          save all and quit
:bd           close current buffer
```

### Files

```
SPC sf        fuzzy find files
SPC s.        recent files
SPC sg        live grep across project
SPC sw        grep word under cursor
SPC sb        switch between open buffers
SPC /         fuzzy search current buffer
SPC sk        search all keymaps
SPC sh        search help docs
SPC sr        resume last search
```

### File Explorer (neo-tree)

```
SPC e         toggle explorer sidebar
SPC ef        focus explorer
SPC er        reveal current file in explorer
```

In neo-tree:
```
Enter         open file
a             create file (trailing / for folder)
r             rename
d             delete
c             copy (p to paste = duplicate)
m             move
```

### Buffers

```
Shift-L       next buffer
Shift-H       previous buffer
SPC sb        fuzzy switch buffers
:bd           close buffer
```

### Windows (splits)

```
C-w v         vertical split
C-w s         horizontal split
C-w q         close split
C-h/j/k/l    move between splits (and tmux panes)
C-w =         equalize sizes
C-w >/<       widen/narrow
C-w +/-       taller/shorter
C-w _         maximize height
C-w |         maximize width
```

### Code Navigation (LSP)

```
gd            go to definition
gr            find all references
gI            go to implementation
gD            go to declaration
K             hover docs
SPC rn        rename symbol
SPC ca        code action
SPC D         type definition
SPC ds        document symbols (functions/types in file)
SPC ws        workspace symbols (search project)
[d / ]d       prev/next diagnostic
SPC xd        show diagnostic float
SPC q         diagnostics list
```

### TypeScript Extras

```
SPC co        organize imports
SPC cs        sort imports
SPC cu        remove unused imports
SPC ci        add missing imports
SPC cf        fix all auto-fixable
SPC cd        remove unused statements
```

### Formatting

```
SPC f         format buffer
              (also runs on save: dprint if dprint.json exists, else prettier)
:ConformInfo  check active formatter
```

### Git (gitsigns)

```
]c / [c       next/prev changed hunk
SPC hs        stage hunk
SPC hr        reset hunk
SPC hS        stage entire buffer
SPC hu        undo stage hunk
SPC hR        reset buffer
SPC hp        preview hunk diff
SPC hb        blame line
SPC hd        diff this file
:Git          fugitive (full git UI)
```

### Editing

```
u / C-r       undo / redo
.             repeat last change
V then J/K    select lines, move up/down
SPC p         paste without overwriting register (visual mode)
```

Surround (mini.surround):
```
sa            add surround    (saiw" = surround word with ")
sd            delete surround (sd" = remove surrounding ")
sr            replace surround (sr"' = change " to ')
```

### Search & Replace

```
/pattern      search forward
?pattern      search backward
n / N         next / prev match
Esc           clear highlight
:%s/old/new/g   replace all in file
:%s/old/new/gc  replace all, confirm each
```

### Toggles

```
SPC ul        toggle line numbers
SPC ua        toggle relative/absolute numbers
```

### Scrolling

```
C-d / C-u     half-page down/up (centered)
n / N         search matches stay centered
```

### Meta

```
SPC           wait... which-key shows all bindings
:Lazy         plugin manager
:Mason        LSP/tool installer
:Copilot auth setup GitHub Copilot
:checkhealth  diagnose issues
:pwd          show current working directory
:cd <path>    change working directory
q             close help/quickfix windows
```

### Copilot

```
Tab           accept suggestion
Alt-]         next suggestion
Alt-[         previous suggestion
C-]           dismiss suggestion
```
