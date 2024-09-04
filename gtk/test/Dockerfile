FROM henne90gen/gtk:latest

COPY main.cpp main.cpp
RUN clang++ main.cpp `pkg-config gtkmm-4.0 --cflags --libs` -std=c++20
