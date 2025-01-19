/**
 *
 * @author user
 */
public class Guardian {
    private int ID;
    private String name;
    private int phone;
    private String gender;
    private String address;
    private String dateofbirth;

    public Guardian() {
    }

    public Guardian(int ID, String name, int phone, String gender, String address, String dateofbirth) {
        this.ID = ID;
        this.name = name;
        this.phone = phone;
        this.gender = gender;
        this.address = address;
        this.dateofbirth = dateofbirth;
    }

    public int getGuardianID() {
        return ID;
    }

    public String getName() {
        return name;
    }

    public int getPhone() {
        return phone;
    }

    public String getGender() {
        return gender;
    }

    public String getAddress() {
        return address;
    }

    public String getDateofbirth() {
        return dateofbirth;
    }

    public void setGuardianID(int ID) {
        this.ID = ID;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPhone(int phone) {
        this.phone = phone;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setDateofbirth(String dateofbirth) {
        this.dateofbirth = dateofbirth;
    }

}

