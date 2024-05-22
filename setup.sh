#!/usr/bin/env bash

echo "Setting up MUSL locales for UTF-8 unicode."
export MUSL_LOCALE_DEPS="cmake musl-dev gcc gettext-dev libintl build-base zlib-dev gnutls-dev pcre-dev make wget inetutils-syslogd util-linux util-linux-dev"
export MUSL_LOCPATH=/usr/share/i18n/locales/musl

mkdir build/ && cd build

sudo apk update
sudo apk add --no-cache $MUSL_LOCALE_DEPS \
    && wget https://gitlab.com/rilian-la-te/musl-locales/-/archive/master/musl-locales-master.zip \
    && unzip musl-locales-master.zip \
    && cd musl-locales-master \
    && cmake -DLOCALE_PROFILE=OFF -DCMAKE_INSTALL_PREFIX:PATH=/usr . && make && make install \
    && cd .. && echo 'export MUSL_LOCPATH=/usr/share/i18n/locales/musl' >> ~/.bashrc \
    && echo 'export LC_ALL=en_US.UTF-8' >> ~/.bashrc \
    && echo 'export LANG=en_US.UTF-8' >> ~/.bashrc

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
echo "Musl locales are setup."

echo "Getting ready to build Tinyfugue 5..."
echo 'export PATH="/usr/local/bin:$PATH"' >> ~/.bashrc
export PATH="/usr/local/bin:$PATH"
sudo apk add git 
git clone -b widechar https://github.com/kruton/tinyfugue.git
cd tinyfugue
./configure --prefix=/usr/local && make -j2
if [ 'echo $?' == 0 ]; then
    sudo make install
    sudo cp tinyfugue-scripts/*.tf /usr/local/share/tf-lib/
    echo "Copying tfrc file to main directory. Please use 'nano ~/tfrc' to edit the file before using tf5."
    cp tfrc ~/tfrc
    echo "Creating the ~/tf-dir directory."
    mkdir -p ~/tf-dir
    echo "Copying user-scripts to ~/tf-dir directory."
    cp user-scripts/*.tf ~/tf-dir
    echo "Creating TFLogs file for storing logs."
    mkdir -p ~/TFLogs/Tapestries/
    echo "Creating the tf-hist directory for storing input history."
    mkdir -p ~/tf-hist
    echo "Finished build and installing TinyFugue 5. Start it with 'tf'"
else
    echo "Build failed. Cannot continue." 
    echo "Copy the output of everything you've done and submit it to https://github.com/baddylan/automatic-ios-setup-tf5/issues and I'll do my best to help."
fi
