//version 1
class UserAccount {
  private File infoUsuarios;
  private String usuario, saldo;
  UserAccount() {
    this.infoUsuarios = new File(dataPath(""), "/cuentas.txt");
    this.usuario = null;
    this.saldo = null;
  }
  
  void asignarInfo(String u) {
    this.usuario = u;
  }
  void asignarSaldo(String u){
    this.saldo = u;
  }
}
