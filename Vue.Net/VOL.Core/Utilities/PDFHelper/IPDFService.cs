using System;
using System.Collections.Generic;
using System.Text;

namespace VOL.Core.Utilities.PDFHelper
{
    /// <summary>
    /// pdf接口
    /// </summary>
    public interface IPDFService
    {
        /// <summary>
        /// 创建PDF
        /// </summary>
        /// <param name="htmlContent">传入html字符串</param>
        /// <returns></returns>
        byte[] CreatePDF(string htmlContent);

    }
}
