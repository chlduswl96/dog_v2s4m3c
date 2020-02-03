package dev.mvc.mem;

public class MemVO {
  private int memno;
  private int memgradeno;
  private int new_memgradeno;
  private String gender;
  private String email;
  private String email2;
  private String id;
  private String mname;
  private String tel;
  private String tel2;
  private String tel3;
  private String zipcode;
  private String address1;
  private String address2;
  private String rdate;
  private String passwd;
  private String gradename;
  
  public String getEmail2() {
    return email2;
  }
  public void setEmail2(String email2) {
    this.email2 = email2;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public int getNew_memgradeno() {
    return new_memgradeno;
  }
  public void setNew_memgradeno(int new_memgradeno) {
    this.new_memgradeno = new_memgradeno;
  }
  public String getTel() {
    return tel;
  }
  public void setTel(String tel) {
    this.tel = tel;
  }
  public String getTel2() {
    return tel2;
  }
  public void setTel2(String tel2) {
    this.tel2 = tel2;
  }
  public String getTel3() {
    return tel3;
  }
  public void setTel3(String tel3) {
    this.tel3 = tel3;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getPasswd() {
    return passwd;
  }
  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }
  public String getGender() {
    return gender;
  }
  public void setGender(String gender) {
    this.gender = gender;
  }
  public String getGradename() {
    return gradename;
  }
  public void setGradename(String gradename) {
    this.gradename = gradename;
  }
  public int getMemno() {
    return memno;
  }
  public void setMemno(int memno) {
    this.memno = memno;
  }
  public int getMemgradeno() {
    return memgradeno;
  }
  public void setMemgradeno(int memgradeno) {
    this.memgradeno = memgradeno;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getMname() {
    return mname;
  }
  public void setMname(String mname) {
    this.mname = mname;
  }
  public String getZipcode() {
    return zipcode;
  }
  public void setZipcode(String zipcode) {
    this.zipcode = zipcode;
  }
  public String getAddress1() {
    return address1;
  }
  public void setAddress1(String address1) {
    this.address1 = address1;
  }
  public String getAddress2() {
    return address2;
  }
  public void setAddress2(String address2) {
    this.address2 = address2;
  }
  @Override
  public String toString() {
    return "MemVO [memno=" + memno + ", memgradeno=" + memgradeno + ", new_memgradeno=" + new_memgradeno + ", gender="
        + gender + ", email=" + email + ", email2=" + email2 + ", id=" + id + ", mname=" + mname + ", tel=" + tel
        + ", tel2=" + tel2 + ", tel3=" + tel3 + ", zipcode=" + zipcode + ", address1=" + address1 + ", address2="
        + address2 + ", rdate=" + rdate + ", passwd=" + passwd + ", gradename=" + gradename + "]";
  }
  
  
  
}
