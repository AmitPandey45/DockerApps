
# Working
docker run -d -p 5001:8080 amittest:1.0
docker run -d -p 7223:8080 -e ASPNETCORE_URLS=http://+:8080 amittest:1.0

## Not working

docker run -p 7223:8080 -p 7224:7223 -e ASPNETCORE_HTTP_PORT=https://+:7223 -e ASPNETCORE_URLS=http://+:7224 amittest:1.0



## Alpine Image

FROM mcr.microsoft.com/dotnet/aspnet:8.0-alpine AS base
WORKDIR /app
ENV DOTNET_RUNNING_IN_CONTAINER=true
RUN apk add --no-cache icu-libs krb5-libs libgcc libintl libssl1.1 libstdc++ zlib ca-certificates 
ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false
ENV ASPNETCORE_HTTP_PORTS=80
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:8.0-alpine AS build
WORKDIR /src
COPY ["IDP/IDP.csproj", "IDP/"]
COPY ["Infrastructure/Infrastructure.csproj", "Infrastructure/"]
COPY ["Domain/Domain.csproj", "Domain/"]
COPY ["Shared/Shared.csproj", "Shared/"]
RUN dotnet restore "IDP/IDP.csproj"
COPY . .
WORKDIR "/src/IDP"
RUN dotnet build "IDP.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "IDP.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ARG ENVIRONMENT
ENV ASPNETCORE_ENVIRONMENT $ENVIRONMENT
ENTRYPOINT ["dotnet", "IDP.dll"]