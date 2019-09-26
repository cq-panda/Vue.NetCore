using VOL.Core.BaseProvider;
using VOL.Core.Extensions.AutofacManager;
using VOL.Entity.DomainModels;
using System.Linq;
using VOL.Core.Extensions;
using VOL.Core.Enums;
using System;
using VOL.System.Repositories;
using System.Collections.Generic;
using VOL.Core.ManageUser;
using System.Linq.Expressions;
using Newtonsoft.Json;

namespace VOL.System.Services
{
    public partial class Sys_ImageLibraryService
    {
        public void AddImage(string imageUrls, ImageSourceType sourceType, bool saveChanges = false)
        {
            //写入图片
            if (string.IsNullOrEmpty(imageUrls))
                return;
            List<Sys_ImageLibrary> list = new List<Sys_ImageLibrary>();
            UserInfo userInfo = UserContext.Current.UserInfo;
            imageUrls = imageUrls.Trim(',');
            if (imageUrls.Contains(".mp4"))
            {
                string[] files = imageUrls.Split(",");
                files.Where(x => x.Contains(".mp4")).ToList().ForEach(x =>
                {
                    list.Add(new Sys_ImageLibrary()
                    {
                        ImageUrls = x,
                        SourceType = (int)sourceType,
                        Enable = 1,
                        FileType = 1,
                        CreateDate = DateTime.Now,
                        Creator = userInfo.UserTrueName,
                        CreateID = userInfo.User_Id
                    });
                });
                imageUrls = string.Join(",", files.Where(x => !x.Contains(".mp4")));
            }
            if (!string.IsNullOrEmpty(imageUrls))
            {
                list.Add(new Sys_ImageLibrary()
                {
                    ImageUrls = imageUrls,
                    SourceType = (int)sourceType,
                    Enable = 1,
                    FileType = 0,
                    CreateDate = DateTime.Now,
                    Creator = userInfo.UserTrueName,
                    CreateID = userInfo.User_Id
                });
            }
            repository.AddRange(list, saveChanges);
        }
        public void AddImage(string imageUrls, string tableName)
        {
            Enum.TryParse(tableName ?? "Other", out ImageSourceType image);
            AddImage(imageUrls, image, true);
        }

        private string GetFiles(int page, int fileType)
        {
            Expression<Func<Sys_ImageLibrary, object>> selectorResult;
            if (fileType == 0)
            {
                selectorResult = s => s.ImageUrls;
            }
            else
            {
                selectorResult = s => new { s.Id, Cover = string.IsNullOrEmpty(s.Cover) ? "" : s.Cover, s.ImageUrls };
            }

            var data = Sys_ImageLibraryRepository.Instance.QueryByPage(page, 30, out int rowCount, x => x.Enable == 1 && x.FileType == fileType, o => new Dictionary<object, QueryOrderBy>() { { o.Id, QueryOrderBy.Desc } }, selectorResult);

            return fileType == 0 ? string.Join(",", data) : JsonConvert.SerializeObject(data);
        }

        public string GetImage(int page)
        {
            return GetFiles(page, 0);
        }
        public string GetVideo(int page)
        {
            return GetFiles(page, 1);
        }

        public KeyValuePair<string,string> GetVideoIframe(int id)
        {
            return Sys_ImageLibraryRepository.Instance.Find(x => x.Id == id && x.FileType == 1, s => new KeyValuePair<string, string>(s.Cover, s.ImageUrls)).FirstOrDefault();
        }
    }
}

