#!/bin/bash
# Grabs and kill a process from the pidlist that has the word  metabase.jar

pid=`ps aux | grep metabase.jar | awk '{print $2}'`
kill -9 $pid