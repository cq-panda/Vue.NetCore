using SkiaSharp;
using System;
using System.IO;
using System.Linq;

namespace VOL.Core.Utilities
{
    public static class VierificationCodeHelpers
    {        //验证码字体集合
        private static readonly string[] fonts = { "Verdana", "Microsoft Sans Serif", "Comic Sans MS", "Arial", "宋体" };
        private static readonly SKColor[] colors = { SKColors.Black, SKColors.Green, SKColors.Brown };

        /// <summary>
        /// 
        /// </summary>
        /// <param name="code"></param>
        /// <returns></returns>
        public static string CreateBase64Image(string code)
        {
            var random = new Random();
            var info = new SKImageInfo((int)code.Length * 18, 32);
            using var bitmap = new SKBitmap(info);
            using var canvas = new SKCanvas(bitmap);

            canvas.Clear(SKColors.White);

            using var pen = new SKPaint();
            pen.FakeBoldText = true;
            pen.Style = SKPaintStyle.Fill;
            pen.TextSize = 20;// 0.6f * info.Width * pen.TextSize / pen.MeasureText(code);

            //绘制随机字符
            for (int i = 0; i < code.Length; i++)
            {
                pen.Color = random.GetRandom(colors);//随机颜色索引值
                pen.Typeface = SKTypeface.FromFamilyName(random.GetRandom(fonts), 700, 20, SKFontStyleSlant.Italic);//配置字体
                var point = new SKPoint()
                {
                    X = i * 16,
                    Y = 22// info.Height - ((i + 1) % 2 == 0 ? 2 : 4),

                };
                canvas.DrawText(code.Substring(i, 1), point, pen);//绘制一个验证字符
            }

            //绘制噪点
            var points = Enumerable.Range(0, 100).Select(
                _ => new SKPoint(random.Next(bitmap.Width), random.Next(bitmap.Height))
            ).ToArray();
            canvas.DrawPoints(
                SKPointMode.Points,
                points,
                pen);

            //绘制贝塞尔线条
            for (int i = 0; i < 2; i++)
            {
                var p1 = new SKPoint(0, 0);
                var p2 = new SKPoint(0, 0);
                var p3 = new SKPoint(0, 0);
                var p4 = new SKPoint(0, 0);

                var touchPoints = new SKPoint[] { p1, p2, p3, p4 };

                using var bPen = new SKPaint();
                bPen.Color = random.GetRandom(colors);
                bPen.Style = SKPaintStyle.Stroke;

                using var path = new SKPath();
                path.MoveTo(touchPoints[0]);
                path.CubicTo(touchPoints[1], touchPoints[2], touchPoints[3]);
                canvas.DrawPath(path, bPen);
            }
            return bitmap.ToBase64String(SKEncodedImageFormat.Png);
        }

        public static T GetRandom<T>(this Random random, T[] tArray)
        {
            if (random == null) random = new Random();
            return tArray[random.Next(tArray.Length)];
        }

        /// <summary>
        /// SKBitmap转Base64String
        /// </summary>
        /// <param name="bitmap"></param>
        /// <param name="format"></param>
        /// <returns></returns>
        public static string ToBase64String(this SKBitmap bitmap, SKEncodedImageFormat format)
        {
            using var memStream = new MemoryStream();
            using var wstream = new SKManagedWStream(memStream);
            bitmap.Encode(wstream, format, 32);
            memStream.TryGetBuffer(out ArraySegment<byte> buffer);
            return $"{Convert.ToBase64String(buffer.Array, 0, (int)memStream.Length)}";
        }
    }
}