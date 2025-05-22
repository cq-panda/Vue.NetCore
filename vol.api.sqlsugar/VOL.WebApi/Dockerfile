# 请参阅 https://aka.ms/customizecontainer 以了解如何自定义调试容器，以及 Visual Studio 如何使用此 Dockerfile 生成映像以更快地进行调试。

# 此阶段用于在快速模式(默认为调试配置)下从 VS 运行时
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 8080
EXPOSE 8081


# 此阶段用于生成服务项目
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ["VOL.WebApi/VOL.WebApi.csproj", "VOL.WebApi/"]
COPY ["VOL.Builder/VOL.Builder.csproj", "VOL.Builder/"]
COPY ["VOL.Core/VOL.Core.csproj", "VOL.Core/"]
COPY ["VOL.Entity/VOL.Entity.csproj", "VOL.Entity/"]
COPY ["VOL.MES/VOL.MES.csproj", "VOL.MES/"]
COPY ["VOL.Sys/VOL.Sys.csproj", "VOL.Sys/"]
RUN dotnet restore "./VOL.WebApi/VOL.WebApi.csproj"
COPY . .
WORKDIR "/src/VOL.WebApi"
RUN dotnet build "./VOL.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/build

# 此阶段用于发布要复制到最终阶段的服务项目
FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish "./VOL.WebApi.csproj" -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

# 此阶段在生产中使用，或在常规模式下从 VS 运行时使用(在不使用调试配置时为默认值)
FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "VOL.WebApi.dll"]