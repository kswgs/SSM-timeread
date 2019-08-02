package kswgs.model.entity;

public class BackUser {

    private String username;

    private String password;

    private String image_path;

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

    public String getImage_path() {
        return image_path;
    }

    public void setImage_path(String image_path) {
        this.image_path = image_path;
    }

    @Override
    public String toString() {
        return "BackUser{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", image_path='" + image_path + '\'' +
                '}';
    }
}
