#!/bin/bash

time_stamp=`date "+%Y-%m-%d_%H:%M:%S"`
save_dir=".backup/$time_stamp"
mkdir -p "$save_dir"

sublime_path="$HOME/Library/Application Support/Sublime Text 2/Packages/User"

for f in "Preferences" "HTML" "Javascript"
do
    mv "$sublime_path/$f.sublime-settings" "$save_dir"
    ln "$f.sublime-settings" "$sublime_path/$f.sublime-settings"
done

