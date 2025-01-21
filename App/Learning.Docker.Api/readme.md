# Following better folder structure for the projects

# Working
docker run -d -p 5001:8080 amittest:1.0
docker run -d -p 7223:8080 -e ASPNETCORE_URLS=http://+:8080 amittest:1.0
docker run --name dockerapi -p 8081:8080 amittest:1.0.0
docker build --no-cache --progress plain -t amittest:1.0.1 -f ./App/Learning.Docker.Api/Dockerfile .

## Not working

docker run -p 7223:8080 -p 7224:7223 -e ASPNETCORE_HTTP_PORT=https://+:7223 -e ASPNETCORE_URLS=http://+:7224 amittest:1.0

## SonarQube
dotnet sonarscanner begin /k:"dockerdemoapi" /d:sonar.host.url="http://localhost:9000"  /d:sonar.token="sqp_052c6b9d5ff89ee3348a00952f0e380f76d54b82"
dotnet build
dotnet sonarscanner end /d:sonar.token="sqp_052c6b9d5ff89ee3348a00952f0e380f76d54b82"

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








## Covergae

# Use a base image with .NET Core SDK installed
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

# Set the working directory
WORKDIR /app

# Copy the project files to the container
COPY . .

# Install OpenCover (example using Chocolatey on Windows)
RUN choco install -y opencover

# Run tests with OpenCover and generate coverage output file
RUN OpenCover.Console.exe -target:"dotnet test" -output:coverage_output.xml

# Install SonarScanner (example using Chocolatey on Windows)
RUN choco install -y sonarscanner-msbuild

# Run SonarScanner to analyze the project and upload coverage data to SonarQube
RUN SonarScanner.MSBuild.exe begin /k:"<project_key>" /d:sonar.host.url="<sonarqube_url>" /d:sonar.login="<authentication_token>"
RUN dotnet build
RUN SonarScanner.MSBuild.exe end /d:sonar.login="<authentication_token>"






==========================


# Use a .NET SDK image as the base image
FROM mcr.microsoft.com/dotnet/sdk:5.0-alpine AS build

# Set the working directory
WORKDIR /app

# Copy the project files to the container
COPY . .

# Restore dependencies
RUN dotnet restore

# Build and test the application with coverage
RUN dotnet test /p:CollectCoverage=true /p:CoverletOutputFormat=opencover

# Install OpenCover (if not already installed)
RUN apk add --no-cache opencover

# Generate the coverage report
RUN opencover.console -register:user -target:"dotnet" -targetargs:"test" -output:coverage.xml

# Optionally, publish the coverage report
# (e.g., by copying it to a directory accessible by SonarQube)
COPY coverage.xml /app



===============================


# Use a base image with .NET Core SDK installed
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build

# Set the working directory
WORKDIR /app

# Copy the project files to the container
COPY . .

# Install OpenCover (assuming it's available as a package in Alpine)
RUN apk add --no-cache opencover

# Run tests with OpenCover and generate coverage output file
RUN opencover -target:"dotnet test" -output:coverage_output.xml

# Install SonarScanner (assuming it's available as a package in Alpine)
RUN apk add --no-cache sonar-scanner

# Run SonarScanner to analyze the project and upload coverage data to SonarQube
RUN sonar-scanner begin /k:"<project_key>" /d:sonar.host.url="<sonarqube_url>" /d:sonar.login="<authentication_token>"
RUN dotnet build
RUN sonar-scanner end /d:sonar.login="<authentication_token>"
