
package Model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class Parameter {

    String circumscription;
    String typeQuery;
    String scrutiny;
    int numCandidates;
    LocalDate dateQuery;
    
    public Parameter(){}

    public Parameter(String circumscription, String typeQuery, String scrutiny, int numCandidates, LocalDate dateQuery) {
        setCircumscription(circumscription);
        setTypeQuery(typeQuery);
        setScrutiny(scrutiny);
        setNumCandidates(numCandidates);
        setDateQuery(dateQuery);
    }

    public String getCircumscription() {
        return circumscription;
    }

    public void setCircumscription(String circumscription) {
        this.circumscription = circumscription;
    }

    public String getTypeQuery() {
        return typeQuery;
    }

    public void setTypeQuery(String typeQuery) {
        this.typeQuery = typeQuery;
    }

    public String getScrutiny() {
        return scrutiny;
    }

    public void setScrutiny(String scrutiny) {
        if(scrutiny.equals("Opened") || scrutiny.equals("Closed") || scrutiny.equals("Finished")){
            this.scrutiny = scrutiny;
        }
    }

    public int getNumCandidates() {
        return numCandidates;
    }

    public void setNumCandidates(int numCandidates) {
        this.numCandidates = numCandidates;
    }

    public LocalDate getDateQuery() {
        return dateQuery;
    }
    
    public String getDateQueryString() {
        DateTimeFormatter formated = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return dateQuery.format(formated);
    }

    public void setDateQuery(LocalDate dateQuery) {
        this.dateQuery = dateQuery;
    }
    
    

    
}
