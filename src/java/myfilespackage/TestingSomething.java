/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package myfilespackage;

import java.io.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author danchoatanasov
 */
public class TestingSomething {
    public TestingSomething()
    {
        
    }
    public static String molqte(){
        return "<br>molq te bate</br>";
    }
    public static String readFromFile(String fileName){
        System.out.println("Bateeeee");
        String message = "";
        BufferedReader br;
        try {
            br = new BufferedReader((new FileReader("fileName")));
            String data;
            while((data= br.readLine())!= null)
            {
                System.out.println(data+"<br>");
                message += data;
            }
        } catch (Exception ex) {
            Logger.getLogger(TestingSomething.class.getName()).log(Level.SEVERE, null, ex);
        }
        return message;
           
    }
}
