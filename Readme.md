# Ubuntu Setup

## Tools
- Alacritty
- Anitgen
- NeoVim (text editor)
- vim plugin
- Tmuxp
- Remap keys https://pqrs.org/osx/karabiner/



# Important Reads
- Tmux copy paste setup:
https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard

- Tmux window dimensions

First setup your window the way you want, your panes the sizes etc etc. Then 
```
$ tmux list-windows
1: ~* (4 panes) [208x59] [layout 3682,208x59,0,0[208x29,0,0{95x29,0,0,0,112x29,96,0[112x22,96,0,1,112x6,96,23,2]},208x29,0,30,3]] @0 (active)
```
Add that Take everything in layout and add that to your tmux managment

More reading here:
https://fabianfranke.de/2013/11/19/use-tmuxinator-to-recreate-tmux-panes-and-windows/
