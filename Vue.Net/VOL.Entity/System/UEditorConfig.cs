using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Entity.System
{
    public class UEditorConfig
    {

        public string ImageActionName { get; set; }
        public string ImageFieldName { get; set; }
        public int ImageMaxSize { get; set; }
        public string[] ImageAllowFiles { get; set; }
        public bool ImageCompressEnable { get; set; }
        public int ImageCompressBorder { get; set; }
        public string ImageInsertAlign { get; set; }
        public string ImageUrlPrefix { get; set; }
        public string ImagePathFormat { get; set; }

        public string VideoActionName { get; set; }
        public string VideoFieldName { get; set; }
        public string VideoPathFormat { get; set; }
        public string VideoUrlPrefix { get; set; }
        public int VideoMaxSize { get; set; }
        public string[] VideoAllowFiles { get; set; }

        public string FileActionName { get; set; }
        public string FileFieldName { get; set; }
        public string FilePathFormat { get; set; }
        public string FileUrlPrefix { get; set; }
        public int FileMaxSize { get; set; }
        public string[] FileAllowFiles { get; set; }
    }
}
