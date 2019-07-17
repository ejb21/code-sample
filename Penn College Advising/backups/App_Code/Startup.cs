using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(APP_website.Startup))]
namespace APP_website
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
