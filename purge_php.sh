#!/bin/sh

echo "Purging the php environment..."

# I do not recommend running sudo apt-get purge php*.

# That was scary! Fortunately, I didn't type the -y option, because it chose about hundred of packages without php in their name.

sudo apt-get purge `dpkg -l | grep php| awk '{print $2}' |tr "\n" " "`

# How it works:

# First, a list of packages is generated using this series of commands: dpkg -l | grep php| awk '{print $2}' |tr "\n" " ".

# Hint: You can run this part of the command in your terminal to see what packages would get removed. You should get something like: libapache2-mod-php5 php5 php5-cli php5-common php5-json

# Finally, when you run the full command, this list of packages gets passed to sudo apt-get purge, removing all of the packages.

# Hint: If it feels safer to you, you could just as easily run them separately, and copy+paste the list of packages to remove like so: sudo apt-get purge libapache2-mod-php5 php5 php5-cli php5-common php5-json
