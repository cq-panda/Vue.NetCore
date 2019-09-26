using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;

namespace VOL.Web
{
    public class Program
    {
        public static void Main(string[] args)
        {

            //   BuildWebHost(args).Run();
            var config = new ConfigurationBuilder()
               .SetBasePath(Directory.GetCurrentDirectory())
               .AddJsonFile("appsettings.json", optional: true)
               .Build();
            string urls = config["PortConfig:Default"];
            var host = new WebHostBuilder()
                .UseKestrel()
                .UseContentRoot(Directory.GetCurrentDirectory())
                .UseIISIntegration()
                .UseStartup<Startup>()
                //.UseApplicationInsights()
                .UseUrls(urls)// .UseUrls("http://*:9001")
                .Build();
            host.Run();

        }
    }
}
