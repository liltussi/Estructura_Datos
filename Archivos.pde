import java.util.Base64;
import java.security.MessageDigest;
import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
class admArchivos {
  private File usuarios;
  private File infoUsuarios;
  admArchivos() {
    this.usuarios = usuarios;
    this.usuarios = new File(dataPath(""), "/usuarios.txt"); //vaina con usuarios y contraseñas
    this.infoUsuarios = infoUsuarios;
    this.infoUsuarios = new File(dataPath(""), "/cuentas.txt"); //vaina con usuarios y saldos
  }
  String recargar(String valor, String usuarios) {
    int x = 0;
    try {
      String linen = null;
      FileReader fileread = new FileReader(this.infoUsuarios);
      BufferedReader brr = new BufferedReader(fileread);

      File rnuevo = new File("NuevoT.txt");
      FileWriter fw = new FileWriter(rnuevo, true);
      BufferedWriter buffer = new BufferedWriter(fw);
      PrintWriter pwt = new PrintWriter(buffer);

      while ((linen = brr.readLine()) != null) {
        String temp[] = linen.split("\t");
        if (temp[0].equalsIgnoreCase(usuarios)) {
          x = int(temp[1]) + int(valor);
          pwt.println(usuarios + "\t" + String.valueOf(x));
        } else {
          pwt.println(linen);
        }
      }

      brr.close();
      pwt.close();
      fw.close();
      buffer.close();
      this.infoUsuarios.delete();
      rnuevo.renameTo(this.infoUsuarios);
      return String.valueOf(x);
    }
    catch (IOException ex) {
      System.out.println("Error: " + ex.getMessage());
      return String.valueOf(x);
    }
  }

  boolean revisar(String usuario, String contraseña) {
    try {
      String line = null;
      String comparedcontraseña = encrypt(contraseña);
      FileReader fileread = new FileReader(this.usuarios);
      BufferedReader brr = new BufferedReader(fileread);
      while ((line = brr.readLine()) != null) {
        String temp[] = line.split("\t");
        if ((temp[0].equalsIgnoreCase(usuario) && temp[1].equalsIgnoreCase(comparedcontraseña))) {
          brr.close();
          return true;
        }
      }
      brr.close();
      return false;
    }
    catch (IOException ex) {
      System.out.println("No se encontró algún archivo");
      return false;
    }
    catch (Exception e) {
      e.printStackTrace();
      return false;
    }
  }
  //relacionado con el registro
  boolean revisarExistencia(String usuario) {
    try {
      String line = null;
      FileReader fileread = new FileReader(this.usuarios);
      BufferedReader brr = new BufferedReader(fileread);
      while ((line = brr.readLine()) != null) {
        String temp[] = line.split("\t");
        if (temp[0].equalsIgnoreCase(usuario)) {
          brr.close();
          return false;
        }
      }
      brr.close();
      return true;
    }
    catch (IOException ex) {
      System.out.println("No se encontro archivo");
      return false;
    }
  }
  void crearCuenta(String usuario, String contraseña) {
    try {
      String encryptedPassword = encrypt(contraseña);
      String linen = null;
      FileReader fileread = new FileReader(this.usuarios);
      BufferedReader brr = new BufferedReader(fileread);

      File rnuevo = new File("Nuevot" + ".txt");
      FileWriter fw = new FileWriter(rnuevo, true);
      BufferedWriter buffer = new BufferedWriter(fw);
      PrintWriter pwt = new PrintWriter(buffer);

      while ((linen = brr.readLine()) != null) {
        pwt.println(linen);
      }
      pwt.println(usuario + "\t" + encryptedPassword);
      brr.close();
      pwt.close();
      fw.close();
      buffer.close();
      this.usuarios.delete();
      rnuevo.renameTo(this.usuarios);
    }
    catch (IOException ex) {
      System.out.println("No se encontró algún archivo");
    }
    catch (Exception e) {
      e.printStackTrace();
    }
  }
  String encrypt(String input) throws Exception {
    byte[] key = "0123456789abcdef".getBytes(); // Clave secreta de 16 caracteres
    byte[] data = input.getBytes();

    Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
    SecretKeySpec secretKey = new SecretKeySpec(key, "AES");
    cipher.init(Cipher.ENCRYPT_MODE, secretKey);

    byte[] encryptedData = cipher.doFinal(data);

    return Base64.getEncoder().encodeToString(encryptedData);
  }
  void crearIndividual(String usuario) {
    //cuentas individuales sirve
    try {
      String line = null;
      File original = this.infoUsuarios;
      FileReader filereade = new FileReader(original);
      BufferedReader br = new BufferedReader(filereade);

      File nuevo = new File("Nuevo.txt");
      FileWriter fww = new FileWriter(nuevo, true);
      BufferedWriter bufffer = new BufferedWriter(fww);
      PrintWriter pw = new PrintWriter(bufffer);

      while ((line = br.readLine()) != null) {
        pw.println(line);
      }
      pw.println(usuario + "\t" + "0");
      br.close();
      pw.close();
      fww.close();
      bufffer.close();
      original.delete();
      nuevo.renameTo(original);
    }
    catch (IOException ex) {
      System.out.println("No se encontro algun archivo");
    }
  }
  String asignarSaldo(String u) {
    try {
      String line = null;
      FileReader fileread = new FileReader(this.infoUsuarios);
      BufferedReader brr = new BufferedReader(fileread);
      while ((line = brr.readLine()) != null) {
        String temp[] = line.split("\t");
        if (temp[0].equalsIgnoreCase(u)) {
          brr.close();
          return temp[1];
        }
      }
      brr.close();
      return null;
    }
    catch (IOException ex) {
      System.out.println("No se encontro archivo");
      return null;
    }
  }
}




//public boolean validar(String input){
//}
//public void referencia(File xd){
//  File
//  this.usuarios =
//}
