# Dockerfile for Building and Running Astron

# Use the latest Ubuntu as the base image
FROM ubuntu:latest

# Install necessary dependencies to build AsUniversetron
RUN apt-get update && \
    apt-get install -y \
    cmake \
    libyaml-cpp-dev \
    libmongoclient-dev \
    llvm \
    libboost-dev \
    clang \
    g++ \
    gcc \
    libuv1-dev

# Copy the local source directory into the container and set the working directory
COPY . /app-src
WORKDIR /app-src

# Build Universe and set the application entrypoint
RUN mkdir -p /app/build && \
    cd /app/build && \
    cmake -DCMAKE_BUILD_TYPE=Release /app-src && \
    make && \
    mv astrond /app && \
    rm -rf /app-src && \
    rm -rf /app/build

# Set the working directory to /app and set the executable as the entrypoint
WORKDIR /app 
ENTRYPOINT [ "./astrond" ]