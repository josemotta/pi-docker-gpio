FROM microsoft/dotnet:2.0.0-runtime-stretch-arm32v7 AS base
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV ASPNETCORE_URLS "http://*:80"
WORKDIR /app
EXPOSE 80:80

FROM microsoft/aspnetcore-build:2.0 AS build
ENV DOTNET_CLI_TELEMETRY_OPTOUT 1
ENV ASPNETCORE_URLS "http://*:80"
WORKDIR /src
COPY *.sln ./
COPY Gpio/Gpio.csproj Gpio/
RUN dotnet restore
COPY . .
WORKDIR /src/Gpio
RUN dotnet build -c Release -r linux-arm -o /app

FROM build AS publish
RUN dotnet publish -c Release -r linux-arm -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Gpio.dll"]
