#!/usr/bin/env sh

USER=root
HOST=45.77.197.6
BRANCH=master
PROJECT=game_store
PKG=game_store.tar.gz
DEST=/opt

git archive -o $PKG $BRANCH
scp $PKG $USER@$HOST:$DEST -o StrictHostKeyChecking=no
ssh $USER@$HOST -o StrictHostKeyChecking=no <<EOF
  tar xf $DEST/$PKG
  cd $DEST/$PROJECT
  docker-compose -f docker-compose.yml up -d --build web
EOF