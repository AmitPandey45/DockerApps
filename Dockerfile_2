#See https://aka.ms/customizecontainer to learn how to customize your debug container and how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM myalpinedotnetruntime:8.0 AS base
EXPOSE 8080
EXPOSE 8081

FROM myalpinedotnetsdk:8.0 AS build
WORKDIR /src

# Copy the solution file
COPY Learning.Docker.Api.sln .

# Restore dependencies
COPY . .
## RUN for file in $(ls **/*.csproj); do dotnet restore $file; done
RUN find . -name '*.sln' ! -name 'Learning.Docker.Api.sln' -exec rm -f {} \;

# Copy and restore project files
## COPY . .
## RUN find . -name '*.csproj' -type f -execdir dotnet restore {} \;

# Copy and restore project files
## COPY . .
## RUN find . -name '*.csproj' -type f -execdir dotnet restore {} \;

RUN echo "Displaying folder and files" && ls -la

## RUN dotnet restore Learning.Docker.Api.sln

RUN dotnet restore

RUN dotnet publish -c Release -o out

FROM base AS final
WORKDIR /app
# COPY --from=publish /app/publish .
COPY --from=build /src/out .
ENTRYPOINT ["dotnet", "Learning.Docker.Api.dll"]