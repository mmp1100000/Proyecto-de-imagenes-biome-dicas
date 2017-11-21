/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package server;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;




/**
 *
 * @author pinilla
 */
public class EchoServerUDP {
    public static void main(String[] args) throws IOException 
    {
              
        int port = 54322; //puerto del servidor
        
    
       // try
        //{
	 /*
       * COMPLETAR Crear e inicalizar el socket del servidor
       */
        @SuppressWarnings("resource")
		DatagramSocket serverSocket = new DatagramSocket(port);

            
//        }



        //catch (IOException e) 
        //{
          //  System.out.println("Could not listen on port "+port);                  
           // System.exit(-1);
        //}
        
        byte[] receiveData = new byte[1024];
        byte[] sendData = new byte[1024];
        
        
        while (true) //funcion PRINCIPAL del servidor:
        {
            System.out.println("Waiting for a new UDP client");

            /*COMPLETAR Crear e inicializar un datagrama VACIO para recibir */
           DatagramPacket receivePacket = new DatagramPacket(receiveData,receiveData.length);

		  /*COMPLETAR Recibir datagrama*/
           serverSocket.receive(receivePacket); 
           String line = new String(receivePacket.getData());
           
		 /*COMPLETAR Mostrar por pantalla la direccion socket del cliente que solicito el servicio de eco*/
           InetAddress IPAddress = receivePacket.getAddress();
           int portclient = receivePacket.getPort();
           System.out.println("La ip del cliente es: " + IPAddress);
           System.out.println("El puerto del cliente es: " + portclient);

           /*COMPLETAR revertir cadena y Crear datagrama de respuesta*/
           String reverse = new StringBuilder(line).reverse().toString();
           
           sendData = reverse.getBytes();
           
           DatagramPacket sendPacket = new DatagramPacket(sendData,sendData.length,IPAddress,portclient);

           /*COMPLETAR Enviar datagrama de respuesta*/
           serverSocket.send(sendPacket);




/**/

            System.out.println("STATUS: Echo sent "); 
            System.out.println("STATUS: Waiting for new echo");




            
           
            
        } //fin del bucle del servicio de Echo
        
    } 
    
}
