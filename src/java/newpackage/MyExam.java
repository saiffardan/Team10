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
public class MyExam extends Object{
    public String  examID, moduleTitle, moduleCode, author, semester, year, examType, level, paperType, date, intMod, exVet, exMod, status;

     public MyExam() {
        this.examID = null;
        this.moduleTitle = null;
        this.moduleCode = null;
        this.author = null;
        this.semester = null;
        this.year = null;
        this.examType = null;
        this.level = null;
        this.paperType = null;
        this.date = null;
        this.intMod = null;
        this.exVet = null;
        this.exMod = null;
        this.status = null;
    }
    
    public MyExam(String examID, String moduleTitle, String moduleCode, String author, String semester, String year, String examType, String level, String paperType, String date, String intMod, String exVet, String exMod, String status) {
        this.examID = examID;
        this.moduleTitle = moduleTitle;
        this.moduleCode = moduleCode;
        this.author = author;
        this.semester = semester;
        this.year = year;
        this.examType = examType;
        this.level = level;
        this.paperType = paperType;
        this.date = date;
        this.intMod = intMod;
        this.exVet = exVet;
        this.exMod = exMod;
        this.status = status;
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

    public String getExamID() {
        return examID;
    }

    public void setExamID(String examID) {
        this.examID = examID;
    }

    public String getIntMod() {
        return intMod;
    }

    public void setIntMod(String intMod) {
        this.intMod = intMod;
    }

    public String getExVet() {
        return exVet;
    }

    public void setExVet(String exVet) {
        this.exVet = exVet;
    }

    public String getExMod() {
        return exMod;
    }

    public void setExMod(String exMod) {
        this.exMod = exMod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
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

    @Override
    public String toString() {
        return "MyExam{" + "examID=" + examID + ", moduleTitle=" + moduleTitle + ", moduleCode=" + moduleCode + ", author=" + author + ", semester=" + semester + ", year=" + year + ", examType=" + examType + ", level=" + level + ", paperType=" + paperType + ", date=" + date + ", intMod=" + intMod + ", exVet=" + exVet + ", exMod=" + exMod + ", status=" + status + '}';
    }

    public void setDate(String date) {
        this.date = date;
    }
}
