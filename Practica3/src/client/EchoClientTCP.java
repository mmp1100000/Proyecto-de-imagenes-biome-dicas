/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

/**
 *
 * @author <Eduardo Reyes>
 */
import java.io.*;
import java.net.*;

public class EchoClientTCP {

    public static void main(String[] args) throws IOException {
//descomentar si el servidor se toma por linea de comandos
        //String serverName = args[0];
        String serverName = "127.0.0.1";
//descomentar si el puerto del servidor se toma por linea de comandos
        //int portNumber = Integer.parseInt(args[1]);
        int portNumber = 1224;
        Socket echoSocket = null;
        
	PrintWriter out = null;
        BufferedReader in = null;

        try {
            /* COMPLETAR Crear socket y conectar con servidor */
        	echoSocket = new Socket(serverName, portNumber);
            /*COMPLETAR Inicializar los flujos de entrada/salida del socket conectado en las variables PrintWriter y BufferedReader*/
        	in = new BufferedReader(new InputStreamReader(echoSocket.getInputStream()));
        	out = new PrintWriter(echoSocket.getOutputStream());

	/**/


        } catch (UnknownHostException e) {
            System.err.println("Unknown: " + serverName);
            System.exit(1);
        } catch (IOException e) {
            System.err.println("Couldn't get I/O for " + "the connection to: " + serverName);
            System.exit(1);
        }

        System.out.println("STATUS: Conectado al servidor ");


   /*Obtener texto por teclado*/
        BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in));
        String userInput;

        System.out.println("Introduzca un texto a enviar ('FIN TCP' para acabar)");
        
        userInput = stdIn.readLine();
   /*Enviar texto leido y almacenado en userInput al servidor a trav�s del socket*/
       
        
/* bucle del servicio*/

/* COMPLETAR Comprobar si el usuario ha iniciado el fin de la interacci�n*/
	while (userInput.compareTo("FIN TCP") != 0) {
		 out.println(userInput);
		 out.flush();
/* COMPLETAR Enviar texto en userInput al servidor a trav�s del flujo de salida del socket conectado*/
            




/* */

            System.out.println("STATUS: Enviando " + userInput); //muestra por pantalla el texto enviado
            System.out.println("STATUS: Esperando eco"); //muestra por pantalla estado

/*COMPLETAR Recibir texto en echo enviado por el servidor a trav�s del flujo de entrada del socket conectado */
	 String echo = in.readLine(); 
/* */

	System.out.println("echo: " + echo); //muestra por pantalla el eco recibido 
            
            /* Leer texto de usuario por teclado */
            System.out.println("Introduzca un texto a enviar (FIN para acabar)"); 
            userInput = stdIn.readLine();
        } /*Fin del bucle de servicio en cliente*/

        //salimos porque el cliente quiere terminar la interaccion, ha introducido FIN-TCP
        System.out.println("STATUS: El cliente quiere terminar el servicio");
       
/*COMPLETAR Enviar FIN-TCP al servidor para indicar el fin deL SERVICIO */
        String bye = "FIN TCP";
        out.println(bye);
        out.flush();
/* */

            System.out.println("STATUS: Sending " + userInput); //muestra por pantalla el texto enviado
            System.out.println("STATUS: Waiting for the reply"); //muestra por pantalla estado

        /*COMPLETAR Recibir OK enviado por el servidor confirmando EL FIN DEL SERVICIO */
            String ok = in.readLine();
            
            if (!ok.equals("OK"))
            	throw new RuntimeException("No se ha podido cerrar la conexión");
            
            

/**/

System.out.println("STATUS: Cerrando conexion " + ok); //muestra por pantalla el eco recibido 

/*COMPLETAR Cerrar flujos y socket*/
		in.close();
		out.close();
		echoSocket.close();


/**/	
        System.out.println("STATUS: Conexion cerrada");
    }
}
