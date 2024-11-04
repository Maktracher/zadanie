#!/bin/bash

  curl -s -L -A Lynx "$url" | \
    grep -Po '<meta name="citation_\w+" content="[^"]+"' | \
    sed -e 's/citation_title" content="([^"])"/--title="\1"/' \
        -e 's/citation_author" content="([^"])"/author="\1"/' \
        -e 's/citation_date" content="([^"])"/date="\1"/' \
        -e 's/citation_online_date" content="([^"])"/online_date="\1"/' \
        -e "s|^|pdf_url="https://arxiv.org/pdf/$id/"%7C" \
        -e "s|^|arxiv_id="$id"|"

    echo
done
