FROM ubuntu:16.04

RUN apt-get install bison g++-multilib git gperf libxml2-utils make zlib1g-dev:i386 zip maven liblz4-tool
RUN apt-get install openjdk-7-jre openjdk-7-jdk

RUN mkdir ~/bin && mkdir ~/bin/repo
ENV PATH=/repo:$PATH
RUN cd ~/bin \
    && curl http://commondatastorage.googleapis.com/git-repo-downloads/repo > /bin/repo
    && chmod a+x ~/bin/repo

RUN mkdir ~/cm13 \
    && cd ~/cm13 \
    && git config --global user.email "batman@dccomics.com" \
    && git config --global user.name "The_Dark_Knight" \
    && repo init -u git://github.com/CyanogenMod/android.git -b cm-13.0 \
    && repo sync
#    cat /proc/cpuinfo | grep processor | wc -l
