package modelo;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import modelo.Tema;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2017-09-27T22:16:49")
@StaticMetamodel(Materia.class)
public class Materia_ { 

    public static volatile ListAttribute<Materia, Tema> temasList;
    public static volatile SingularAttribute<Materia, Integer> id;
    public static volatile SingularAttribute<Materia, String> nombre;

}