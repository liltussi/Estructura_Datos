import java.io.FileReader;
import java.io.IOException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import controlP5.*;
import java.security.MessageDigest;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
ControlP5 cp5;
PImage boton;
PImage Ficha;
PImage Banner;
UserAccount usuario;

// Implementación de una pestaña con contenido específico

class PestañaInicio implements Pestaña {
  File usuarios;
  ControlP5 cp5;
  boolean controlador;
  Textfield inputUsuario;
  Textfield inputContraseña;
  rectResponsive registro;
  Boton boton1;
  Boton text;
  boolean control;
  String perfil, contraseña;
  admArchivos arc;
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(122, 34, 78);
  color Color4 = color(2255, 255, 255);
  color Color5 = color(20, 89, 29);
  color Color6 = color(0, 0, 0);
  color Color7 = color(237, 174, 73);
  color Color8 = color(191, 4, 19);
  color AzulOscuro = color(#060623);
  color Amarillo = color(#FFAF30);
  color Blanco = color(#FFFFFF);
  PFont fontt = createFont("Oruguitas", 10);
  //INIT
  PestañaInicio(ControlP5 cp5) {
    this.cp5 = cp5;
    this.arc = new admArchivos();
  }
  void setup() {
    Banner = loadImage("bluebanner.png");
    background(AzulOscuro);
    textFont(fontt);
    textSize(160);
    fill(Blanco);
    textMode(CENTER);
    text("Boa Casino", 90, 430);
    Ficha = loadImage("ficharoja.png");
    controlador = true;
  }

  void draw() {
    if (controlador) {
      registro = new rectResponsive(width, 0, 20, 680, Color3);
      registro.dibujar();
      fill(Blanco);
      boton1 = new Boton(cp5, 970, 450, 180, 45, "Iniciar sesion", Amarillo, AzulOscuro);
      text = new Boton(cp5, 970, 490, 180, 20, Amarillo);
      text.enlazarAccion(new Runnable() {
        @Override
          public void run() {
          PestañaContenidoInter p3 = new PestañaContenidoInter(cp5);
          pestañaActual.cambiarPestaña(p3);
          cp5.remove("Usuario");
          cp5.remove("Contraseña");
          filter(BLUR, 2);
        }
      }
      );
      text.dibujarTexto("Registrarse", Amarillo);
      boton1.enlazarAccion(new Runnable() {
        @Override
          public void run() {
          perfil = inputUsuario.getText();
          contraseña = inputContraseña.getText();
          if (arc.revisar(perfil, contraseña)) {
            usuario.asignarInfo(perfil);
            usuario.asignarSaldo(arc.asignarSaldo(perfil));
            PestañaContenido2 p2 = new PestañaContenido2(cp5);
            pestañaActual.cambiarPestaña(p2);
            cp5.remove("Usuario");
            cp5.remove("Contraseña");
            //obtiene valores del textfield
          }
        }
      }
      );
      ControlFont font = new ControlFont(createFont("Oruguitas", 13));
      inputUsuario = cp5.addTextfield("Usuario", 880, 250, 170, 25).setColor(AzulOscuro).setColorBackground(Amarillo).setColorForeground(AzulOscuro).setColorLabel(Blanco).setFont(font);
      inputContraseña = cp5.addTextfield("Contraseña", 880, 340, 170, 25).setColor(AzulOscuro).setColorBackground(Amarillo).setColorForeground(AzulOscuro).setColorLabel(Blanco).setFont(font);
      inputContraseña.setPasswordMode(true);
      controlador = false;
    }
    boton1.dibujar();

    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
    }
    if (text.estaPresionado()) {
      mouseX = 100;
      mouseY = 100;
      text.ejecutarAccion();
      text.removeBoton();
    }
  }
}

class PestañaContenidoInter implements Pestaña {
  File usuarios, info;
  ControlP5 cp5;
  boolean controlador;
  Textfield inputUsuario;
  Textfield inputContraseña;
  Textfield confirmar;
  rectResponsive registro1;
  Boton boton1;
  Boton text;
  boolean control;
  String perfil, contraseña, confirmarS;
  admArchivos arc;
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(122, 34, 78);
  color Color4 = color(2255, 255, 255);
  color Color5 = color(20, 89, 29);
  color Color6 = color(0, 0, 0);
  color Color7 = color(237, 174, 73);
  color Color8 = color(191, 4, 19);
  color AzulOscuro = color(#060623);
  color Amarillo = color(#FFAF30);
  color Blanco = color(#FFFFFF);
  //INIT
  PestañaContenidoInter(ControlP5 cp5) {
    this.cp5 = cp5;
    this.arc = new admArchivos();
  }
  void setup() {
    Ficha = loadImage("ficharoja.png");
    registro1 = new rectResponsive(width, 0, 20, 680, Amarillo);
    registro1.moverA(750);
    controlador = true;
  }

  void draw() {
    if (controlador) {
      registro1.dibujar();
      boton1 = new Boton(cp5, 970, 450, 180, 45, "Registrarse", AzulOscuro, Amarillo);
      text = new Boton(cp5, 970, 490, 180, 20, AzulOscuro);
      text.enlazarAccion(new Runnable() {
        @Override
          public void run() {
          exit();
        }
      }
      );
      text.dibujarTexto("Ya tienes cuenta?", AzulOscuro);
      text.enlazarAccion(new Runnable() {
        @Override
          public void run() {
          PestañaInicio p1 = new PestañaInicio(cp5);
          pestañaActual.cambiarPestaña(p1);
          cp5.remove("Usuario");
          cp5.remove("Contraseña");
          cp5.remove("Repita su contraseña");
        }
      }
      );
      boton1.enlazarAccion(new Runnable() {
        @Override
          public void run() {
          perfil = inputUsuario.getText();
          contraseña = inputContraseña.getText(); //toca convertir todo esto a privado
          confirmarS = confirmar.getText();
          if (arc.revisarExistencia(perfil) && contraseña.equals(confirmarS)) {
            arc.crearCuenta(perfil, contraseña);
            arc.crearIndividual(perfil);
            PestañaInicio p2 = new PestañaInicio(cp5);
            pestañaActual.cambiarPestaña(p2);
            cp5.remove("Usuario");
            cp5.remove("Contraseña");
            cp5.remove("Repita su contraseña");
            //obtiene valores del textfield
          }
        }
      }
      );

      ControlFont font = new ControlFont(createFont("Oruguitas", 13));
      inputUsuario = cp5.addTextfield("Usuario", 880, 250, 170, 25).setColor(Blanco).setColorBackground(AzulOscuro).setColorForeground(100).setColorLabel(Blanco).setFont(font);
      inputContraseña = cp5.addTextfield("Contraseña", 880, 300, 170, 25).setColor(Blanco).setColorBackground(AzulOscuro).setColorForeground(100).setColorLabel(Blanco).setFont(font);
      confirmar = cp5.addTextfield("Repita su contraseña", 880, 350, 170, 25).setColor(Blanco).setColorBackground(AzulOscuro).setColorForeground(100).setColorLabel(Blanco).setFont(font);
      confirmar.setPasswordMode(true);
      inputContraseña.setPasswordMode(true);
      controlador = false;
    }
    boton1.dibujar();

    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
      text.removeBoton();
    }
    if (text.estaPresionado()) {
      mouseX = 100;
      text.ejecutarAccion();
      text.removeBoton();
      boton1.removeBoton();
    }
  }
}

// Implementación de otra pestaña con contenido específico
class PestañaContenido2 implements Pestaña {
  Boton boton1;
  Boton boton2;
  Boton boton3;
  Boton boton4;
  PImage ruleta = loadImage("ruleta.png");
  PImage cartas = loadImage("cartas.png");
  PImage traga = loadImage("traga.png");
  rectResponsive R;
  ControlP5 cp5;
  PImage menu = loadImage("menu.png");
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(122, 34, 78);
  color Color4 = color(255, 255, 255);
  color Color5 = color(45, 49, 66);
  color Color6 = color(0, 0, 0);
  color Color7 = color(191, 192, 192);
  color Color8 = color(223, 183, 165);
  color AzulOscuro = color(#060623);
  color Amarillo = color(#FFAF30);
  color Blanco = color(#FFFFFF);
  PestañaContenido2(ControlP5 cp5) {
    this.cp5 = cp5;
  }
  void setup() {
    background(AzulOscuro);
    boton = loadImage("boca.png");
    Ficha = loadImage("ficharoja.png");
    boton1 = new Boton(cp5, 375, 325, 200, 400, cartas);
    boton2 = new Boton(cp5, 720, 325, 200, 400, traga);
    boton3 = new Boton(cp5, 1065, 325, 200, 400, ruleta);
    R = new rectResponsive(0, 0, 100, 640, Amarillo);
    fill(Amarillo);
    rect(1155, 40, 200, 50);
    fill(AzulOscuro);
    textSize(20);
    text(usuario.saldo, 1155, 40);
    
  }

  void draw() {
    R.dibujar();
    imageMode(CENTER);
    image(menu, 50, 50);
    R.revisarPresion();
    boton1.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        PestañaRuleta Ruleta = new PestañaRuleta(cp5);
        pestañaActual.cambiarPestaña(Ruleta);
      }
    }

    );
    boton2.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        PestañaPoker Poker = new PestañaPoker(cp5);
        pestañaActual.cambiarPestaña(Poker);
      }
    }

    );
    boton3.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        PestañaTragaMone Traga = new PestañaTragaMone(cp5);
        pestañaActual.cambiarPestaña(Traga);
      }
    }

    );
    boton1.dibujarIF(Amarillo);
    boton2.dibujarIF(Amarillo);
    boton3.dibujarIF(Amarillo);
    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
    } else if (boton2.estaPresionado()) {
      boton2.ejecutarAccion();
      boton2.removeBoton();
    } else if (boton3.estaPresionado()) {
      boton3.ejecutarAccion();
      boton3.removeBoton();
    } else if (R.estado == true) {
      filter(BLUR, 2);
      PestañaContenidoInter2 p2 = new PestañaContenidoInter2(cp5);
      pestañaActual.cambiarPestaña(p2);
    }
  }
}

