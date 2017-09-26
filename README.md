# pi-docker-gpio
Raspberry Pi GPIO project - develop&amp;build x64 deploy linux-arm

----------------------
ASPNET.WEBAPI.RPI.GPIO

GPIO test is based on Carlos Mendible post at [https://carlos.mendible.com/2017/09/01/toggle-raspberry-pi-gpio-pins-with-asp-net-core-20/](https://carlos.mendible.com/2017/09/01/toggle-raspberry-pi-gpio-pins-with-asp-net-core-20/ "Toggle Raspberry Pi GPIO Pins with ASP.NET Core 2.0")

Enjoy!

Deployment Workflow
----------------------
**x64 Development:**

cd "C:\_git\Api\aspnet.webapi.rpi.gpio"

**Linux-Arm Build:**

docker-compose -f docker-compose.ci.build.yml build
docker build -t josemottalopes/gpio:latest .
docker push josemottalopes/gpio:latest

**RaspberryPI Deployment:**

export ASPNETCORE_URLS="http://*:5000"
docker run --privileged -p 5000:5000 josemottalopes/gpio

**CLIENT Test:**

curl -H "Content-Type: application/json" -d 'true' http://lumi:5000/api/blinky
