#include <GL/glut.h>
#include <iostream>

void displayMe(void) {
  glClear(GL_COLOR_BUFFER_BIT);
  glBegin(GL_POLYGON);
  glVertex3f(0.0, 0.0, 0.0);
  glVertex3f(0.5, 0.0, 0.0);
  glVertex3f(0.5, 0.5, 0.0);
  glVertex3f(0.0, 0.5, 0.0);
  glEnd();
  glFlush();

  int majorVersion = 0;
  glGetIntegerv(GL_MAJOR_VERSION, &majorVersion);
  int minorVersion = 0;
  glGetIntegerv(GL_MINOR_VERSION, &minorVersion);
  std::cout << "OpenGL Version: " << majorVersion << "." << minorVersion
            << std::endl;
    exit(0);
}

int main(int argc, char **argv) {
  glutInit(&argc, argv);
  glutInitDisplayMode(GLUT_SINGLE);
  glutInitWindowSize(300, 300);
  glutInitWindowPosition(100, 100);
  glutCreateWindow("Hello world");
  glutDisplayFunc(displayMe);
  glutMainLoop();
  return 0;
}
