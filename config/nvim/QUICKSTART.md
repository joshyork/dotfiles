# Neovim Quickstart

Leader key is `Space`. Shown below as `SPC`.
When in doubt, press `SPC` and wait — which-key will show all options.

## Opening Files

```
SPC sf        fuzzy find files (ignores node_modules, .git)
SPC s.        recent files
SPC sb        switch between open buffers
SPC sg        live grep across project (ripgrep)
SPC sw        grep for word under cursor
```

Inside telescope: `Ctrl-n`/`Ctrl-p` to navigate, `Enter` to open, `Ctrl-x` split, `Ctrl-v` vsplit.

## File Explorer (netrw)

```
:Ex           open explorer in current window
:Sex          open in horizontal split
:Vex          open in vertical split
:Lex          open in left sidebar
```

In netrw: `Enter` opens, `-` goes up a dir, `%` creates new file, `d` creates dir, `R` renames, `D` deletes.

To close a `:Lex` sidebar, focus it and `:q`.

## Buffers (open files)

Buffers are nvim's version of "tabs" — every file you open is a buffer.

```
Shift-L       next buffer
Shift-H       previous buffer
SPC sb        fuzzy-switch buffers
:bd           close current buffer
:bd!          close without saving
```

## Windows (splits/panes)

```
Ctrl-w v      vertical split
Ctrl-w s      horizontal split
Ctrl-w q      close current split

Ctrl-h/j/k/l move focus between splits
Ctrl-w =      equalize split sizes
Ctrl-w >/<    widen/narrow (or 10 Ctrl-w > for 10 cols)
Ctrl-w +/-    taller/shorter
Ctrl-w _      maximize height
Ctrl-w |      maximize width
Ctrl-w =      reset to equal
```

## Code Navigation (LSP — works in TS/JS files)

```
gd            go to definition
gr            find all references
gI            go to implementation
K             hover docs (press again to enter the popup)
SPC rn        rename symbol
SPC ca        code action (quick fix, refactor)
SPC D         type definition
SPC ds        document symbols (list functions/types in file)
SPC ws        workspace symbols (search across project)
[d / ]d       prev/next diagnostic (error/warning)
SPC e         show diagnostic float
SPC q         diagnostics list
```

## TypeScript Extras (in TS/TSX files)

```
SPC co        organize imports
SPC cu        remove unused imports
SPC ci        add missing imports
SPC cf        fix all auto-fixable issues
```

## Editing

```
SPC f         format buffer (dprint or prettier, also runs on save)
SPC /         fuzzy search in current file
u / Ctrl-r    undo / redo
.             repeat last change
```

Visual mode line moving:
```
V then J/K    select lines then move them up/down
```

Surround (mini.surround):
```
sa            add surround      (e.g. saiw" → surround word with ")
sd            delete surround   (e.g. sd" → remove surrounding ")
sr            replace surround  (e.g. sr"' → change " to ')
```

## Search & Replace

```
/pattern      search forward
?pattern      search backward
n / N         next / previous match
Esc           clear search highlight

:%s/old/new/g          replace all in file
:%s/old/new/gc         replace all, confirm each
:s/old/new/g           replace all in visual selection (select first)
```

## Git (gitsigns)

```
]c / [c       next/prev changed hunk
SPC hs        stage hunk
SPC hr        reset hunk
SPC hS        stage entire buffer
SPC hu        undo stage hunk
SPC hp        preview hunk diff
SPC hb        blame current line
SPC hd        diff this file
:Git          fugitive status (full git UI)
```

## Misc

```
SPC sk        search all keymaps (if you forget something)
SPC sh        search help docs
SPC sr        resume last search
:Lazy         plugin manager UI
:Mason        LSP/tool installer UI
:Copilot auth set up GitHub Copilot
:checkhealth  diagnose issues
```

In help/man/quickfix windows, press `q` to close.

## Survival Tips

- If you're lost, `SPC` + wait shows all leader bindings
- `:w` saves, `:q` quits, `:wq` both, `:qa!` quit everything
- `Ctrl-d`/`Ctrl-u` scroll half-page (stays centered)
- Copilot suggestions appear as ghost text — `Tab` to accept
- Format-on-save is on. `:ConformInfo` to check what formatter is active
