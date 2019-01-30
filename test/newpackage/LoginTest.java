/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.mockito.Mockito.atLeast;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

/**
 *
 * @author Kaloyan
 */
public class LoginTest {
    
    public LoginTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of processRequest method, of class Login.
     */
    @Test
    public void testProcessRequest() throws Exception {      
        HttpServletRequest request = mock(HttpServletRequest.class);
        HttpServletResponse response = mock(HttpServletResponse.class);
        
        when(request.getParameter("username")).thenReturn("testSubject@dundee.ac.uk");
        when(request.getParameter("password")).thenReturn("pass");
        
        StringWriter stringWriter = new StringWriter();
        PrintWriter printWriter = new PrintWriter(stringWriter);
        
        when(response.getWriter()).thenReturn(printWriter);
        
        new Login().doPost(request, response);
        
        //verify that username and password get called
        verify(request, atLeast(1)).getParameter("username");
        verify(request, atLeast(1)).getParameter("password");
        
        System.out.println("Hello");
        System.out.println(request.getContentLength());
        //assertEquals(request.getSession().getAttribute("username"), "testSubject@dundee.ac.uk");
        //assertEquals(request.getSession().getAttribute("password"), "pass");
    }

    /**
     * Test of doGet method, of class Login.
     */
    @Test
    public void testDoGet() throws Exception {
        System.out.println("doGet");
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        Login instance = new Login();
        instance.doGet(request, response);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of doPost method, of class Login.
     */
    @Test
    public void testDoPost() throws Exception {
        System.out.println("doPost");
        HttpServletRequest request = null;
        HttpServletResponse response = null;
        Login instance = new Login();
        instance.doPost(request, response);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }

    /**
     * Test of getServletInfo method, of class Login.
     */
    @Test
    public void testValidateUsername() {
        System.out.println("Validate Username");
        Login instance = new Login();
        assertTrue(instance.validateUsername("cramsay@dundee.ac.uk"));
        assertTrue(instance.validateUsername("josh64@dundee.ac.uk"));
        assertFalse(instance.validateUsername("cramsaydundee.ac.uk"));
        assertFalse(instance.validateUsername("cramsay@dundee.ac"));
        assertFalse(instance.validateUsername("cramsay@dundee.com"));
        assertFalse(instance.validateUsername("sadsadasdsadssaddasdasdasdsadsasdadsaadawqadsfdasfewfasdfawefasdfasdmasmdsmamasmasdmadsmasdasdmadasdmsadsdaasdads@dundee.ac.uk"));
        assertFalse(instance.validateUsername(""));
        assertFalse(instance.validateUsername("jih#sa@school.com"));
        assertFalse(instance.validateUsername("cramsay@edinburgh.co.uk"));
    }
    
}
