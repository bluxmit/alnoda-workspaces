<p align="center">
  <img src="https://github.com/bluxmit/alnoda-workspaces/blob/main/img/Alnoda-white.svg" alt="Alnoda logo" width="150">
</p> 

# Ubuntu-workspace
Containerized terminal environment. Essentially Ubuntu 20.04 docker image with typical terminal applications added.

Start

```
docker run --name space-1 -d -p 8026:8026 alnoda/ubuntu-workspace
```

Enter workspace

```
docker exec -it --user=root space-1 /bin/zsh
```

## Why this image

If you need to isolate something without polluting main environment. This image simply adds typical console applications to 
the Ubuntu 20.04 image:

- 

- [Fig](https://github.com/withfig/autocomplete). adds autocomplete to the terminal.
- [spacemacs](https://www.spacemacs.org/)
- [hyper](https://github.com/vercel/hyper)
- [xplr](https://github.com/sayanarijit/xplr)
- [vizex](https://github.com/bexxmodd/vizex)
- [lazygit](https://github.com/jesseduffield/lazygit)
- [gitui](https://github.com/extrawurst/gitui)
- [bashtop](https://github.com/aristocratos/bashtop)
- [amp](https://github.com/jmacdonald/amp)
- [fff](https://github.com/dylanaraps/fff)
- [slap](https://github.com/slap-editor/slap)
- [glow](https://github.com/charmbracelet/glow)