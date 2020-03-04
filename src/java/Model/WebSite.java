
package Model;

public class WebSite {

    private static String title = "Votation System";
    private static String url = "http://localhost:8080/votation";

    public static String getTitle() {
        return title;
    }

    public static void setTitle(String title) {
        WebSite.title = title;
    }

    public static String getUrl() {
        return url;
    }

    public static void setUrl(String url) {
        WebSite.url = url;
    }
    
    
    
}
