﻿namespace Learning.Common.Api.Extensions
{
    public static class CommonServiceCollectionExtensions
    {
        public static IServiceCollection AddHttpContextAccessorService(this IServiceCollection services)
        {
            services.AddHttpContextAccessor();
            return services;
        }

        public static IServiceCollection AddCommonAPIServices(this IServiceCollection services)
        {
            return services;
        }
    }
}