// Clase que representa la pestaña actual
class PestañaActual {
  Pestaña pestaña;

  // Constructor que recibe una pestaña inicial
  PestañaActual(Pestaña p) {
    pestaña = p;
    pestaña.setup();
  }

  // Método para cambiar la pestaña actual
  void cambiarPestaña(Pestaña p) {
    pestaña = p;
    pestaña.setup();
  }

  // Método para dibujar la pestaña actual
  void draw() {
    pestaña.draw();
  }
}
class PestañaContenidoInter2 implements Pestaña {
  ControlP5 cp5;
  boolean controlador;
  Boton boton1, boton2, boton3, boton4;
  rectResponsive R;
  boolean control, estado;
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(122, 34, 78);
  color Color4 = color(255, 255, 255);
  color Color5 = color(91, 99, 134);
  color Color6 = color(0, 0, 0);
  color Color7 = color(191, 192, 192);
  color Color8 = color(223, 183, 165);
  color AzulOscuro = color(#060623);
  color Amarillo = color(#FFAF30);
  color Blanco = color(#FFFFFF);
  //INIT
  PestañaContenidoInter2(ControlP5 cp5) {
    this.cp5 = cp5;
    //revisar si es necesario poner todo en el constructor
  }
  void setup() {
    Ficha = loadImage("ficharoja.png");
    R = new rectResponsive(0, 0, 100, 640, Amarillo);
    R.moverA(270);
    controlador = true;
  }

  void draw() {
    if (controlador) {
      boton1 = new Boton(cp5, 185, 230, 370, 50, "Cuenta", AzulOscuro, Amarillo);
      boton2 = new Boton(cp5, 185, 314, 370, 50, "Opciones", AzulOscuro, Amarillo);
      boton3 = new Boton(cp5, 185, 396, 370, 50, "Salir", AzulOscuro, Amarillo);
      boton1.enlazarAccion(new Runnable() {
        @Override
          public void run() {
          PestañaCuentas cuentas = new PestañaCuentas(cp5);
          pestañaActual.cambiarPestaña(cuentas);
          //obtiene valores del textfield
        }
      }
      );
      boton2.enlazarAccion(new Runnable() {
        @Override
          public void run() {
          PestañaOpciones Opcion = new PestañaOpciones(cp5);
          pestañaActual.cambiarPestaña(Opcion);
          //obtiene valores del textfield
        }
      }
      );
      boton3.enlazarAccion(new Runnable() {
        @Override
          public void run() {
          //background(Amarillo);
          boton1.removeBoton();
          boton2.removeBoton();
          boton3.removeBoton();
          Salir salir = new Salir(cp5);
          pestañaActual.cambiarPestaña(salir);
        }
      }
      );
      controlador = false;
    }
    boton1.dibujar();
    boton2.dibujar();
    boton3.dibujar();
    if (mouseX > 250 && mousePressed ) {
      mouseX = 1000;
      PestañaContenido2 p2 = new PestañaContenido2(cp5);
      pestañaActual.cambiarPestaña(p2);
    }
    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
    }
    if (boton2.estaPresionado()) {
      boton2.ejecutarAccion();
      boton2.removeBoton();
    }
    if (boton3.estaPresionado()) {
      boton3.ejecutarAccion();
      boton3.removeBoton();
    }
  }
}
class Salir implements Pestaña {
  Boton boton1;
  Boton boton2;
  Boton boton3;
  PFont font = createFont("Oruguitas", 10);
  PImage cerrar = loadImage("cerrar.png");
  color AzulOscuro = color(#060623);
  color Amarillo = color(#FFAF30);
  color Blanco = color(#FFFFFF);
  ControlP5 cp5;
  Salir (ControlP5 cp5) {
    this.cp5 = cp5;
  }
  void setup() {
    boton1 = new Boton(cp5, 760, 380, 150, 70, "Salir", Amarillo, Blanco);
    boton2 = new Boton(cp5, 530, 380, 150, 70, "Cerrar Sesión", Amarillo, Blanco);
    boton3 = new Boton(cp5, 865, 220, 40, 40, "X", Amarillo, AzulOscuro);
    rectMode(CENTER);
    fill(AzulOscuro);
    rect(width/2, height/2, 500, 250, 10, 10, 10, 10);
    fill(Blanco);
    textFont(font);
    textSize(20);
    text("Qué quiere hacer?", 640, 270);
    boton1.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        exit();
      }
    }
    );
    boton2.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        PestañaInicio c1 = new PestañaInicio(cp5);
        pestañaActual.cambiarPestaña(c1);
      }
    }
    );
    boton3.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        PestañaContenido2 c2 = new PestañaContenido2(cp5);
        pestañaActual.cambiarPestaña(c2);
      }
    }
    );
  }
  void draw() {
    boton1.dibujar();
    boton2.dibujar();
    boton3.dibujar();
    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
    }
    if (boton2.estaPresionado()) {
      boton2.ejecutarAccion();
      boton2.removeBoton();
    }
    if (boton3.estaPresionado()) {
      boton3.ejecutarAccion();
      boton3.removeBoton();
    }
  }
}
class PestañaCuentas implements Pestaña {
  Boton boton1;
  Boton boton2;
  Boton boton3;
  Boton boton4;
  rectResponsive R;
  ControlP5 cp5;
  admArchivos arc;
  PFont fontt = createFont("Oruguitas", 10);
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(122, 34, 78);
  color Color4 = color(255, 255, 255);
  color Color5 = color(45, 49, 66);
  color Color6 = color(0, 0, 0);
  color Color7 = color(191, 192, 192);
  color Color8 = color(223, 183, 165);
  color AzulOscuro = color(#070729);
  color Amarillo = color(#FFAF30);
  color Blanco = color(#FFFFFF);
  Textfield inputSaldo;
  String x;
  int recarga;
  String monto;
  PestañaCuentas(ControlP5 cp5) {
    this.cp5 = cp5;
  }
  void setup() {
    background(Amarillo);
    arc = new admArchivos();
    boton = loadImage("volver.png");
    Ficha = loadImage("ficharoja.png");
    boton1 = new Boton(cp5, 40, 40, 40, 40, boton);
    boton2 = new Boton(cp5, 410, 390, 150, 35, "Confirmar", AzulOscuro, Blanco);
    boton3 = new Boton(cp5, 980, 330, 150, 35, "Cambiar contraseña", Amarillo, AzulOscuro);
    boton4 = new Boton(cp5, 980, 390, 150, 35, "Eliminar cuenta", Amarillo, AzulOscuro);
    
    fill(AzulOscuro);
    rect(1155, 50, 200, 50);
    fill(Blanco);
    text(usuario.saldo, 1155, 50);
    
    fill(AzulOscuro);
    textFont(fontt);
    textMode(CENTER);
    textSize(20);
    text("RECARGAR", 410, 260);
    fill(AzulOscuro);
    rect(975, 350, 375, 450);
    fill(Amarillo);
    textFont(fontt);
    textMode(CENTER);
    textSize(20);
    text("¿Qué desea hacer?", 980, 250);
    ControlFont font = new ControlFont(createFont("Oruguitas", 12));
    inputSaldo = cp5.addTextfield("Ingrese el monto", 255, 290, 300, 40).setColor(Blanco).setColorBackground(AzulOscuro).setColorForeground(100).setColorLabel(AzulOscuro).setFont(font);
  }

  void draw() {
    boton2.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        try {
          monto = inputSaldo.getText();
          x = arc.recargar(monto, usuario.usuario);
          usuario.asignarSaldo(x);
          background(Amarillo);
          cp5.remove("Ingrese el monto");
          PestañaCuentas cr = new PestañaCuentas(cp5);
          pestañaActual.cambiarPestaña(cr);
        }
        catch(NumberFormatException e) {
        }
      }
    }
    );
    boton1.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        PestañaContenido2 p2 = new PestañaContenido2(cp5);
        pestañaActual.cambiarPestaña(p2);
        cp5.remove("Ingrese el monto");
      }
    }

    );
    boton1.dibujarI();
    boton2.dibujar();
    boton3.dibujar();
    boton4.dibujar();
    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
    }
    if (boton2.estaPresionado()) {
      boton2.ejecutarAccion();
      boton2.removeBoton();
    }
  }
}
class PestañaOpciones implements Pestaña {
  Boton boton1;
  Boton boton2;
  Boton boton3;
  Boton boton4;
  rectResponsive R;
  ControlP5 cp5;
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(122, 34, 78);
  color Color4 = color(255, 255, 255);
  color Color5 = color(45, 49, 66);
  color Color6 = color(0, 0, 0);
  color Color7 = color(237, 174, 73);
  color Color8 = color(223, 183, 165);
  PestañaOpciones(ControlP5 cp5) {
    this.cp5 = cp5;
  }
  void setup() {
    background(Color5);
    boton = loadImage("boca.png");
    Ficha = loadImage("ficharoja.png");
    boton3 = new Boton(cp5, 1065, 325, 200, 400, boton);
    R = new rectResponsive(0, 0, 100, 640, Color8);
    fill(Color7);
    rect(975, 50, 200, 50);
    fill(Color6);
    text(usuario.saldo, 975, 50);
  }

