#!/bin/bash


url="https://arxiv.org/search/?query="


query=$(echo "$@" | sed "s/ /+/g")

full_url="$url$query&searchtype=all&source=header"


curl -s -L -A Lynx "$full_url" | 
tr -d '\n' | 

tr ' ' '\n' | 


grep -oP 'arXiv:[^<&?]+' |

tr -d 'arXiv:' |

sort | uniq
