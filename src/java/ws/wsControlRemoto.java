package ws;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import modelo.Foto;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class wsControlRemoto
{
    //public static final String ipServerParaWEB = "http://192.168.1.176";
    public static final String ipServerParaWEB = "http://barivende.com:8081";
    public static boolean quieroScreenshot = false;
    
    @RequestMapping(value = "reportarme")
    public static boolean reportarme(HttpServletRequest request)
    {
        boolean quieroFoto = quieroScreenshot;
        
        System.out.println("se reporto " + request.getRemoteAddr());
        
        quieroScreenshot = false;
        
        return quieroFoto;
    }
    @RequestMapping(value = "quieroScreenshot")
    public static void quieroScreenshot()
    {
        quieroScreenshot = true;
    }
    @RequestMapping(value = "subirFoto")
    public static boolean subirFoto(@RequestParam(value="foto") MultipartFile foto)
    {
        boolean subio = false;
        System.out.println("foto: " + foto);
        
        String urlFotoSubida = ipServerParaWEB + subirArchi(foto);
        System.out.println("url foto subida :  " + urlFotoSubida);
        
        Foto fotoSubida = new Foto(urlFotoSubida, new Date());
        
        subio = daos.DAOEclipse.update(fotoSubida);
        
        return subio;
    }
    private static String subirArchi(MultipartFile file)
    {
        String urlFotoSubida = "";
        boolean subio = false;
        
        //1.LE PIDO AL SERVIDOR LA CARPETA DONDE GUARDA LAS FOTOS:
        String rutaCarpetaServidorDondeGuardoLasFotos = MasterController.getRutaCarpetaGuardaFotos();
        String timestamp = "" + System.currentTimeMillis();
        String nombreArchivoSubido;
        String extensionArchivoSubido;
        String nombreUnicoLadoServidor;
        
        //2.SI LA FOTO NO ESTA VACIA:
        if(!file.isEmpty())
        {
            nombreArchivoSubido = file.getOriginalFilename();
            int ultimoPunto = nombreArchivoSubido.lastIndexOf(".");
            extensionArchivoSubido = nombreArchivoSubido.substring( ultimoPunto , nombreArchivoSubido.length());
            
            //3.LE PONGO UN NOMBRE (UNICO P/GUARDAR EN EL SERVIDOR):
            nombreUnicoLadoServidor = "upload-" + timestamp + extensionArchivoSubido;
            
            try 
            {
                //4.SUBO LA FOTO:
                File fotoServidor = new File(rutaCarpetaServidorDondeGuardoLasFotos + File.separator + nombreUnicoLadoServidor);
                
                //5.COMPRUEBA QUE NO EXISTA FOTO CON EL MISMO NOMBRE:
                while(fotoServidor.exists())
                {
                    nombreUnicoLadoServidor = nombreUnicoLadoServidor = "upload-" + timestamp + extensionArchivoSubido;
                    fotoServidor = new File(rutaCarpetaServidorDondeGuardoLasFotos + File.separator + nombreUnicoLadoServidor);
                }
                
                System.out.println("subiendo foto : " + nombreUnicoLadoServidor + " "  + MasterController.cuantoPesaArchivo(file));
                
                //6.CREA UN STREAM CON EL ARCHIVO (AGUJERO) DEL LADO DEL SERVIDOR: Y LA COPIA:
                BufferedOutputStream streamUpload = new BufferedOutputStream(new FileOutputStream(fotoServidor));
                FileCopyUtils.copy(file.getInputStream(), streamUpload);
                
                //5.DEVUELVO LA URL, DONDE FUE SUBIDA LA FOTO:
                urlFotoSubida = MasterController.agregado + nombreUnicoLadoServidor;
                
                subio = true;
            }
            catch(Exception e)
            {
                System.out.println("ERROR:subiendo foto: " + nombreUnicoLadoServidor);
                e.printStackTrace();
            }
        }
        return urlFotoSubida;
    }
    
    @RequestMapping(value = "findUltimasFotos")
    public static List<Foto> findUltimasFotos()
    {
        List<Foto> listadoUltimasFotos = new ArrayList<Foto>();
        
        listadoUltimasFotos = daos.DAOEclipse.findAllByJPQL("SELECT f FROM Foto f");
        Collections.sort(listadoUltimasFotos);
        
        return listadoUltimasFotos;
    }
    
}
