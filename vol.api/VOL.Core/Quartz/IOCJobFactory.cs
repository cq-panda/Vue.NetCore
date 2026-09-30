using Microsoft.Extensions.DependencyInjection;
using Quartz;
using Quartz.Spi;
using System;
using System.Threading.Tasks;

namespace VOL.Core.Quartz
{
    /// <summary>
    /// 通过 DI 创建 Job 实例；每次触发使用独立作用域
    /// </summary>
    public class IOCJobFactory : IJobFactory
    {
        private readonly IServiceProvider _serviceProvider;

        public IOCJobFactory(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        public IJob NewJob(TriggerFiredBundle bundle, IScheduler scheduler)
        {
            var scope = _serviceProvider.CreateScope();
            try
            {
                var job = scope.ServiceProvider.GetRequiredService(bundle.JobDetail.JobType) as IJob
                          ?? throw new InvalidOperationException($"无法创建作业类型 {bundle.JobDetail.JobType.FullName}");
                return new ScopedJobWrapper(job, scope);
            }
            catch
            {
                scope.Dispose();
                throw;
            }
        }

        public void ReturnJob(IJob job)
        {
            (job as IDisposable)?.Dispose();
        }

        private sealed class ScopedJobWrapper : IJob, IDisposable
        {
            private readonly IJob _inner;
            private readonly IServiceScope _scope;

            public ScopedJobWrapper(IJob inner, IServiceScope scope)
            {
                _inner = inner;
                _scope = scope;
            }

            public Task Execute(IJobExecutionContext context) => _inner.Execute(context);

            public void Dispose()
            {
                (_inner as IDisposable)?.Dispose();
                _scope.Dispose();
            }
        }
    }
}
