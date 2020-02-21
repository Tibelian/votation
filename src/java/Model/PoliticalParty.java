
package Model;

public class PoliticalParty {
    
    private int id;
    private String name;
    private String achronym;
    private String image;
    private int votes;
    
    public PoliticalParty(){}
    public PoliticalParty(int id, String name, String achronym, String image){
        this.setId(id);
        this.setName(name);
        this.setAchronym(achronym);
        this.setImage(image);
    }
    public PoliticalParty(String name, String achronym, String image){
        this.setName(name);
        this.setAchronym(achronym);
        this.setImage(image);
    }
    public PoliticalParty(int id, String name, String achronym, String image, int votes){
        this.setId(id);
        this.setName(name);
        this.setAchronym(achronym);
        this.setImage(image);
        this.setVotes(votes);
    }
    public PoliticalParty(PoliticalParty party){
        this.setName(party.getName());
        this.setAchronym(party.getAchronym());
        this.setImage(party.getImage());
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAchronym() {
        return achronym;
    }

    public void setAchronym(String achronym) {
        this.achronym = achronym;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getVotes() {
        return votes;
    }

    public void setVotes(int votes) {
        this.votes = votes;
    }
    
    
    
    
    
}
