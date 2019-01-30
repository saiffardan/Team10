/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package newpackage;

/**
 *
 * @author danchoatanasov
 */
public class MyExam {
    public String moduleTitle, moduleCode, author, semester, year, examType, level, paperType, date;
    
    MyExam(){
        moduleTitle = null;
        moduleCode= null;
        author= null;
        semester= null; 
        year= null;
        examType= null;
        level= null;
        paperType= null;
        date = null;
    }

    public MyExam(String moduleTitle, String moduleCode, String author, String semester, String year, String examType, String level, String paperType, String date) {
        this.moduleTitle = moduleTitle;
        this.moduleCode = moduleCode;
        this.author = author;
        this.semester = semester;
        this.year = year;
        this.examType = examType;
        this.level = level;
        this.paperType = paperType;
        this.date = date;
    }

    public String getModuleTitle() {
        return moduleTitle;
    }

    public void setModuleTitle(String moduleTitle) {
        this.moduleTitle = moduleTitle;
    }

    public String getModuleCode() {
        return moduleCode;
    }

    public void setModuleCode(String moduleCode) {
        this.moduleCode = moduleCode;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getSemester() {
        return semester;
    }

    public void setSemester(String semester) {
        this.semester = semester;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getExamType() {
        return examType;
    }

    public void setExamType(String examType) {
        this.examType = examType;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getPaperType() {
        return paperType;
    }

    public void setPaperType(String paperType) {
        this.paperType = paperType;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
