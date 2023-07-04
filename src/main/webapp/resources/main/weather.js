function loadJSON(callback) {
        var url = "https://api.openweathermap.org/data/2.5/weather?lat=35.1028&lon=129.0403&appid=9de8464e8f8d2cdaf51a2c8a86ec28f7";
        var request = new XMLHttpRequest();
        request.overrideMimeType("application/json");
        request.open('GET', url, true);
        
        request.onreadystatechange = function() {
            if (request.readyState === 4 && request.status === 200) {
                var jsonData = JSON.parse(request.responseText);
                callback(jsonData);
            }
        };
        request.send(null);
    }
    
    function parseWeather(jsonData) {
    	var weatherMain = jsonData["weather"][0]["main"];
        var weatherTemp = (jsonData["main"]["temp"] - 273.15).toFixed(1);
        var weatherLocation = jsonData["name"] + ", " + jsonData["sys"]["country"]; // 위치 정보 추가
        var weatherDescription = jsonData["weather"][0]["description"];
        var weatherHumidity = jsonData["main"]["humidity"];
        var weatherWindSpeed = jsonData["wind"]["speed"];
    
        document.getElementById("todaysTemp").innerHTML = weatherTemp + "℃";
        document.getElementById("todaysLocation").innerHTML = weatherLocation; // 위치 정보 표시
        document.getElementById("todaysDescription").innerHTML = "날씨: " + weatherDescription;
        document.getElementById("todaysHumidity").innerHTML = "습도: " + weatherHumidity + "%";
        document.getElementById("todaysWindSpeed").innerHTML = "풍속: " + weatherWindSpeed + " m/s";
    
    
        var iconClass = "mdi mdi-weather-cloudy"; // 기본값: 흐림
        if (weatherMain === "Clear") {
            iconClass = "mdi mdi-weather-sunny"; // 맑음
            document.getElementById("weatherCard").style.backgroundImage = "url(${pageContext.request.contextPath}/resources/images/dashboard/clear.png)"; // 맑은 날씨 배경 이미지
        } else if (weatherMain === "Rain") {
            iconClass = "mdi mdi-weather-pouring"; // 비
            document.getElementById("weatherCard").style.backgroundImage = "url(${pageContext.request.contextPath}/resources/images/dashboard/rain.png)"; // 비 오는 날씨 배경 이미지
        } else if (weatherMain === "Snow") {
            iconClass = "mdi mdi-weather-snowy"; // 눈
            document.getElementById("weatherCard").style.backgroundImage = "url(${pageContext.request.contextPath}/resources/images/dashboard/snow.png)"; // 눈 오는 날씨 배경 이미지
        } else {
            document.getElementById("weatherCard").style.backgroundImage = "url(${pageContext.request.contextPath}/resources/images/dashboard/clear.png)"; // 기본 배경 이미지
        }
    
        document.getElementById("todaysWeather").className = iconClass;
    }
    
    window.onload = function() {
        loadJSON(parseWeather);
    };