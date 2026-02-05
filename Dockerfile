FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y \
      build-essential \
      wget \
      curl \
      gdb-multiarch \
      openocd \
      stlink-tools \
      git \
      clang-format

WORKDIR /home

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz

RUN tar xJf arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz -C /usr/share

RUN ln -s /usr/share/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc

RUN ln -s /usr/share/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin/arm-none-eabi-g++ /usr/bin/arm-none-eabi-g++

RUN ln -s /usr/share/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin/arm-none-eabi-gdb /usr/bin/arm-none-eabi-gdb

RUN ln -s /usr/share/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin/arm-none-eabi-size /usr/bin/arm-none-eabi-size

RUN ln -s /usr/share/arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi/bin/arm-none-eabi-objcopy /usr/bin/arm-none-eabi-objcopy

RUN rm -rf arm-gnu-toolchain-13.3.rel1-x86_64-arm-none-eabi.tar.xz

WORKDIR /app

RUN echo 'export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"' >> /etc/bash.bashrc

CMD bash