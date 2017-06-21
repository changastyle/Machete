package modelo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import javax.persistence.*;

@Entity @Table(name = "temas")
public class Tema
{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nombre;
    @ManyToOne() @JoinColumn(name = "fkMateria")  @JsonIgnore
    private Materia materia;

    public Tema()
    {
    }

    public Tema(String nombre, Materia materia)
    {
        this.nombre = nombre;
        this.materia = materia;
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

    public Materia getMateria()
    {
        return materia;
    }

    public void setMateria(Materia materia)
    {
        this.materia = materia;
    }
    
    //</editor-fold>

    @Override
    public String toString()
    {
        return "Tema{" + "id=" + id + ", nombre=" + nombre + ", materia=" + materia + '}';
    }

    

    
}
