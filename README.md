# pi-docker-gpio
Raspberry Pi GPIO project - develop&amp;build x64 then deploy linux-arm

----------------------
ASPNET.WEBAPI.RPI.GPIO

- GPIO test is based on Carlos Mendible post: [Toggle Raspberry Pi GPIO Pins with ASP.NET Core 2.0](https://carlos.mendible.com/2017/09/01/toggle-raspberry-pi-gpio-pins-with-asp-net-core-20/ "Toggle Raspberry Pi GPIO Pins with ASP.NET Core 2.0")

- ASP.NET Core 2.0 for Raspberry Pi: [FROM microsoft/dotnet:2.0-runtime-deps-stretch-arm32v7](https://github.com/dotnet/dotnet-docker/blob/master/2.0/runtime/stretch/arm32v7/Dockerfile)

- Base container available at 
[josemottalopes/gpio-base](https://hub.docker.com/r/josemottalopes/gpio-base/)

Enjoy!

Deployment Workflow
----------------------
**x64: Development**

cd ".\aspnet.webapi.rpi.gpio"

**x64: Linux-Arm Build**

docker-compose -f docker-compose.ci.build.yml build  
docker build -t josemottalopes/gpio:latest .  
docker push josemottalopes/gpio:latest

**arm: RaspberryPi Deployment:**

export ASPNETCORE_URLS="http://*:5000"  
docker run --privileged -p 5000:5000 josemottalopes/gpio

**any: CLIENT Test:**

curl -H "Content-Type: application/json" -d 'true' http://lumi:5000/api/blinky

curl -H "Content-Type: application/json" -d 'false' http://lumi:5000/api/blinky