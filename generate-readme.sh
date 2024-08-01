#!/bin/bash

# Run this script to generate the README.md file.
# This script overwrites the contenst of README.md with the contents of _README.md followed by
# a table of emojis from the emojis/ directory.

TARGET="README.md"
READMEHEADER=`cat _README.md`
echo "$READMEHEADER" > $TARGET

printf "\n" >> $TARGET
echo "| Emoji | File Name | Default Tag |" >> $TARGET
echo "| ----- | --------- | ----------- |" >> $TARGET

DIR="emojis/"
FILES="$DIR*"
for FILE in $FILES
do
    FILENAME=`basename "$FILE"`
    EMOJI="<img src=\"$FILE\" width=\"64px\" alt=\"$FILENAME\" title=\"$FILENAME\" />"
    TAG=":${FILENAME%.*}:"

    echo "| $EMOJI | \`$FILENAME\` | \`$TAG\` |" >> $TARGET
done
