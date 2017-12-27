FROM kklipsch/gout

ADD * /init/
CMD ["/gout", "rm -rf $HOME/.devenv/;docker cp init:/init/ $HOME/.devenv/;docker rm init; $HOME/.devenv/install.sh; source $HOME/.bashrc"] 
