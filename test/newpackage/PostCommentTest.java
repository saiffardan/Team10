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
import org.mockito.Mock;
import static org.mockito.Mockito.atLeast;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import org.mockito.MockitoAnnotations;

/**
 *
 * @author Kaloyan
 */
public class PostCommentTest {
    
    public PostCommentTest() {
    }
    
    @Mock
    HttpServletRequest request;
    @Mock
    HttpServletResponse response;
    
    @Before
    public void setUp() {
        MockitoAnnotations.initMocks(this);
    }
    
    /**
     * Test of processRequest method, of class PostComment.
     */
    @Test
    public void testProcessRequest() throws Exception {
        System.out.println("Test Process Request for Posting a comment");
        when(request.getParameter("username")).thenReturn("Saif");
        when(request.getParameter("folderpath")).thenReturn("exams/AC31007_2018-2019");
        when(request.getParameter("comment")).thenReturn("This is a comment");
        
        StringWriter sw = new StringWriter();
        PrintWriter pw = new PrintWriter(sw);
         
        when(response.getWriter()).thenReturn(pw);
        
        
        PostComment pc = mock(PostComment.class);
        pc.processRequest(request, response);
        
//        verify(request, atLeast(1)).getParameter("comment");     
 //       verify(request, atLeast(1)).getParameter("folderpath");
        System.out.println(request);
    }    
}
