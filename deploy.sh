#!/usr/bin/env sh

USER=root
HOST=45.77.197.6
BRANCH=master

git archive -o game_store.tar.gz $BRANCH
scp -o StrictHostKeyChecking=no game_store.tar.gz $USER@$HOST:/opt
ssh $USER@$HOST -o StrictHostKeyChecking=no '\
  tar xf /opt/game_store.tar.gz -C /opt && \
  cd /opt/game_store && \
  docker-compose -f docker-compose.yml up -d --build web'