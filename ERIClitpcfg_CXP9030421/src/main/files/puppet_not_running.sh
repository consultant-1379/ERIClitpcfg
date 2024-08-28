#!/bin/bash

while true; do
  mco puppet status | grep $HOSTNAME | grep "applying a catalog" && sleep 2 || exit 0
done
