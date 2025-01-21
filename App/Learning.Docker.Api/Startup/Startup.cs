using Learning.Common.Api.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Microsoft.AspNetCore.Mvc.Versioning;
using Microsoft.OpenApi.Models;

namespace DockerAppsDemo.Startup
{
    public static class Startup
    {
        public static (WebApplicationBuilder builder, WebApplication app) StartApp(string[] args)
        {
            WebApplicationBuilder builder = WebApplication.CreateBuilder(args);
            IServiceCollection services = ConfigureServices(builder, args);
            WebApplication app = ConfigureMiddleware(builder, args);

            return (builder, app);
        }

        public static IServiceCollection ConfigureServices(WebApplicationBuilder builder, string[] args)
        {
            IServiceCollection services = builder.Services;

            services.AddControllers();
            services.AddEndpointsApiExplorer();

            SetupSwaggerService(services);

            services.AddApiVersioning(options =>
            {
                options.ReportApiVersions = true;
                options.AssumeDefaultVersionWhenUnspecified = true;
                options.DefaultApiVersion = new ApiVersion(1, 0);
                options.ApiVersionReader = new UrlSegmentApiVersionReader();
            });

            services
                .AddHttpContextAccessorService()
                .AddCommonAPIServices();

            return services;
        }

        public static WebApplication ConfigureMiddleware(WebApplicationBuilder builder, string[] args)
        {
            WebApplication app = builder.Build();

            app.UseRouting();
            app.UseHttpsRedirection();
            app.UseAuthorization();

            // Configure the HTTP request pipeline.
            if (app.Environment.IsDevelopment())
            {
                SetupSwaggerMiddleware(app);
            }

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            return app;
        }

        private static void SetupSwaggerService(IServiceCollection services)
        {
            services.AddTransient<IApiVersionDescriptionProvider, DefaultApiVersionDescriptionProvider>();
            //// services.AddSwaggerGen();
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "API v1", Version = "v1" });
                c.SwaggerDoc("v2", new OpenApiInfo { Title = "API v2", Version = "v2" });
                c.SwaggerDoc("v3", new OpenApiInfo { Title = "API v3", Version = "v3" });
                c.ResolveConflictingActions(apiDescriptions => apiDescriptions.First());
            });
        }

        private static void SetupSwaggerMiddleware(WebApplication app)
        {
            //app.UseSwagger();
            ////// app.UseSwaggerUI();
            //app.UseSwaggerUI(c =>
            //{
            //    c.SwaggerEndpoint("/swagger/v1/swagger.json", "Your API v1");
            //});

            app.UseSwagger();
            //app.UseSwaggerUI(c =>
            //{
            //    c.SwaggerEndpoint("/swagger/v1/swagger.json", "API v1");
            //    c.SwaggerEndpoint("/swagger/v2/swagger.json", "API v2");
            //    c.SwaggerEndpoint("/swagger/v3/swagger.json", "API v3");
            //    c.RoutePrefix = string.Empty; // Serve the Swagger UI at the app's root (http://localhost:<port>/)
            //});

            app.UseSwaggerUI(c =>
            {
                foreach (var description in app.Services.GetRequiredService<IApiVersionDescriptionProvider>().ApiVersionDescriptions)
                {
                    c.SwaggerEndpoint($"/swagger/v{description.GroupName.Split(".")[0]}/swagger.json", $"API {description.GroupName}");
                }
                c.RoutePrefix = "swagger"; // Serve the Swagger UI at /swagger endpoint
            });

            //app.UseSwaggerUI(c =>
            //{
            //    c.SwaggerEndpoint("/swagger/v1/swagger.json", "API v1");
            //    c.SwaggerEndpoint("/swagger/v2/swagger.json", "API v2");
            //    c.SwaggerEndpoint("/swagger/v3/swagger.json", "API v3");
            //    c.RoutePrefix = "swagger"; // Serve the Swagger UI at /swagger endpoint
            //});
        }
    }
}