  void draw() {
    R.dibujar();
    R.revisarPresion();
    boton3.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        exit();
      }
    }

    );
    boton3.dibujarI();
    if (boton3.estaPresionado()) {
      boton3.ejecutarAccion();
      boton3.removeBoton();
    } else if (R.estado == true) {
      filter(BLUR, 2);
      PestañaContenidoInter2 p2 = new PestañaContenidoInter2(cp5);
      pestañaActual.cambiarPestaña(p2);
    }
  }
}
class PestañaContenidoIntercuenta implements Pestaña {
  ControlP5 cp5;
  boolean controlador;
  Boton boton1, boton2, boton3;
  rectResponsive R;
  boolean control, estado;
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(241, 250, 238);
  //INIT
  PestañaContenidoIntercuenta(ControlP5 cp5) {
    this.cp5 = cp5;
    //revisar si es necesario poner todo en el constructor
  }
  void setup() {
    Ficha = loadImage("ficharoja.png");
    R = new rectResponsive(0, 0, 100, 640, Color2);
    R.moverA(270);
    controlador = true;
  }

  void draw() {
    if (controlador) {
      boton1 = new Boton(cp5, 185, 250, 350, 50, "Recargar", Color1);
      boton3 = new Boton(cp5, 185, 375, 350, 50, "Volver al menu", Color1);
      boton1.enlazarAccion(new Runnable() {
        @Override
          public void run() {
          PestañaCuentas cuentas = new PestañaCuentas(cp5);
          pestañaActual.cambiarPestaña(cuentas);
          //obtiene valores del textfield
        }
      }
      );
      boton3.enlazarAccion(new Runnable() {
        @Override
          public void run() {
          PestañaContenido2 p2 = new PestañaContenido2(cp5);
          pestañaActual.cambiarPestaña(p2);
          //obtiene valores del textfield
        }
      }
      );
      controlador = false;
    }
    boton1.dibujar();
    boton3.dibujar();
    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
    }
    if (boton3.estaPresionado()) {
      boton3.ejecutarAccion();
      boton3.removeBoton();
    }
  }
}
class PestañaInstruciones implements Pestaña {
  Boton boton1;
  Boton boton4;
  rectResponsive R;
  ControlP5 cp5;
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(245, 200, 36);
  color Color4 = color(122, 104, 82);
  PestañaInstruciones(ControlP5 cp5) {
    this.cp5 = cp5;
  }
  void setup() {
    background(100);
    boton = loadImage("boca.png");
    Ficha = loadImage("ficharoja.png");
    boton1 = new Boton(cp5, 1175, 600, 200, 50, boton);
    R = new rectResponsive(0, 0, 50, 50, Color1);
    fill(Color4);
    rect(700, 323, 979, 555);
  }

