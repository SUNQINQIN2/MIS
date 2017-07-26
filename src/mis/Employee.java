package mis;

import java.util.Date;

public class Employee {
    
	private String Ename;	
	private int payRoll;
	private String teNumber;
	private int departmentNum;
	private String jobTittle;
	private Date empDate;
	private String error;
	
    public String getEname() {
        return Ename;
    }
    public void setEname(String ename) {
        Ename = ename;
    }
    public int getPayRoll() {
        return payRoll;
    }
    public void setPayRoll(int payRoll) {
        this.payRoll = payRoll;
    }
    public String getTeNumber() {
        return teNumber;
    }
    public void setTeNumber(String teNumber) {
        this.teNumber = teNumber;
    }
    public int getDepartmentNum() {
        return departmentNum;
    }
    public void setDepartmentNum(int departmentNum) {
        this.departmentNum = departmentNum;
    }
    public String getJobTittle() {
        return jobTittle;
    }
    public void setJobTittle(String jobTittle) {
        this.jobTittle = jobTittle;
    }
    public Date getEmpDate() {
        return empDate;
    }
    public void setEmpDate(Date empDate) {
        this.empDate = empDate;
    }
    public String getError() {
        return error;
    }
    public void setError(String error) {
        this.error = error;
    }
	
	
}
