/**
 *
 * @author user
 */
public class Senior {
    private int ID;
    private String name;
    private String gender;
    private String dateofbirth;

    public Senior() {
    }

    public Senior(int ID, String name, String gender, String dateofbirth) {
        this.ID = ID;
        this.name = name;
        this.gender = gender;
        this.dateofbirth = dateofbirth;
    }

    public int getID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public String getGender() {
        return gender;
    }

    public String getDateofbirth() {
        return dateofbirth;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setDateofbirth(String dateofbirth) {
        this.dateofbirth = dateofbirth;
    }
}
