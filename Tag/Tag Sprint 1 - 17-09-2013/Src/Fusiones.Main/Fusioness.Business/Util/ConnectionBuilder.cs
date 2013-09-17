//#define LOCAL
#define RELEASE
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
