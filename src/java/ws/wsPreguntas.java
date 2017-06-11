package ws;

import java.util.ArrayList;
import java.util.List;
import modelo.Pregunta;
import org.springframework.web.bind.annotation.*;

@RestController
public class wsPreguntas 
{
    @RequestMapping(value = "findPreguntas")
    public static List<Pregunta> findPreguntas()
    {
        List<Pregunta> listadoDePreguntas = new ArrayList<Pregunta>();
        
        String jpql = "SELECT p FROM Pregunta p";
        listadoDePreguntas = daos.DAOEclipse.findAllByJPQL(jpql);
        
        return listadoDePreguntas;
    }
    @RequestMapping(value = "addPregunta")
    public static boolean addPregunta(@RequestParam(value = "pregunta") String strPregunta, @RequestParam(value = "respuesta") String respuesta, @RequestParam(value = "esImagen" ,defaultValue = "false") boolean esImagen)
    {
        boolean agrego = false;
        
        Pregunta pregunta = new Pregunta(strPregunta,respuesta,esImagen);
        
        agrego = daos.DAOEclipse.update(pregunta);
        
        return agrego;
    }
    @RequestMapping(value = "editPregunta")
    public static boolean editPregunta(@RequestParam(value = "id" , defaultValue = "-1") int id, @RequestParam(value = "pregunta") String strPregunta, @RequestParam(value = "respuesta") String respuesta, @RequestParam(value = "esImagen" ,defaultValue = "false") boolean esImagen)
    {
        boolean edito = false;
        
        if( id != -1)
        {
            Pregunta preguntaDB = (Pregunta) daos.DAOEclipse.get(Pregunta.class, id);
            
            if(preguntaDB != null)
            {
                preguntaDB.setPregunta(strPregunta);
                preguntaDB.setRespuesta(respuesta);
                preguntaDB.setEsImagen(esImagen);
                
                edito = daos.DAOEclipse.update(preguntaDB);
            }
        }
        
        
        
        return edito;
    }
    @RequestMapping(value = "rmPregunta")
    public static boolean rmPregunta(@RequestParam(value = "id" , defaultValue = "-1") int id)
    {
        boolean quito = false; ;
        
        if( id != -1)
        {
            Pregunta preguntaDB = (Pregunta) daos.DAOEclipse.get(Pregunta.class, id);
            
            if(preguntaDB != null)
            {
                quito = daos.DAOEclipse.remove(preguntaDB);
            }
        }
        
        return quito;
    }
}
