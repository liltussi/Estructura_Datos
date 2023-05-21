PestañaActual pestañaActual;

void setup() {
  size(1280, 640);
  usuario = new UserAccount();
  cp5 = new ControlP5(this);
  PestañaInicio p1 = new PestañaInicio(cp5);
  pestañaActual = new PestañaActual(p1);
}

void draw() {
  pestañaActual.draw();
}
