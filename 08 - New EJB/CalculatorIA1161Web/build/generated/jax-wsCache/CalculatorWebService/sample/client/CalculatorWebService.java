
package sample.client;

import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.jws.WebResult;
import javax.jws.WebService;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.ws.RequestWrapper;
import javax.xml.ws.ResponseWrapper;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.6-1b01 
 * Generated source version: 2.1
 * 
 */
@WebService(name = "CalculatorWebService", targetNamespace = "http://jws.sample/")
@XmlSeeAlso({
    ObjectFactory.class
})
public interface CalculatorWebService {


    /**
     * 
     * @param num1
     * @param num2
     * @return
     *     returns double
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "addNumber", targetNamespace = "http://jws.sample/", className = "sample.client.AddNumber")
    @ResponseWrapper(localName = "addNumberResponse", targetNamespace = "http://jws.sample/", className = "sample.client.AddNumberResponse")
    public double addNumber(
        @WebParam(name = "num1", targetNamespace = "")
        double num1,
        @WebParam(name = "num2", targetNamespace = "")
        double num2);

    /**
     * 
     * @param num1
     * @param num2
     * @return
     *     returns double
     */
    @WebMethod
    @WebResult(targetNamespace = "")
    @RequestWrapper(localName = "subNumber", targetNamespace = "http://jws.sample/", className = "sample.client.SubNumber")
    @ResponseWrapper(localName = "subNumberResponse", targetNamespace = "http://jws.sample/", className = "sample.client.SubNumberResponse")
    public double subNumber(
        @WebParam(name = "num1", targetNamespace = "")
        double num1,
        @WebParam(name = "num2", targetNamespace = "")
        double num2);

}
