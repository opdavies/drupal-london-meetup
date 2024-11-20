#!/usr/bin/env bash

open() {
  tmux new-window -dn shell
  tmux new-window -dn server

  tmux send-keys -t server "devenv up" Enter

  tmux split-window -h
  tmux send-keys -t .right "watchexec --exts php,module,theme,yml phpunit --testdox web/modules/custom/opdavies_talks/tests/src" Enter
  tmux select-pane -t .left
}

close() {
  tmux send-keys -t server C-c
  tmux send-keys -t server Enter

  tmux kill-pane -t .right

  tmux kill-window -t shell
  tmux kill-window -t server
}

if [[ "${DRUPAL_LONDON:-0}" == "1" ]]; then
  close
  export DRUPAL_LONDON=0
else
  open
  export DRUPAL_LONDON=1
fi
