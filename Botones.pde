class Boton {
  float x, y; // coordenadas x, y del botón
  float ancho, alto, radio; // ancho y alto del botón
  String texto; // texto en el botón
  boolean presionado; // estado del botón (presionado o no)
  Runnable accion; // función enlazada al botón
  ControlP5 cp5;
  color colorr, color1;
  color color2 = 0;
  PImage foto;
  PFont font = createFont("Oruguitas", 10);
  // Constructor del botón
  Boton(ControlP5 cp5, float x, float y, float ancho, float alto, String texto, color colorr) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
    this.texto = texto;
    this.presionado = false;
    this.cp5 = cp5;
    this.colorr = colorr;
  }
  Boton(ControlP5 cp5, float x, float y, float ancho, float alto, color colorr) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
    this.presionado = false;
    this.cp5 = cp5;
    this.colorr = colorr;
  }
  Boton(ControlP5 cp5, float x, float y, float ancho, float alto, PImage foto) {
    this.cp5 = cp5;
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
    this.foto = foto;
  }
  Boton(ControlP5 cp5, float x, float y, float ancho, float alto, String texto, color color1, color color2){
    this.x = x;
    this.y = y;
    this.texto = texto;
    this.ancho = ancho;
    this.alto = alto;
    this.presionado = false;
    this.cp5 = cp5;
    this.color1 = color1;
    this.color2 = color2;
  }
  Boton(ControlP5 cp5, float x, float y, float radio) {
    this.cp5 = cp5;
    this.x = x;
    this.y = y;
    this.radio = radio;
  }
  void dibujarC() {
    //int colorr = presionado ? 0 : 255;
    stroke(255);
    noFill();
    rectMode(CENTER);
    circle(x, y, radio);
  }
  void dibujarI() {
    imageMode(CENTER);
    image(this.foto, x, y, ancho, alto);
  }
  void dibujarIF(color F) {
    fill(F);
    rectMode(CENTER);
    rect(x,y,ancho,alto);
    imageMode(CENTER);
    image(this.foto, x, y, ancho-300, alto-300);
  }
  
  
  void dibujarTexto(String texto, color colorr) {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    textFont(font);
    textSize(16);
    fill(colorr);
    text(texto, x, y, ancho, alto);  
  }
  // Método para dibujar el botón en la pantalla
  void dibujar() {
    if (texto != null) {
      noStroke();
      fill(color1);
      rectMode(CENTER);
      rect(x, y, ancho, alto);
      textAlign(CENTER, CENTER);
      textFont(font);
      textSize(16);
      fill(this.color2);
      text(texto, x, y, ancho, alto);
    } else {
      stroke(255);
      fill(colorr);
      rectMode(CENTER);
      textFont(font);
      rect(x, y, ancho, alto);
      textAlign(CENTER, CENTER);
      textSize(12);
    }
  }
  void removeBoton() {
    cp5.remove(this);
  }
  // Método para verificar si el botón ha sido presionado
  boolean estaPresionado() {
    if (mouseX > x-ancho/2 && mouseX < x+ancho/2 && mouseY > y-alto/2 && mouseY < y + alto/2 && mousePressed) {
      this.presionado=true;
      return true;
    } else {
      this.presionado=false;
      return false;
    }
  }
  void setPresion(boolean Estado) {
    this.presionado = Estado;
  }
  // Método para enlazar una función al botón
  void enlazarAccion(Runnable accion) {
    this.accion = accion;
  }

  // Método para ejecutar la función enlazada al botón
  void ejecutarAccion() {
    if (accion != null) {
      accion.run();
    }
  }
}

//Ejemplo de instancia de botones

//Boton botonfeo;
//Boton botonBonito;
//void exito() {
//  exit();
//}
//void printalgo() {
//  print("xd");
//}
//void setup() {
//  size(900, 900);
//  botonfeo = new Boton(12, 12, 100, 100, "xd");
//  botonfeo.enlazarAccion(new Runnable() {
//    @Override
//      public void run() {
//      exito();
//    }
//  }
//  );
//  botonBonito = new Boton(120, 120, 100, 100, "lol");
//  botonBonito.enlazarAccion(new Runnable() {
//    @Override
//      public void run() {
//      printalgo();
//    }
//  }
//  );
//}
//void draw() {
//  botonfeo.dibujar();
//  if (botonfeo.estaPresionado()) {
//    botonfeo.ejecutarAccion();
//  }
//  botonBonito.dibujar();
//  if (botonBonito.estaPresionado()) {
//    botonBonito.ejecutarAccion();
//  }
//}
