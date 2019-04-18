package Shiro;

/**
 * @Author: IngRun
 * @CreateTime: 2019-04-10 23:12
 * @Description: 测试枚举类
 */

public enum  erroe {

    NAME_PASSWORD_ERROR("sd","100");

    String msg;
    String error;
    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    private erroe(String msg, String error) {
    }

}
