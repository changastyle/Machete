package modelo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;

@Entity @Table(name = "materias")
public class Materia
{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nombre;
    @OneToMany(cascade = CascadeType.MERGE , fetch = FetchType.EAGER , mappedBy = "materia")
    private List<Tema> temasList;

    public Materia()
    {
        temasList = new ArrayList<Tema>();
    }

    public Materia(String nombre)
    {
        this.nombre = nombre;
        temasList = new ArrayList<Tema>();
    }
    
    //<editor-fold desc="GYS:">

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getNombre()
    {
        return nombre;
    }

    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public List<Tema> getTemasList()
    {
        return temasList;
    }

    public void setTemasList(List<Tema> temasList)
    {
        this.temasList = temasList;
    }
    
    
    //</editor-fold>

    @Override
    public String toString()
    {
        return "Materia{" + "id=" + id + ", nombre=" + nombre + '}';
    }
}
