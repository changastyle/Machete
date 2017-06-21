package ws;

import modelo.*;
import java.util.*;
import org.springframework.web.bind.annotation.*;


@RestController
public class wsTemas
{
    @RequestMapping(value = "findTemas")
    public static List<Tema> findTemas()
    {
        List<Tema> temasList = new ArrayList<Tema>();
        
        String jpql = "SELECT t FROM Tema t";
        
        temasList = daos.DAOEclipse.findAllByJPQL(jpql);
        
        return temasList;
        
    }
    @RequestMapping(value = "findMaterias")
    public static List<Materia> findMaterias()
    {
        List<Materia> materiasList = new ArrayList<Materia>();
        
        String jpql = "SELECT m FROM Materia m";
        
        materiasList = daos.DAOEclipse.findAllByJPQL(jpql);
        
        return materiasList;
        
    }
    @RequestMapping(value = "addMateria")
    public static boolean addMateria(@RequestParam(value = "nombre") String nombre)
    {
        boolean agrego = false;
        
        Materia materia = new Materia(nombre);
        
        agrego = daos.DAOEclipse.update(materia);
        
        return agrego;
    }
    @RequestMapping(value = "addTema")
    public static boolean addTema(@RequestParam(value = "nombre") String nombre, @RequestParam(value = "fkMateria") int fkMateria)
    {
        boolean agrego = false;
        
        Materia materiaDB = (Materia) daos.DAOEclipse.get(Materia.class, fkMateria);
        if(materiaDB != null)
        {
            Tema tema = new Tema(nombre, materiaDB);
        
            agrego = daos.DAOEclipse.update(tema);
        }
        
        
        
        return agrego;
    }
    
}
