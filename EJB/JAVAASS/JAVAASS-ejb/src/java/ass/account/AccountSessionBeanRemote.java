/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ass.account;

import javax.ejb.Remote;

/**
 *
 * @author duclt
 */
@Remote
public interface AccountSessionBeanRemote {

    boolean checkLogin(String accountId, String pin);

    TblAccount getAccountById(String accountId);

    boolean updateBalance(String accountId, double balance);

    
    
}
