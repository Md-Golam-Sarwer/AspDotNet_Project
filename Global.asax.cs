using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using Microsoft.AspNet.FriendlyUrls;

namespace EvidenceExam
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            //BundleConfig.RegisterBundles(BundleTable.Bundles);
            RouteTable.Routes.EnableFriendlyUrls();
            Routing(RouteTable.Routes);
            
        }
        void Routing (RouteCollection routes)
        {
            routes.MapPageRoute(
                routeName: "Routing",
                routeUrl: "myEvidence/WebRouting",
                physicalFile: "~/Employee_SQL/EmployeeInformation"
                );

        }
    }
}