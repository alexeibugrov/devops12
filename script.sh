#!/bin/bash

#git clone https://github.com/alexeibugrov/devops12
#cd devops12

TAG=$(git tag | tail -1)
CURRENT=/var/www/current
if [ -L "$CURRENT" ]
then
	OLDTAG=$(readlink -f /var/www/current | sed 's/.*\///')
	if [ $OLDTAG != $TAG ]
	then
		mkdir /var/www/"$TAG"
		rsync -avr ./ /var/www/"$TAG" --exclude=.git
		ln -sfn /var/www/"$TAG" /var/www/current
		echo "Version's changed to $TAG"
	else
		echo "Nothing's changed since last release"
    fi
else
	mkdir /var/www/"$TAG"
	rsync -avr ./ /var/www/"$TAG" --exclude=.git
	ln -sfn /var/www/"$TAG" /var/www/current
	echo "Your first release done! Congratulations!"

fi


















