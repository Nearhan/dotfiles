# Ubuntu Setup

## Tools
- antigen  
- neovim (text editor)
- pure prompt https://github.com/sindresorhus/pure (minimal prompt)
- vim-plugin https://github.com/junegunn/vim-plug (vim plugin manager)
- gogh - https://github.com/Mayccoll/Gogh (gnome terminal colors)
- tmuxp https://github.com/tony/tmuxp (tmux session manager)



# Important Reads
- Tmux Copy / Paste http://www.rushiagr.com/blog/2016/06/16/everything-you-need-to-know-about-tmux-copy-pasting-ubuntu/
- Tmux window dimensions

First setup your window the way you want, your panes the sizes etc etc. Then 
```
$ tmux list-windows
1: ~* (4 panes) [208x59] [layout 3682,208x59,0,0[208x29,0,0{95x29,0,0,0,112x29,96,0[112x22,96,0,1,112x6,96,23,2]},208x29,0,30,3]] @0 (active)
```
Add that Take everything in layout and add that to your tmux managment

More reading here:
https://fabianfranke.de/2013/11/19/use-tmuxinator-to-recreate-tmux-panes-and-windows/
