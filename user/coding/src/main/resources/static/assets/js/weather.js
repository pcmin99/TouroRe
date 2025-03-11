$(function(){
  // 날씨 api - fontawesome 아이콘
  var weatherIcon = {
    '01' : 'fas fa-sun',
    '02' : 'fas fa-cloud-sun',
    '03' : 'fas fa-cloud',
    '04' : 'fas fa-cloud-meatball',
    '09' : 'fas fa-cloud-sun-rain',
    '10' : 'fas fa-cloud-showers-heavy',
    '11' : 'fas fa-poo-storm',
    '13' : 'far fa-snowflake',
    '50' : 'fas fa-smog'
  };
  
  var city1;  
  var city2;
  var city3;

  // 로그인한 사용자의 아이디를 가져옴
  var user_id = $('#loggedInUser').val();
  console.log(user_id);

  // 사용자가 설정한 선호 지역 정보를 가져옴
  $.ajax({
    type:'GET',
    data: {user_id : user_id},
    url:'preferLoc',
    success: function(res) {

      // 사용자가 설정한 선호 지역 정보를 변수에 저장
      city1 = res.user_prefer_loc1
      city2 = res.user_prefer_loc2
      city3 = res.user_prefer_loc3
      console.log(res.user_prefer_loc1)

      // 도시명을 영어로 변환
      city1 = convertCity(city1)
      city2 = convertCity(city2)
      city3 = convertCity(city3)
      
      // 각 도시에 대한 날씨 정보를 가져와 화면에 표시
      getWeather1(city1)
      getWeather2(city2)
      getWeather3(city3)
      
    },
    error: function(err) {
      console.log(err)
    }

  })

  // 도시명을 영어로 변환하는 함수
  const convertCity = (city) => {
    switch (city) {
      case "제주도":
        city = "Jeju city"
        return city;
      case "서울":
        city = "Seoul"
        return city;
      case "인천":
        city = "Incheon"
        return city;
      case "대전":
        city = "Daejeon"
        return city;
      case "경기도":
        city = "Gyeonggi-do"
        return city;
      case "강원특별자치도":
        city = "Gangneung"
        return city;
      case "충청북도":
        city = "Chungcheongbuk-do"
        return city;
      case "충청남도":
        city = "Chungcheongnam-do"
        return city;
      case "경상북도":
        city = "Gyeongsangbuk-do"
        return city;
      case "경상남도":
        city = "Gyeongsangnam-do"
        return city;
      case "전라북도":
        city = "Jeollabuk-do"
        return city;
      case "전라남도":
        city = "Jeollanam-do"
        return city;
      case "대구":
        city = "Daegu"
        return city;
      case "광주":
        city = "Gwangju"
        return city;
      case "부산":
        city = "Busan"
        return city;
      case "울산":
        city = "Ulsan"
        return city;
      case "세종특별자치시":
        city = "Sejong"
        return city;
    }
  } 

  // 각 도시에 대한 날씨 정보를 가져와 화면에 표시하는 함수
  const getWeather1 = (city) => {
    var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"0846679e999ecbe4f288dc161ac8272a";
    console.log(apiURI)

    // 가져온 날씨 정보를 화면에 표시
      $.ajax({
        url: apiURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(resp) {

            var $Icon = (resp.weather[0].icon).substr(0,2);
            var $weather_description = resp.weather[0].main;
            var $Temp = Math.floor(resp.main.temp- 273.15) + 'º';
            var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;' + resp.main.humidity+ ' %';
            var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;' +resp.wind.speed + ' m/s';
            var $city = resp.name;
            var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;' + resp.clouds.all +"%";
            var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_min- 273.15) + 'º';
            var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_max- 273.15) + 'º';
            

            // 가져온 날씨 정보를 화면에 표시
            $('.weather_icon').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 150px; width : 150px;"></i>');
            $('.weather_description').prepend($weather_description);
            $('.current_temp').prepend($Temp);
            $('.humidity').prepend($humidity);
            $('.wind').prepend($wind);
            $('.city').append($city);
            $('.cloud').append($cloud);
            $('.temp_min').append($temp_min);
            $('.temp_max').append($temp_max);               
        }
      })
  }

  const getWeather2 = (city) => {
    var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"0846679e999ecbe4f288dc161ac8272a";
    console.log(apiURI)
      $.ajax({
        url: apiURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(resp) {

            var $Icon = (resp.weather[0].icon).substr(0,2);
            var $weather_description = resp.weather[0].main;
            var $Temp = Math.floor(resp.main.temp- 273.15) + 'º';
            var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;' + resp.main.humidity+ ' %';
            var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;' +resp.wind.speed + ' m/s';
            var $city = resp.name;
            var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;' + resp.clouds.all +"%";
            var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_min- 273.15) + 'º';
            var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_max- 273.15) + 'º';
            

            $('.weather_icon1').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 150px; width : 150px;"></i>');
            $('.weather_description1').prepend($weather_description);
            $('.current_temp1').prepend($Temp);
            $('.humidity1').prepend($humidity);
            $('.wind1').prepend($wind);
            $('.city1').append($city);
            $('.cloud1').append($cloud);
            $('.temp_min1').append($temp_min);
            $('.temp_max1').append($temp_max);               
        }
      })
  }

   // 각 도시에 대한 날씨 정보를 가져와 화면에 표시하는 함수
  const getWeather3 = (city) => {
    
    // OpenWeatherMap API를 통해 날씨 정보를 가져옴
    var apiURI = "http://api.openweathermap.org/data/2.5/weather?q="+city+"&appid="+"0846679e999ecbe4f288dc161ac8272a";
    console.log(apiURI)

    // 가져온 날씨 정보를 화면에 표시
      $.ajax({
        url: apiURI,
        dataType: "json",
        type: "GET",
        async: "false",
        success: function(resp) {

            var $Icon = (resp.weather[0].icon).substr(0,2);
            var $weather_description = resp.weather[0].main;
            var $Temp = Math.floor(resp.main.temp- 273.15) + 'º';
            var $humidity = '습도&nbsp;&nbsp;&nbsp;&nbsp;' + resp.main.humidity+ ' %';
            var $wind = '바람&nbsp;&nbsp;&nbsp;&nbsp;' +resp.wind.speed + ' m/s';
            var $city = resp.name;
            var $cloud = '구름&nbsp;&nbsp;&nbsp;&nbsp;' + resp.clouds.all +"%";
            var $temp_min = '최저 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_min- 273.15) + 'º';
            var $temp_max = '최고 온도&nbsp;&nbsp;&nbsp;&nbsp;' + Math.floor(resp.main.temp_max- 273.15) + 'º';
            

            // 가져온 날씨 정보를 화면에 표시
            $('.weather_icon2').append('<i class="' + weatherIcon[$Icon] +' fa-5x" style="height : 150px; width : 150px;"></i>');
            $('.weather_description2').prepend($weather_description);
            $('.current_temp2').prepend($Temp);
            $('.humidity2').prepend($humidity);
            $('.wind2').prepend($wind);
            $('.city2').append($city);
            $('.cloud2').append($cloud);
            $('.temp_min2').append($temp_min);
            $('.temp_max2').append($temp_max);               
        }
      })
  }

})
