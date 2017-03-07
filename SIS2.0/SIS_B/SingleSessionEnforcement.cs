using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using SIS_D;

namespace SIS_B
{
    public class SingleSessionEnforcement: IHttpModule{

        public SingleSessionEnforcement()
        {
            // No construction needed
        }

        private void OnPostAuthenticate(Object sender, EventArgs e)
        {
            Guid sessionToken;

            HttpApplication httpApplication = (HttpApplication)sender;
            HttpContext httpContext = httpApplication.Context;

            // Check user's session token
            if (httpContext.User.Identity.IsAuthenticated)
            {
                FormsAuthenticationTicket authenticationTicket =
                    ((FormsIdentity)httpContext.User.Identity).Ticket;

                if (authenticationTicket.UserData != "")
                {
                    sessionToken = new Guid(authenticationTicket.UserData);
                }
                else
                {
                    // No authentication ticket found so logout this user
                    // Should never hit this code
                    FormsAuthentication.SignOut();
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
                    cookie.Expires = DateTime.Now.AddMinutes(5);
                    FormsAuthentication.RedirectToLoginPage();
                    return;
                }

                SisUser currentUser = SisUserService.getUser(authenticationTicket.Name);

                // May want to add a conditional here so we only check
                // if the user needs to be checked. For instance, your business
                // rules for the application may state that users in the Admin
                // role are allowed to have multiple sessions
                Guid storedToken = new Guid(currentUser.refToken);

                if (sessionToken != storedToken)
                {
                    // Stored session does not match one in authentication
                    // ticket so logout the user
                    FormsAuthentication.SignOut();
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName, "");
                    cookie.Expires = DateTime.Now.AddMinutes(5);
                    httpContext.Response.Redirect("~/logout?ml=5jg90sjrkkms0-8jj");
                    //FormsAuthentication.RedirectToLoginPage();
                }
            }
            
        }

        public void Dispose()
        {
            // Nothing to dispose
        }

        public void Init(HttpApplication context)
        {
            context.PostAuthenticateRequest += new EventHandler(OnPostAuthenticate);
        }
    }
}
