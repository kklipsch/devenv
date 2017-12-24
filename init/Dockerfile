FROM scratch

ADD * /init/
ADD gout/gout /
CMD ["/gout", "rm -rf $HOME/.devenv/;docker cp init:/init/ $HOME/.devenv/;docker rm init; $HOME/.devenv/install.sh; source $HOME/.bashrc"] 
