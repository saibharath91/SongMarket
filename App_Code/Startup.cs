using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(SongCart.Startup))]
namespace SongCart
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
