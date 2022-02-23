# Useful Docker Images

## C++

Docker images to ease development of C++ projects.
All images use Clang, CMake and Ninja.

### Clang

Basic image with clang pre-installed.

### GTK

This image contains all dependencies necessary to build GTK applications.
TODO find out how to build gtkmm without building all the tests

### OpenGL

This image contains dependencies and tools to build and run OpenGL headless applications.

### TODO

- gstreamer
- ffmpeg?
- OpenCV?

## Other

### WebDAV

A simple WebDAV server based on Apache2 for serving a local directory over the web.

### Netcup DynDNS

The code for this image is copied from [dynamic-dns-netcup-api](https://github.com/stecklars/dynamic-dns-netcup-api).
It has been modified to allow configuration through environment variables.
