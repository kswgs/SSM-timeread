package kswgs.utils;

public class Result {
    private Integer code;//状态码
    private Boolean isSuccess;//状态
    private String msg;//消息
    private Integer count;//数据量
    private Object data;//数据对象

    /**
     * 无参构造器
     */
    public Result(){
        super();
    }

    /**
     * 只返回状态
     * @param success
     */
    public Result(Boolean success){
        super();
        this.isSuccess=success;
    }

    /**
     * 只返回状态，消息
     * @param success
     * @param msg
     */
    public Result(Boolean success, String msg){
        super();
        this.isSuccess=success;
        this.msg = msg;
    }

    /**
     * 只返回状态，状态码，消息
     * @param success
     * @param code
     * @param msg
     */
    public Result(Boolean success, Integer code, String msg){
        super();
        this.isSuccess=success;
        this.code=code;
        this.msg = msg;
    }

    /**
     * 只返回状态，状态码，数据对象
     * @param success
     * @param code
     * @param data
     */
    public Result(Boolean success, Integer code, Object data){
        super();
        this.isSuccess=success;
        this.code=code;
        this.data = data;
    }

    /**
     * 返回全部信息即状态，状态码，消息，数据对象
     * @param success
     * @param code
     * @param msg
     * @param data
     */
    public Result(Boolean success, Integer code, String msg, Object data){
        super();
        this.isSuccess=success;
        this.code=code;
        this.msg = msg;
        this.data = data;
    }

    /**
     * 返回全部信息即状态，状态码，消息，数据量，数据对象
     * @param success
     * @param code
     * @param msg
     * @param data
     */
    public Result(Boolean success, Integer code, String msg,Integer count, Object data){
        super();
        this.isSuccess=success;
        this.code=code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public Boolean getIsSuccess() {
        return isSuccess;
    }

    public void setIsSuccess(Boolean isSuccess) {
        this.isSuccess = isSuccess;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "Result{" +
                "code=" + code +
                ", isSuccess=" + isSuccess +
                ", msg='" + msg + '\'' +
                ", count='" + count + '\'' +
                ", data=" + data +
                '}';
    }
}