  void draw() {
    R.dibujar();
    R.revisarPresion();
    boton1.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        exit();
      }
    }

    );
    boton1.dibujarI();
    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
    } else if (R.estado == true) {
      filter(BLUR, 2);
      PestañaContenidoIntercuenta p2 = new PestañaContenidoIntercuenta(cp5);
      pestañaActual.cambiarPestaña(p2);
    }
  }
}
class PestañaRuleta implements Pestaña {
  Boton boton1;
  Boton boton4;
  rectResponsive R;
  ControlP5 cp5;
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(245, 200, 36);
  color Color4 = color(222, 104, 82);
  PestañaRuleta(ControlP5 cp5) {
    this.cp5 = cp5;
  }
  void setup() {
    background(100);
    boton = loadImage("boca.png");
    Ficha = loadImage("ficharoja.png");
    boton1 = new Boton(cp5, 1175, 600, 200, 50, boton);
    R = new rectResponsive(0, 0, 50, 50, Color2);
    fill(Color4);
    rect(700, 323, 979, 555);
  }

  void draw() {
    R.dibujar();
    R.revisarPresion();
    boton1.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        exit();
      }
    }

    );
    boton1.dibujarI();
    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
    } else if (R.estado == true) {
      filter(BLUR, 2);
      PestañaContenidoIntercuenta p2 = new PestañaContenidoIntercuenta(cp5);
      pestañaActual.cambiarPestaña(p2);
    }
  }
}
class PestañaPoker implements Pestaña {
  Boton boton1;
  Boton boton4;
  rectResponsive R;
  ControlP5 cp5;
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(245, 200, 36);
  color Color4 = color(22, 104, 82);
  PestañaPoker(ControlP5 cp5) {
    this.cp5 = cp5;
  }
  void setup() {
    background(100);
    boton = loadImage("boca.png");
    Ficha = loadImage("ficharoja.png");
    boton1 = new Boton(cp5, 1175, 600, 200, 50, boton);
    R = new rectResponsive(0, 0, 50, 50, Color1);
    fill(Color4);
    rect(700, 323, 979, 555);
  }

