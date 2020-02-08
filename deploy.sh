#!/usr/bin/env sh

export USER=root
export HOST=45.77.197.6
export BRANCH=master
export PROJECT=game_store
export PKG=game_store.tar.gz
export DEST=/opt

git archive -o $PKG $BRANCH
scp -o StrictHostKeyChecking=no $PKG $USER@$HOST:$DEST
ssh $USER@$HOST -o StrictHostKeyChecking=no '\
  tar xf $DEST/$PKG -C $DEST && \
  cd $DEST/$PROJECT && \
  docker-compose -f docker-compose.yml up -d --build web'