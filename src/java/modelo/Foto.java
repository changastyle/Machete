package modelo;

import java.util.Date;
import javax.persistence.*;
import ws.MasterController;

@Entity @Table(name = "fotos")
public class Foto implements Comparable<Foto>
{
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String url;
    private Date timestamp;

    public Foto()
    {
    }

    public Foto(String url, Date timestamp)
    {
        this.url = url;
        this.timestamp = timestamp;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getUrl()
    {
        return url;
    }

    public void setUrl(String url)
    {
        this.url = url;
    }

    public Date getTimestamp()
    {
        return timestamp;
    }

    public void setTimestamp(Date timestamp)
    {
        this.timestamp = timestamp;
    }
    public String getTiempoTrans()
    {
        return MasterController.calcularTiempoTranscurrido(timestamp);
    }
    @Override
    public int compareTo(Foto o)
    {
        if(o.getTimestamp().getTime() > this.getTimestamp().getTime())
        {
            return 1;
        }
        else
        {
            return -1;
        }
    }
    
    
    
}
