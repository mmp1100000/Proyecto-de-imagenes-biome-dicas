/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package client;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.net.InetAddress;

/**
 *
 * @author pinilla
 */
public class EchoClientUDP {
    public static void main(String[] args) throws IOException 
    {
        //String serverName = args[0];
        String serverName = "127.0.0.1"; //direccion local 
        //int portNumber = Integer.parseInt(args[1]);
        int serverPort = 54322;
        DatagramSocket echoSocket = null;
        InetAddress serverAddress = InetAddress.getByName(serverName);

        
       
        /*COMPLETAR crear socket*/
		echoSocket = new DatagramSocket(); 

        /* INICIALIZA ENTRADA POR TECLADO*/
        BufferedReader stdIn = new BufferedReader( new InputStreamReader(System.in));
        String userInput;
        System.out.println("Introduzca un texto a enviar (FIN-UDP para acabar)");
        userInput = stdIn.readLine(); /*CADENA ALMACENADA EN userInput*/



	 
/* COMPLETAR Comprobar si el usuario quiere terminar servicio*/
        while (userInput.compareTo("FIN-UDP") != 0) 
        {
            /*COMPLETAR Crear datagrama con la cadena escrito en el cuerpo */
        	byte[] sendData = new byte[1024];
        	byte[] receivedData = new byte[1024]; 
        	sendData = userInput.getBytes();
        	DatagramPacket sendPacket = new DatagramPacket(sendData,sendData.length,serverAddress,serverPort);
            try {
                /*COMPLETAR Enviar datagrama a trav�s del socket */
            	echoSocket.send(sendPacket);


            } catch (IOException iOException) {
            }
            
            System.out.println("STATUS: Waiting for the reply");
            
           /*COMPLETAR Crear e inicializar un datagrama VACIO para recibir la respuesta*/
            DatagramPacket receivePacket = new DatagramPacket(receivedData,receivedData.length);
            
            

           /*COMPLETAR Recibir datagrama de respuesta*/
            echoSocket.receive(receivePacket);

	    /*COMPLETAR Extraer contenido del cuerpo del datagrama en variable line*/
           String line = new String(receivePacket.getData()); 


            System.out.println("echo: " + line);
            System.out.println("Introduzca un texto a enviar (FIN para acabar)");
            userInput = stdIn.readLine();
        }
   
        System.out.println("STATUS: Closing lient");     
        
        
        /*COMPLETAR Cerrar socket cliente*/
        echoSocket.close();
        
       
        
        System.out.println("STATUS: closed");
    }
}

    

