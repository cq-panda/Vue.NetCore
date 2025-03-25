#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.
#
#FROM mcr.microsoft.com/dotnet/aspnet:6.0 AS base
#RUN apt-get update; apt-get install libfontconfig1 -y
#
#WORKDIR /app
#EXPOSE 9991
#
#FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
#WORKDIR /src
#COPY ["VOL.WebApi/VOL.WebApi.csproj", "VOL.WebApi/"]
#COPY ["VOL.System/VOL.System.csproj", "VOL.System/"]
#COPY ["VOL.Core/VOL.Core.csproj", "VOL.Core/"]
#COPY ["VOL.Entity/VOL.Entity.csproj", "VOL.Entity/"]
#COPY ["VOL.Order/VOL.Order.csproj", "VOL.Order/"]
#COPY ["VOL.AppManager/VOL.AppManager.csproj", "VOL.AppManager/"]
#COPY ["VOL.Builder/VOL.Builder.csproj", "VOL.Builder/"]
#RUN dotnet restore "VOL.WebApi/VOL.WebApi.csproj"
#COPY . .
#WORKDIR "/src/VOL.WebApi"
#RUN dotnet build "VOL.WebApi.csproj" -c Release -o /app/build
#
#FROM build AS publish
#RUN dotnet publish "VOL.WebApi.csproj" -c Release -o /app/publish
#
#FROM base AS final
#WORKDIR /app
#COPY --from=publish /app/publish .
#ENTRYPOINT ["dotnet", "VOL.WebApi.dll"]

#docker run -p 3306:3306 --name volmysql \
#--restart=always \
#-v /home/mysql/data:/var/lib/mysql \
#-e MYSQL_ROOT_PASSWORD=123456 \
#-d mysql:5.7

#docker build -t volapi:1.0 .
#docker run -d --name volapi -v /etc/timezone:/etc/timezone:ro -v /etc/localtime:/etc/localtime:ro --restart=always  --log-opt max-size=300m --log-opt max-file=3 --network=host volapi:1.0 

FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /app
COPY . .
RUN apt-get update -y && apt-get install -y libgdiplus && apt-get clean && ln -s /usr/lib/libgdiplus.so /usr/lib/gdiplus.dll
ENTRYPOINT ["dotnet", "VOL.WebApi.dll"]