  void draw() {
    R.dibujar();
    R.revisarPresion();
    boton1.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        exit();
      }
    }

    );
    boton1.dibujarI();
    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
    } else if (R.estado == true) {
      filter(BLUR, 2);
      PestañaContenidoIntercuenta p2 = new PestañaContenidoIntercuenta(cp5);
      pestañaActual.cambiarPestaña(p2);
    }
  }
}



class PestañaTragaMone implements Pestaña {
  Boton boton1;
  Boton boton4;
  rectResponsive R;
  ControlP5 cp5;
  color Color1 = color(176, 147, 152); //B09398
  color Color2 = color(100, 49, 115); //643173
  color Color3 = color(245, 200, 36);
  color Color4 = color(175, 104, 182);
  PestañaTragaMone(ControlP5 cp5) {
    this.cp5 = cp5;
  }
  void setup() {
    background(100);
    boton = loadImage("boca.png");
    Ficha = loadImage("ficharoja.png");
    boton1 = new Boton(cp5, 1175, 600, 200, 50, boton);
    R = new rectResponsive(0, 0, 50, 50, Color1);
    fill(Color4);
    rect(700, 323, 979, 555);
  }

  void draw() {
    R.dibujar();
    R.revisarPresion();
    boton1.enlazarAccion(new Runnable() {
      @Override
        public void run() {
        exit();
      }
    }

    );
    boton1.dibujarI();
    if (boton1.estaPresionado()) {
      boton1.ejecutarAccion();
      boton1.removeBoton();
    } else if (R.estado == true) {
      filter(BLUR, 2);
      PestañaContenidoIntercuenta p2 = new PestañaContenidoIntercuenta(cp5);
      pestañaActual.cambiarPestaña(p2);
    }
  }
}
