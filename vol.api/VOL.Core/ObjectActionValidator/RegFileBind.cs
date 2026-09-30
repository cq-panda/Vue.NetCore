using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace VOL.Core.ObjectActionValidator
{
    public static class RegFileBind
    {
        public static IMvcBuilder AddCompatibility(this IMvcBuilder mvc)
        {
            mvc.AddMvcOptions(options =>
            {
                options.ModelBinderProviders.Insert(0, new FileModelBinderProvider());
            });
            mvc.ConfigureApiBehaviorOptions(options =>
            {
                options.SuppressConsumesConstraintForFormFileParameters = true;
                options.SuppressInferBindingSourcesForParameters = true;
                options.SuppressModelStateInvalidFilter = true;
                options.SuppressMapClientErrors = true;
                options.ClientErrorMapping[404].Link = "https://*/404";
            });
            return mvc;
        }
    }
    public sealed class FileModelBinderProvider : IModelBinderProvider
    {
        public IModelBinder GetBinder(ModelBinderProviderContext context)
        {
            if (!IsFormFileType(context.Metadata.ModelType))
            {
                return null;
            }

            var request = context.Services?.GetService<IHttpContextAccessor>()?.HttpContext?.Request;
            if (request != null && !request.HasFormContentType)
            {
                return null;
            }

            return FileModelBinder.Instance;
        }

        private static bool IsFormFileType(Type type)
        {
            return type == typeof(IFormFile)
                || type == typeof(IEnumerable<IFormFile>)
                || type == typeof(IReadOnlyList<IFormFile>)
                || type == typeof(IList<IFormFile>)
                || type == typeof(ICollection<IFormFile>)
                || type == typeof(List<IFormFile>)
                || type == typeof(IFormFile[]);
        }
    }

    public sealed class FileModelBinder : IModelBinder
    {
        internal static readonly FileModelBinder Instance = new FileModelBinder();

        private FileModelBinder()
        {
        }

        public Task BindModelAsync(ModelBindingContext bindingContext)
        {
            if (bindingContext == null)
            {
                throw new ArgumentNullException(nameof(bindingContext));
            }

            var modelName = bindingContext.ModelName;
            var request = bindingContext.HttpContext?.Request;
            var modelType = bindingContext.ModelMetadata.ModelType;

            if (request == null)
            {
                bindingContext.Result = ModelBindingResult.Failed();
                return Task.CompletedTask;
            }

            try
            {
                if (!request.HasFormContentType || request.Form?.Files == null)
                {
                    SetEmpty(bindingContext, modelType);
                    return Task.CompletedTask;
                }

                var list = CollectFiles(request.Form.Files, modelName);

                if (modelType == typeof(IFormFile))
                {
                    bindingContext.Result = ModelBindingResult.Success(list.Count > 0 ? list[0] : null);
                    return Task.CompletedTask;
                }

                if (modelType == typeof(IFormFile[]))
                {
                    bindingContext.Result = ModelBindingResult.Success(list.Count > 0 ? list.ToArray() : Array.Empty<IFormFile>());
                    return Task.CompletedTask;
                }

                bindingContext.Result = ModelBindingResult.Success(list);
                return Task.CompletedTask;
            }
            catch (Exception ex)
            {
                bindingContext.ModelState.AddModelError(modelName, ex.Message);
                bindingContext.Result = ModelBindingResult.Failed();
                return Task.CompletedTask;
            }
        }

        private static void SetEmpty(ModelBindingContext bindingContext, Type modelType)
        {
            if (modelType == typeof(IFormFile))
            {
                bindingContext.Result = ModelBindingResult.Success(null);
            }
            else if (modelType == typeof(IFormFile[]))
            {
                bindingContext.Result = ModelBindingResult.Success(Array.Empty<IFormFile>());
            }
            else
            {
                bindingContext.Result = ModelBindingResult.Success(new List<IFormFile>());
            }
        }

        private static List<IFormFile> CollectFiles(IFormFileCollection files, string fieldName)
        {
            var result = new List<IFormFile>();
            foreach (var file in files)
            {
                if (file == null || file.Length == 0)
                {
                    continue;
                }

                if (!string.IsNullOrEmpty(fieldName) &&
                    string.Equals(file.Name, fieldName, StringComparison.OrdinalIgnoreCase))
                {
                    result.Add(file);
                }
            }

            if (result.Count > 0)
            {
                return result;
            }

            foreach (var file in files)
            {
                if (file != null && file.Length > 0)
                {
                    result.Add(file);
                }
            }

            return result;
        }
    }
}
