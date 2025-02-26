#!/usr/bin/env bash

world_file="osrs_worlds_ips.txt"
dns_server="8.8.8.8"

rm -f "$world_file" && touch "$world_file"

for world in {1..600}; do
  world_url="oldschool${world}.runescape.com"
  world_ip=$(dig +short @"$dns_server" "$world_url" 2> /dev/null | tail -n 1 |  grep -E "[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+")
  if [[ "$world_ip" != "" ]]; then
    echo "$world_ip" >> "$world_file"
  fi
done
