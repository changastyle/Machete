/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ws;

import java.util.Date;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Nico-Desktop
 */
public class MasterController
{
    public final static boolean modoRelease = true;                            //CAMBIAR A TRUE, CUANDO DESPLEGE!!!!!!!!
    //public final static String nombreCarpetaProyectoXampp = "machete";
    public final static String nombreCarpetaProyectoXampp = "hack/screenshots";
    public final static String rutaCarpetaGuardarWindows = "C:\\xampp\\htdocs\\upload\\" + nombreCarpetaProyectoXampp;
    public final static String rutaCarpetaGuardarMac = "/Applications/XAMPP/xamppfiles/htdocs/upload/" + nombreCarpetaProyectoXampp;
    public final static String rutaCarpetaGuardarLinux = "/var/www/upload/" + nombreCarpetaProyectoXampp;
    private final static String ipServidorRelease = "http://www.barivende.com:8081";
    private final static String ipServidorTest = "http://localhost";
    public final static String agregado = "/upload/" + nombreCarpetaProyectoXampp + "/";
    
    public static String getIPServidor()
    {
        String ipServidor = "";
        
        if(modoRelease)
        {
            ipServidor = ipServidorRelease;
        }
        else
        {
            ipServidor = ipServidorTest;
        }
        
        return ipServidor;
    }
    public static String getRutaCarpetaGuardaFotos()
    {
        String rutaCarpetaGuardarFotos = "";
      
        //1.COMPRUEBO EL SISTEMA OPERATIVO DEL SERVIDOR:
        String os = System.getProperty("os.name");
        
        System.out.println("os: " + os);
        if(os.startsWith("Windows"))
        {
            //2.SI ES WINDOWS - LE DIGO DONDE GUARDAR LA FOTO:
            rutaCarpetaGuardarFotos = rutaCarpetaGuardarWindows;
        }
        else if(os.contains("Mac"))
        {
            rutaCarpetaGuardarFotos = rutaCarpetaGuardarMac;
        }
        else
        {
            //2.SI ES LINUX - LE DIGO DONDE GUARDAR LA FOTO:
            rutaCarpetaGuardarFotos = rutaCarpetaGuardarLinux;
        }
        
        return rutaCarpetaGuardarFotos;
    }
    public static String cuantoPesaArchivo(MultipartFile f)
    {
        //File f = new File("C:\\Users\\Nico-Laptop\\Pictures\\screenshots\\2017-04-01 12_18_59-Garden Estúdio - Web & Mobile.png");
        
        long sizeBytes = f.getSize();
        
        int contador = 0;
        String medida = "bytes";
        while(sizeBytes % 1024 != 0 && sizeBytes > 1024)
        {
            sizeBytes = sizeBytes / 1024;
            contador ++;
            
            switch(contador)
            {
                case 1: medida = "Kilobytes"; break;
                case 2: medida = "Megas"; break;
                case 3: medida = "Gigas"; break;
                case 4: medida = "Petas"; break;
            }
            //System.out.println( sizeBytes + " " + medida);
        }
        
        //System.out.println( sizeBytes + " " + medida);
        return sizeBytes + " " + medida;
    }
    
    public static String calcularTiempoTranscurrido(Date timestampACalcular)
    {
        long inicioCalculo = System.currentTimeMillis();
        String tiempoTranscurrido = "0 seg";
        
        Date ahoraRightNow = new Date();
        
        long segundo = 1000;
        long minuto = 60 * segundo;
        long hora = 60 * minuto;
        long dia = 24 * hora;
        long semana = 7 * dia;
        long mes = 30 * dia;
        long year = 12 * mes;
        
        int contadorYear = 0;
        int contadorMes = 0;
        int contadorDia = 0;
        int contadorSemana = 0;
        int contadorHora = 0;
        int contadorMinuto = 0;
        int contadorSegundo = 0;
        
        if(timestampACalcular != null)
        {
            long diferencia =  (long) (ahoraRightNow.getTime() - timestampACalcular.getTime());
            if(diferencia > 0)
            {
                if(diferencia > year)
                {
                    contadorYear = Math.round(diferencia / year);
                }
                else
                {
                    //MES
                    if(diferencia > mes)
                    {
                        contadorMes = Math.round(diferencia / mes);
                    }
                    else
                    {
                        //SEMANA:
                        if(diferencia > semana)
                        {
                            contadorSemana = Math.round(diferencia / semana);
                        }
                        else
                        {
                            //DIA:
                            if(diferencia > dia)
                            {
                                contadorDia = Math.round(diferencia / dia);
                            }
                            else
                            {
                                //HORA:
                                if(diferencia > hora)
                                {
                                    contadorHora = Math.round(diferencia / hora);
                                }
                                else
                                {
                                    //MINUTO:
                                    if(diferencia > minuto)
                                    {
                                        contadorMinuto = Math.round(diferencia / minuto);
                                    }
                                    else
                                    {
                                        //SEGUNDO:
                                        if(diferencia > segundo)
                                        {
                                            contadorSegundo = Math.round(diferencia / segundo);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            if(contadorYear  != 0 )
            {
                if(contadorYear > 1)
                {
                    tiempoTranscurrido = contadorYear + " años";
                }
                else
                {
                    tiempoTranscurrido = contadorYear + " año";
                }
            }
            if(contadorMes  != 0 )
            {
                if(contadorMes > 1)
                {
                    tiempoTranscurrido = contadorMes + " meses";
                }
                else
                {
                    tiempoTranscurrido = contadorMes + " mes";
                }
            }
            if(contadorSemana  != 0 )
            {
                if(contadorSemana > 1)
                {
                    tiempoTranscurrido = contadorSemana + " sem";
                }
                else
                {
                    tiempoTranscurrido = contadorSemana + " semana";
                }
            }
            if(contadorDia  != 0 )
            {
                if(contadorDia > 1)
                {
                    tiempoTranscurrido = contadorDia + " d";
                }
                else
                {
                    tiempoTranscurrido = contadorDia + " d";
                }
            }
            if(contadorHora  != 0 )
            {
                if(contadorHora > 1)
                {
                    tiempoTranscurrido = contadorHora + " h";
                }
                else
                {
                    tiempoTranscurrido = contadorHora + " h";
                }
            }
            if(contadorMinuto  != 0 )
            {
                if(contadorMinuto > 1)
                {
                    tiempoTranscurrido = contadorMinuto + " m";
                }
                else
                {
                    tiempoTranscurrido = contadorMinuto + " m";
                }
            }
            if(contadorSegundo  != 0 )
            {
                if(contadorSegundo > 1)
                {
                    tiempoTranscurrido = contadorSegundo + " s";
                }
                else
                {
                    tiempoTranscurrido = contadorSegundo + " s";
                }
            }
            long finCalculo = System.currentTimeMillis();
            System.out.println("tarde "+ ((finCalculo - inicioCalculo)) + " ms en calcular la distancia entre " + timestampACalcular.getTime() + " y " + ahoraRightNow.getTime() + " = " + tiempoTranscurrido);
        }
        
        return tiempoTranscurrido;
    }
    
}
