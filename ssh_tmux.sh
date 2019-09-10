ssh -L 8888:localhost:8888 192.168.3.213 -t "tmux attach -t devel || tmux new-session -s devel_new"
