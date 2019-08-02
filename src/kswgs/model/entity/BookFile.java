package kswgs.model.entity;

public class BookFile {

    /**
    图书文件id
     */
    private String book_file_id;
    /**
     * 图书文件名
     */
    private String file_name;
    /**
     * 图书文件类型
     */
    private String file_type;
    /**
     * 图书文件路径
     */
    private String path;
    /**
     * 对应图书id
     */
    private String book_id;

    /**
     * 图书文件大小，保存的是 **.**kb或**.**mb字符串
     */
    private String file_size;

    public String getBook_file_id() {
        return book_file_id;
    }

    public void setBook_file_id(String book_file_id) {
        this.book_file_id = book_file_id;
    }

    public String getFile_name() {
        return file_name;
    }

    public void setFile_name(String file_name) {
        this.file_name = file_name;
    }

    public String getFile_type() {
        return file_type;
    }

    public void setFile_type(String file_type) {
        this.file_type = file_type;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public String getBook_id() {
        return book_id;
    }

    public void setBook_id(String book_id) {
        this.book_id = book_id;
    }

    public String getFile_size() {
        return file_size;
    }



    public void setFile_size(String file_size) {
        this.file_size = file_size;
    }

    @Override
    public String toString() {
        return "BookFile{" +
                "book_file_id='" + book_file_id + '\'' +
                ", file_name='" + file_name + '\'' +
                ", file_type='" + file_type + '\'' +
                ", path='" + path + '\'' +
                ", book_id='" + book_id + '\'' +
                ", file_size='" + file_size + '\'' +
                '}';
    }

}
