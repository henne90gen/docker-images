FROM henne90gen/opengl:3.1

COPY main.cpp main.cpp
RUN clang++ main.cpp -lGL -lGLU -lglut
RUN xvfb-run -a ./a.out
