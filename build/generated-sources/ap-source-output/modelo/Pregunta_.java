package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Tema;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-06-26T13:49:14")
@StaticMetamodel(Pregunta.class)
public class Pregunta_ { 

    public static volatile SingularAttribute<Pregunta, Boolean> esImagen;
    public static volatile SingularAttribute<Pregunta, Tema> tema;
    public static volatile SingularAttribute<Pregunta, Integer> id;
    public static volatile SingularAttribute<Pregunta, String> respuesta;
    public static volatile SingularAttribute<Pregunta, String> pregunta;

}