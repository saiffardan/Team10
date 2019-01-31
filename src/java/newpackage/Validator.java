/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Validates user input. All regex expressions are taken from:
 * https://txt2re.com
 * @author Kaloyan
 */
public class Validator {
    public static boolean validateUsername (String username) {
        boolean valid = false;
        if (username.length() > 13 && username.length() < 100) {
            valid = true;
        } else {
            return false;
        }
        if (username.contains("@")) {
            valid = true;
        } else {
            return false;
        }
        if (username.contains("dundee.ac.uk")) {
            valid = true;
        } else {
            return false;
        }
        if (username.contains("#")) {
            return false;
        }
        if (username.isEmpty()) {
            return false;
        }
        if (username.indexOf("@") > 1) {
            return true;
        }
        return valid;
    }
    public static boolean validatePassword(String password) {
        boolean valid = true;
        if (password.isEmpty()) {
            return false;
        }
        if (password.contains("#")) {
            return false;
        }
        if (password.contains("@")) {
            return false;
        }
        if (password.length() > 30) {
            return false;
        }
        return valid;
    }
    
    public static boolean validateModuleCode(String moduleCode) {
        boolean valid = true;
        if (moduleCode.isEmpty()) {
            return false;
        }
        String re1="([a-z])";	// Any Single Word Character (Not Whitespace) 1
        String re2="([a-z])";	// Any Single Word Character (Not Whitespace) 2
        String re3="(\\d)";	// Any Single Digit 1
        String re4="(\\d)";	// Any Single Digit 2
        String re5="(\\d)";	// Any Single Digit 3
        String re6="(\\d)";	// Any Single Digit 4
        String re7="(\\d)";	// Any Single Digit 5

        Pattern p = Pattern.compile(re1+re2+re3+re4+re5+re6+re7,Pattern.CASE_INSENSITIVE | Pattern.DOTALL);
        Matcher m = p.matcher(moduleCode);
        if (!m.find())
        {
            return false;
//            String w1=m.group(1);
//            String w2=m.group(2);
//            String int1=m.group(3);
//            System.out.print("("+w1.toString()+")"+"("+w2.toString()+")"+"("+int1.toString()+")"+"\n");
        }
        return valid;
    }
    public static boolean validateModuleTitle(String moduleTitle) {
        boolean valid = true;
        if (moduleTitle.isEmpty()) {
            return false;
        }
        Pattern regex = Pattern.compile("[^A-Za-z0-9]");
        Matcher m = regex.matcher(moduleTitle);
        if (!m.find()) {
            return false;
        }
        return valid;
    }
//    public static boolean validateModuleAuthor(String author) {
//        
//    }
//    public static boolean validateModuleYear(String moduleTitle) {
//        
//    }
//    public static boolean validateModuleSemester(String moduleTitle) {
//        
//    } 
}
