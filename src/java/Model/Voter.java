
package Model;

import java.time.LocalDate;

public class Voter {
   
    private int id;
    private String nif;
    private String firstName;
    private String lastName;
    private String residence;
    private LocalDate bornDate;
    private String password;
    private boolean voted = false;
    private String role = "Voter";
    
    public Voter(String nif, String firstName, String lastName, String residence, LocalDate bornDate, String password, boolean voted, String role){
        this.setNif(nif);
        this.setFirstName(firstName);
        this.setLastName(lastName);
        this.setResidence(residence);
        this.setBornDate(bornDate);
        this.setPassword(password);
        this.setVoted(voted);
        this.setRole(role);
    }
    
    public Voter(String nif, String firstName, String lastName, String residence, LocalDate bornDate, String password){
        this.setNif(nif);
        this.setFirstName(firstName);
        this.setLastName(lastName);
        this.setResidence(residence);
        this.setBornDate(bornDate);
        this.setPassword(password);
    }

    public Voter() {}

    public int getId(){
        return this.id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getNif() {
        return nif;
    }
    public void setNif(String nif) {
        this.nif = nif;
    }
    public String getFirstName() {
        return firstName;
    }
    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }
    public String getLastName() {
        return lastName;
    }
    public void setLastName(String lastName) {
        this.lastName = lastName;
    }
    public String getResidence() {
        return residence;
    }
    public void setResidence(String residence) {
        this.residence = residence;
    }
    public LocalDate getBornDate() {
        return bornDate;
    }
    public void setBornDate(LocalDate bornDate) {
        this.bornDate = bornDate;
    }
    public void setBornDate(String bornDate){
        this.bornDate = LocalDate.parse(bornDate);
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public boolean isVoted() {
        return voted;
    }
    public void setVoted(boolean voted) {
        this.voted = voted;
    }
    public void setVoted(String voted) {
        if("Y".equals(voted)){
            this.voted = true;
        }else{
            this.voted = false;
        }
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        if("Administrator".equals(role)){
            this.role = "Administrator";
        }else{
            this.role = "Voter";
        }
    }
    
    
    
}
