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
public class ValidatorTest {
    
    public ValidatorTest() {
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
     * Test of getServletInfo method, of class Login.
     */
    @Test
    public void testValidateUsername() {
        System.out.println("Validate Username");
        assertTrue(Validator.validateUsername("cramsay@dundee.ac.uk"));
        assertTrue(Validator.validateUsername("josh64@dundee.ac.uk"));
        assertFalse(Validator.validateUsername("cramsaydundee.ac.uk"));
        assertFalse(Validator.validateUsername("cramsay@dundee.ac"));
        assertFalse(Validator.validateUsername("cramsay@dundee.com"));
        assertFalse(Validator.validateUsername("sadsadasdsadssaddasdasdasdsadsasdadsaadawqadsfdasfewfasdfawefasdfasdmasmdsmamasmasdmadsmasdasdmadasdmsadsdaasdads@dundee.ac.uk"));
        assertFalse(Validator.validateUsername(""));
        assertFalse(Validator.validateUsername("jih#sa@school.com"));
        assertFalse(Validator.validateUsername("cramsay@edinburgh.co.uk"));
    }
    @Test
    public void testValidatePassword() {
        System.out.println("Validate Password");
        assertTrue(Validator.validatePassword("password"));
        assertTrue(Validator.validatePassword("johnydoe15"));
        assertTrue(Validator.validatePassword("hristoStoichkovOleOle"));
        assertTrue(Validator.validatePassword("12345strongPass"));
        assertFalse(Validator.validatePassword("#sad"));
        assertFalse(Validator.validatePassword("123asdasdlkasdlkadsasdklasdklads12993021iasdklasdnasdklad"));
    }
    @Test
    public void testValidateModuleCode() {
        System.out.println("Validate module code");
        assertTrue(Validator.validateModuleCode("AC31007"));
        assertTrue(Validator.validateModuleCode("Ac31007"));
        assertTrue(Validator.validateModuleCode("FZ41207"));
        
        assertFalse(Validator.validateModuleCode("AC333"));
        assertFalse(Validator.validateModuleCode("Z333"));
        assertFalse(Validator.validateModuleCode("BC3332"));
        assertFalse(Validator.validateModuleCode("ACB333"));
        assertFalse(Validator.validateModuleCode("AC3333"));  
    }
    @Test
    public void testValidateModuleTitle() {
        System.out.println("Validate module title");
        assertTrue(Validator.validateModuleTitle("Agile Software Engineering"));
        assertTrue(Validator.validateModuleTitle("Engineering 101"));
    }
    @Test
    public void testValidateModuleAuthor() {
        System.out.println("Validate module author");
    }
    @Test
    public void testValidateModuleYear() {
        System.out.println("validate module year");
    }
}
