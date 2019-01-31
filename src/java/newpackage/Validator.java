/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

/**
 *
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
}
