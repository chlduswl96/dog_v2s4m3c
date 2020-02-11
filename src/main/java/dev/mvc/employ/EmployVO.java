package dev.mvc.employ;

public class EmployVO {
  
  private String name;
  private String id;
  private String pw;
  private String email;
  private String erank;
  
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public String getId() {
    return id;
  }
  public void setId(String id) {
    this.id = id;
  }
  public String getPw() {
    return pw;
  }
  public void setPw(String pw) {
    this.pw = pw;
  }
  public String getEmail() {
    return email;
  }
  public void setEmail(String email) {
    this.email = email;
  }
  public String getErank() {
    return erank;
  }
  public void setErank(String erank) {
    this.erank = erank;
  }
  
  @Override
  public String toString() {
    return "EmployVO [name=" + name + ", id=" + id + ", pw=" + pw + ", email=" + email + ", erank=" + erank + "]";
  }
  
  
}
