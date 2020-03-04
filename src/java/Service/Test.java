
package Service;

import Model.Voter;
import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

@WebService(serviceName = "Test")
public class Test {

    @WebMethod(operationName = "ListVoter")
    public ArrayList<Voter> ListVoter() {
        return new OperationWS().getListVoter();
    }

    @WebMethod(operationName = "ResultVotation")
    public ArrayList ResultVotation() {
        return null;
    }
}
