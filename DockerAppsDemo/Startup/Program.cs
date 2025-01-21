using DockerAppsDemo.Startup;

(WebApplicationBuilder builder, WebApplication app) = Startup.StartApp(args);
app.Run();