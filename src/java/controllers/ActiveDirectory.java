/**
 * The MIT License
 *
 * Copyright (c) 2010-2012 www.myjeeva.com
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE. 
 * 
 */
package controllers;

import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;

public class ActiveDirectory {
    protected boolean authenticate(String userId, String password) throws NamingException {

        String serverName = "my002vs0047.tp.tpnet.intra";
        
        DirContext ctx = null;

        Hashtable env = new Hashtable();
        boolean b = false;

        try {

            env.put(Context.INITIAL_CONTEXT_FACTORY,
                    "com.sun.jndi.ldap.LdapCtxFactory");
            env.put(Context.PROVIDER_URL, "ldap://" + serverName + ":389");
            env.put(Context.SECURITY_AUTHENTICATION, "simple");
            env.put(Context.SECURITY_PRINCIPAL, "TP\\"+userId);
            env.put(Context.SECURITY_CREDENTIALS, password);

//            System.out.println("before context");

            // If there isn't a naming exception then the user is authenticated. Return true
            ctx = new InitialDirContext(env);

            //The user is authenticated.
            b = true;

        } catch (NamingException e) {
//            e.printStackTrace();
            System.out.println("The user is not authenticated return false ..\nError: " + e.getMessage());
            b = false;
        } finally {
            if (ctx != null) {
                ctx.close();
            }
        }

        return b;
    }
}
