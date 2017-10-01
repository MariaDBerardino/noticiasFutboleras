package publicaciones;


public class Articulo {

    private  int id;
    private  String fecha;
    private  String titulo;
    private  String copete;
    private  String texto;
    private  int imagenID;
    private  int autorID;
    private String apellido;
    private String nombre;
    
    static String elJason;
    

    
    public int getid() {
        return id;
    }
    public void setid(int id) {
        this.id = id;
    }
    
    public String getfecha() {
        return fecha;
    }
    public void setfecha(String fecha) {
        this.fecha = fecha;
    }
    public  String gettitulo() {
        return titulo;
    }
    public void settitulo(String titulo) {
        this.titulo = titulo;
    }
    public String getcopete() {
        return copete;
    }
    public void setcopete(String copete) {
        this.copete = copete;
    }
    public String gettexto() {
        return texto;
    }
    public void settexto(String texto) {
        this.texto = texto;
    }
    public int getimagenID() {
        return imagenID;
    }
    public void setimagenID(int imagenID) {
        this.imagenID = imagenID;
    }
     public int getautorID() {
        return  autorID;
    }
    public void setautorID(int autorID) {
        this.autorID = autorID;
    }
    
    public  String getapellido() {
        return apellido;
    }
    public void setapellido(String apellido) {
        this.apellido = apellido;
    }
    public String getnombre() {
        return nombre;
    }
    public void setnombre(String nombre) {
        this.nombre = nombre;
    }
    
    public void armarFrase(String ape, String nom){
        setapellido(ape);
        setnombre(nom);
    }
    
    public String mostrameFrase(){
        String frase;
        frase = "El periodista se llama " + nombre + " " + apellido;
        
        return frase;
    }

}