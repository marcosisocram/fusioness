//#define LOCAL
#define RELEASE
using System.Configuration;

namespace Fusioness.Business.Util
{
    public class ConnectionBuilder
    {
        public static string GetConnection()
        {
            string connectionName = "";
#if (LOCAL)
            connectionName = "localConnection";
#else
            connectionName = "remoteConnection";
#endif
            return ConfigurationManager.ConnectionStrings[connectionName].ConnectionString;
        }
    }
}
