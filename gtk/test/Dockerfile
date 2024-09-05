FROM henne90gen/gtk:latest

COPY main.cpp main.cpp
RUN clang++ main.cpp `pkg-config --cflags --libs gtk4` `pkg-config --cflags --libs libadwaita-1` -std=c++20
