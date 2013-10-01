#!/bin/bash

# great for fixing up the git history when you forget to change your config on a work repo

WRONG_EMAIL=""
CORRECT_USERNAME=""
CORRECT_NAME=$CORRECT_USERNAME
CORRECT_EMAIL=""

git filter-branch -f --commit-filter "
        if [ \"$GIT_AUTHOR_EMAIL\" = \"$WRONG_EMAIL\" ];

        then
                GIT_COMMITTER_NAME=\"$CORRECT_USERNAME\";
                GIT_AUTHOR_NAME=\"$CORRECT_NAME\";
                GIT_COMMITTER_EMAIL=\"$CORRECT_EMAIL\";
                GIT_AUTHOR_EMAIL=\"$CORRECT_EMAIL\";
                git commit-tree \"$@\";
        else
                git commit-tree \"$@\";
        fi" HEAD
