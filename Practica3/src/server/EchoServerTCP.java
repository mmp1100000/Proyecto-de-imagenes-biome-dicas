package server;



import java.io.*;
import java.net.*;


class EchoServerTCP {
    
    @SuppressWarnings("resource")
	public static void main(String[] args) throws IOException 
    {
        ServerSocket server = null;
        Socket client = null;
        BufferedReader in = null;
        PrintWriter out = null;
        //Scanner in = null;
        String line;
        int port = 1224; //puerto del servidor
        int count = 50;
        
      /*
       * COMPLETAR Crear e inicalizar el socket del servidor
       */
        try
        {
        server  = new ServerSocket(port, count);
        }
        catch (IOException e) 
        {
            System.out.println("Could not listen on port "+port);                  
            System.exit(-1);
        }
        /**/
        while (true) //funcion del servidor:
        {
            try
            {
            	System.out.println("esperando conexion");
             client  = server.accept();  /*COMPLETAR Esperar conexiones entrantes */
             System.out.println(" conexion encontrada");
/* */	
            }
            catch(IOException e) 
            {
                System.out.println("Accept failed: "+ port); 
                System.exit(-1); 
            }
            
            try
            {
            	in = new BufferedReader(new InputStreamReader(client.getInputStream()));
            	out = new PrintWriter(client.getOutputStream());
            } 
            catch (IOException e) 
            {
                System.out.println("Exception "+ e.getMessage()); 
                System.exit(-1);
            }       

            boolean salir = false;
            /*inicio bucle del servicio de Eco de 1 cliente*/
            
	    while(!salir)
	    	{
                try 
                {
                	
                	while(!in.ready()) {
                		
                	}
                	
                	System.out.println(in.ready());
                	                	
                	line = in.readLine();

                	
                	System.out.println("He leído " + line.length() +" letras."); //AÑADIDO POR EDU PARA PRUEBAS


/**/
                	System.out.println("Received from client " + line);
        
              /*COMPLETAR Comprueba si es fin de conexion */
                    if (line.compareTo("FIN TCP") != 0)
             
                    {
                    	
                        /* COMPLETAR Revertir la cadena y Enviar texto al cliente a través del flujo de salida del socket conectado*/
                    	String reverse = new StringBuilder(line).reverse().toString();
                    	
                    	
                    	line = reverse;
/**/ 
                        System.out.println("Sending to client " + line);
                        out.println(line);
                        out.flush();
                    } 

                    else //El cliente quiere cerrar conexi�n, ha enviado FIN-TCP    
                    {
                        /*COMPLETAR Envia OK al cliente*/
                    	System.out.println("entro else");
                    	out.println("OK");
                    	out.flush();
                        /**/
                    	salir = true;
                    }
                    System.out.println("final bucle salir");
                } 
                catch (Exception e) 
                {
                    System.out.println("Read failed"+ e.getMessage()); 
                    System.exit(-1); 
                }
            } //fin del servicio
     
            System.out.println("Closing connection with the client");
/*COMPLETAR Cerrar flujos y socket*/



/**/
            System.out.println("Waiting for a new client");
        } //fin del bucle
        //server.close(); 
    } 
}//fin del metodo y la clase

