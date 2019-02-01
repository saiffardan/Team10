/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author Kaloyan
 */
public class MyExamTest {
    private MyExam instance;
    public MyExamTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
        instance = new MyExam(
                "106",
                "Agile Software Engineering",
                "AC31007",
                "Kaloyan Marshalov",
                "Second",
                "2018-2019", 
                "Main",
                "Undergraduate",
                "Online",
                "21 June",
                "Saif",
                "John",
                "Dancho",
                "New"
        );
    }
    
    @After
    public void tearDown() {
        instance = null;
    }

    /**
     * Test of getModuleTitle method, of class MyExam.
     */
    @Test
    public void testGetModuleTitle() {
        System.out.println("getModuleTitle");
        String expResult = "Agile Software Engineering";
        String result = instance.getModuleTitle();
        assertEquals(expResult, result);
    }

    /**
     * Test of setModuleTitle method, of class MyExam.
     */
    @Test
    public void testSetModuleTitle() {
        System.out.println("setModuleTitle");
        String moduleTitle = "Information Security";
        instance.setModuleTitle(moduleTitle);
        assertEquals(moduleTitle, instance.getModuleTitle());
    }

    /**
     * Test of getModuleCode method, of class MyExam.
     */
    @Test
    public void testGetModuleCode() {
        System.out.println("getModuleCode");
        String expResult = "AC31007";
        String result = instance.getModuleCode();
        assertEquals(expResult, result);
    }

    /**
     * Test of setModuleCode method, of class MyExam.
     */
    @Test
    public void testSetModuleCode() {
        System.out.println("setModuleCode");
        String moduleCode = "AC32005";
        instance.setModuleCode(moduleCode);
        assertEquals(moduleCode, instance.getModuleCode());
    }

    /**
     * Test of getAuthor method, of class MyExam.
     */
    @Test
    public void testGetAuthor() {
        System.out.println("getAuthor");
        String expResult = "Kaloyan Marshalov";
        String result = instance.getAuthor();
        assertEquals(expResult, result);
    }

    /**
     * Test of setAuthor method, of class MyExam.
     */
    @Test
    public void testSetAuthor() {
        System.out.println("setAuthor");
        String author = "Debela Gemechu";
        instance.setAuthor(author);
        assertEquals(author, instance.getAuthor());
    }

    /**
     * Test of getSemester method, of class MyExam.
     */
    @Test
    public void testGetSemester() {
        System.out.println("getSemester");
        String expResult = "Second";
        String result = instance.getSemester();
        assertEquals(expResult, result);
    }

    @Test (expected = IllegalArgumentException.class)
    public void testSetSemester_throwException() {
        System.out.println("Test Set Semester with illegal argument");
        String semester = "Third";
        instance.setSemester(semester);
    }
    
    /**
     * Test of setSemester method, of class MyExam.
     */
    @Test
    public void testSetSemester() {
        System.out.println("setSemester");
        String semester = "First";
        instance.setSemester(semester);
        assertEquals(semester, instance.getSemester());
    }
    
    /**
     * Test of getYear method, of class MyExam.
     */
    @Test
    public void testGetYear() {
        System.out.println("getYear");
        String expResult = "2018-2019";
        String result = instance.getYear();
        assertEquals(expResult, result);
    }

    /**
     * Test of setYear method, of class MyExam.
     */
    @Test
    public void testSetYear() {
        System.out.println("setYear");
        String year = "2017-2018";
        instance.setYear(year);
        assertEquals(year, instance.getYear());
    }

    /**
     * Test of getExamType method, of class MyExam.
     */
    @Test
    public void testGetExamType() {
        System.out.println("getExamType");
        String expResult = "Main";
        String result = instance.getExamType();
        assertEquals(expResult, result);
    }

    /**
     * Test of setExamType method, of class MyExam.
     */
    @Test
    public void testSetExamType() {
        System.out.println("setExamType");
        String examType = "Resit";
        instance.setExamType(examType);
        assertEquals(examType, instance.getExamType());
    }

    /**
     * Test of getLevel method, of class MyExam.
     */
    @Test
    public void testGetLevel() {
        System.out.println("getLevel");
        String expResult = "Undergraduate";
        String result = instance.getLevel();
        assertEquals(expResult, result);
    }

    /**
     * Test of setLevel method, of class MyExam.
     */
    @Test
    public void testSetLevel() {
        System.out.println("setLevel");
        String level = "Postgraduate";
        instance.setLevel(level);
        assertEquals(level, instance.getLevel());
    }

    /**
     * Test of getPaperType method, of class MyExam.
     */
    @Test
    public void testGetPaperType() {
        System.out.println("getPaperType");
        String expResult = "Online";
        String result = instance.getPaperType();
        assertEquals(expResult, result);
    }

    /**
     * Test of setPaperType method, of class MyExam.
     */
    @Test
    public void testSetPaperType() {
        System.out.println("setPaperType");
        String paperType = "Written";
        instance.setPaperType(paperType);
        assertEquals(paperType, instance.getPaperType());
    }

    /**
     * Test of getDate method, of class MyExam.
     */
    @Test
    public void testGetDate() {
        System.out.println("getDate");
        String expResult = "21 June";
        String result = instance.getDate();
        assertEquals(expResult, result);
    }

    /**
     * Test of setDate method, of class MyExam.
     */
    @Test
    public void testSetDate() {
        System.out.println("setDate");
        String date = "28 June";
        instance.setDate(date);
        assertEquals(date, instance.getDate());
    }
    
}
