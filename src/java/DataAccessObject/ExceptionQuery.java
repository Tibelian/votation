
package DataAccessObject;

public class ExceptionQuery extends Exception {
    
    private int code;
    
    public ExceptionQuery(String message){
        super(message);
    }
    
    public ExceptionQuery(String message, int code){
        super(message);
        this.setCode(code);
    }

    public ExceptionQuery(String message, Throwable throwable) {
        super(message, throwable);
    }
    
    public void setCode(int code){
        this.code = code;
    }
    public int getCode(){
        return this.code;
    }
    public int getErrorCode(){
        return this.code;
    }
    
}
