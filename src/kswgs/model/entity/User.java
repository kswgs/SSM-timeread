package kswgs.model.entity;


public class User {

    private String username;

    private String password;

    private String email;

    private UserDetailed userDetailed;

    public User() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public UserDetailed getUserDetailed() {
        return userDetailed;
    }

    public void setUserDetailed(UserDetailed userDetailed) {
        this.userDetailed = userDetailed;
    }

    @Override
    public String toString() {
        return "User{" +
                "username=" + username +
                ", password=" + password +
                ", email=" + email +
                '}';
    }


}
