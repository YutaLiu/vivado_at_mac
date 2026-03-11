# vivado_at_mac — Container image for running Vivado on macOS
FROM --platform=linux/amd64 ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# System packages: Vivado runtime deps + GUI stack (noVNC)
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    # Vivado runtime dependencies
    expect sudo \
    libxtst6 libgdk-pixbuf2.0-0 libgtk2.0-0 libgtk-3-0 libglib2.0-0 \
    python3 build-essential gcc-multilib g++ \
    ocl-icd-opencl-dev libjpeg62-dev libc6-dev-i386 \
    graphviz make unzip \
    libtinfo5 libncursesw5 libswt-gtk-4-jni \
    locales \
    # GUI stack (noVNC — browser-based, no XQuartz needed)
    x11-apps x11vnc openbox xvfb dbus-x11 \
    novnc python3-websockify \
    && rm -rf /var/lib/apt/lists/*

# UTF-8 locale
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Non-root user with sudo
RUN useradd -m -s /bin/bash -G sudo user && \
    echo "user:password" | chpasswd && \
    echo "user ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

USER user
WORKDIR /workspace

# Critical LD_PRELOAD for Vivado hw_server and GUI components
ENV LD_PRELOAD="/lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libselinux.so.1 /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libgdk-x11-2.0.so.0"
