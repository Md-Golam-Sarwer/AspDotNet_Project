using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(EvidenceExam.Startup))]
namespace EvidenceExam
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
