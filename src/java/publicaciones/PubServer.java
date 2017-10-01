package publicaciones;

import com.google.gson.Gson;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeMap;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet(name = "PubServer", urlPatterns = {"/PubServer"})
public class PubServer extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, 
            HttpServletResponse response)
            throws ServletException, IOException {
        
        Gson convertir = new Gson();
               
        //noticia.armameLosValores();
        //response.getWriter().println(noticia.armameLosValores());
        
        Connection conexion = null;
        try {
            // Siempre voy a Devolver una lista de Notas, asi este vacia.
            ArrayList<TreeMap> todasLasNotas = new ArrayList();
            
            // Cargar al DriverManager la libreria de Mysql
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            // Conectar a la Base de Datos 
            conexion = DriverManager.getConnection(
                    "jdbc:mysql://localhost/nuevaFutbol",
                    "futbol",
                    "futbol");
            
            // Ejecutar la Sentencia, Select * from 
            PreparedStatement sentencia = conexion.prepareStatement(
                    " SELECT *\n" + "FROM notas\n" + 
                            "INNER JOIN autores ON notas.not_aut_id = autores.aut_id  INNER JOIN imagenes ON notas.not_img_id = imagenes.ima_id;");
            
            // Obtener los resultados, si los hay.
            ResultSet  resultado = sentencia.executeQuery();
            while( resultado.next() ){ // Contexto de Creacion de Instancias de Articulos
                // Voy a instanciar, tantos articulos como hay en la DB
                TreeMap<String, String> unaNota = new TreeMap();
                
                unaNota.put("id",   resultado.getString("not_id"));
                unaNota.put("titulo", resultado.getString("not_titulo"));
                unaNota.put("fecha", resultado.getString("not_fecha"));
                unaNota.put("copete",  resultado.getString("not_copete"));
                unaNota.put("texto",  resultado.getString("not_texto"));
                unaNota.put("apellido", resultado.getString("aut_apellido"));
                unaNota.put("nombre", resultado.getString("aut_nombre"));
                unaNota.put("url", resultado.getString("ima_url"));
                // Voy a Agregar, Cada articulo Instanciado a la lista notas
                todasLasNotas.add(unaNota);
            }
            
           
            response.getWriter().println(convertir.toJson(todasLasNotas));
            
            
        /*    ArrayList miNuevoVector = (ArrayList) todasLasNotas.clone();  
            Object[] nota = miNuevoVector.toArray();
                
            String elJason = convertir.toJson(nota);   
                     //  todo el vector o una fila nomas
            String elJason = convertir.toJson(nota[5]);
            
            Articulo noticia = new Articulo();
            Articulo parsedData = convertir.fromJson(elJason, Articulo.class);
            noticia.armarFrase(parsedData.getapellido(), parsedData.getnombre());
            response.getWriter().println(noticia.mostrameFrase());      */
            

                
            
        } catch (SQLException ex) {
            response.getWriter().println(convertir.toJson( "ERROR: " + ex.getMessage() ) );
        } catch (ClassNotFoundException ex) {
            response.getWriter().println(convertir.toJson( "ERROR: " + ex.getMessage() ) );
        } catch (InstantiationException ex) {
            response.getWriter().println(convertir.toJson( "ERROR: " + ex.getMessage() ) );
        } catch (IllegalAccessException ex) {
            response.getWriter().println(convertir.toJson( "ERROR: " + ex.getMessage() ) );
        }finally{
            try {
                conexion.close();
            } catch (SQLException ex) {
                response.getWriter().println(convertir.toJson( "ERROR: " + ex.getMessage() ) );
            }
        }
           
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
    }
    
    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        
    }   

}
