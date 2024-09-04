FROM henne90gen/gtk:latest

COPY main.cpp main.cpp
RUN clang++ main.cpp `pkg-config gtk4 --cflags --libs` -std=c++20
