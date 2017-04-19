/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package project.transaction;

import java.util.List;
import javax.ejb.Remote;

/**
 *
 * @author duclt
 */
@Remote
public interface TransactionSessionBeanRemote {

    List findListTransaction(String fromDate, String toDate, String username);

    boolean hideTransaction(String transId);

    boolean writeTransaction(String username, int type, double amount, String reason);
    
}
