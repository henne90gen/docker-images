FROM henne90gen/gtk:4.8

COPY main.cpp main.cpp
RUN clang++ main.cpp `pkg-config gtkmm-4.0 --cflags --libs` -std=c++20
