package modelo;

import javax.persistence.*;

@Entity @Table(name = "preguntas")
public class Pregunta 
{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String pregunta;
    private String respuesta;
    private boolean esImagen;

    public Pregunta() {
    }

    public Pregunta(String pregunta, String respuesta, boolean esImagen) {
        this.pregunta = pregunta;
        this.respuesta = respuesta;
        this.esImagen = esImagen;
    }

    
    
    //<editor-fold desc="GYS:">
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getPregunta() {
        return pregunta;
    }

    public void setPregunta(String pregunta) {
        this.pregunta = pregunta;
    }

    public String getRespuesta() {
        return respuesta;
    }

    
    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public boolean isEsImagen() {
        return esImagen;
    }

    public void setEsImagen(boolean esImagen) {
        this.esImagen = esImagen;
    }
    

    //</editor-fold>
    
    @Override
    public String toString() {
        return "Pregunta{" + "id=" + id + ", pregunta=" + pregunta + ", respuesta=" + respuesta + '}';
    }
}
