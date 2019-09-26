using VOL.Core.BaseProvider;
using VOL.Core.Enums;
using VOL.Entity.DomainModels;
using System.Collections.Generic;

namespace VOL.System.IServices
{
    public partial interface ISys_ImageLibraryService
    {
       void AddImage(string imageUrls, ImageSourceType sourceType, bool saveChanges = false);

       void AddImage(string imageUrls, string tableName);

        string GetImage(int page);
        string GetVideo(int page);
        KeyValuePair<string, string> GetVideoIframe(int id);
    }
 }

