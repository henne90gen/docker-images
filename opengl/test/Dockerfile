FROM henne90gen/opengl:latest

COPY main.cpp main.cpp
RUN clang++ main.cpp -lGL -lGLU -lglut
RUN xvfb-run -a ./a.out
