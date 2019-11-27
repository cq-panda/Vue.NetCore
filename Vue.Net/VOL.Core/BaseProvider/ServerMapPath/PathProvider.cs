
using Microsoft.AspNetCore.Hosting;
using System.IO;
using VOL.Core.Extensions;
using VOL.Core.Extensions.AutofacManager;

namespace VOL.Core.BaseProvider.ServerMapPath
{
    public interface IPathProvider : IDependency
    {
        string MapPath(string path);
        string MapPath(string path, bool rootPath);
        IHostingEnvironment GetHostingEnvironment();
    }

    public class PathProvider : IPathProvider
    {
        private IHostingEnvironment _hostingEnvironment;

        public PathProvider(IHostingEnvironment environment)
        {
            _hostingEnvironment = environment;
        }
        public IHostingEnvironment GetHostingEnvironment()
        {
            return _hostingEnvironment;
        }

        public string MapPath(string path)
        {
            return MapPath(path, false);
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="path"></param>
        /// <param name="rootPath">获取wwwroot路径</param>
        /// <returns></returns>
        public string MapPath(string path, bool rootPath)
        {
            if (rootPath)
            {
                if (_hostingEnvironment.WebRootPath == null)
                {
                    _hostingEnvironment.WebRootPath = _hostingEnvironment.ContentRootPath + "/wwwroot".ReplacePath();
                }
                return Path.Combine(_hostingEnvironment.WebRootPath, path).ReplacePath();
            }
            return Path.Combine(_hostingEnvironment.ContentRootPath, path).ReplacePath();
        }
    }
}
