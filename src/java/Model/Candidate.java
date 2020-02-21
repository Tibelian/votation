
package Model;

public class Candidate {
    
    private int id;
    private String name;
    private PoliticalParty politicalParty;
    private int partyId;
    private int order;
    
    public Candidate() {}
    
    public Candidate(int id, String name, PoliticalParty politicalParty, int order) {
        setId(id);
        setName(name);
        setPoliticalParty(politicalParty);
        setOrder(order);
    }
    
    public Candidate(String name, PoliticalParty politicalParty, int order) {
        setName(name);
        setPoliticalParty(politicalParty);
        setOrder(order);
    }

    public Candidate(String name, int partyId, int order) {
        setName(name);
        setPartyId(partyId);
        setOrder(order);
    }

    public int getId(){
        return id;
    }
    
    public void setId(int id){
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getPartyId() {
        return partyId;
    }

    public void setPartyId(int partyId) {
        this.partyId = partyId;
    }

    public PoliticalParty getPoliticalParty() {
        return politicalParty;
    }

    public void setPoliticalParty(PoliticalParty politicalParty) {
        this.politicalParty = politicalParty;
    }

    public int getOrder() {
        return order;
    }

    public void setOrder(int order) {
        this.order = order;
    }
   
    
    
}
