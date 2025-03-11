$(() => {
  var tour_longi = $("#tour_lati").val();  
  var tour_lati = $("#tour_longi").val();  
  var apiKey = "daefbffde7a5da070ca59371148955cd"  

  var apiURI =
    "http://api.openweathermap.org/data/2.5/forecast?lat=" +
    tour_lati +
    "&lon=" +
    tour_longi +
    "&appid=" +
    apiKey;


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

  //console.log(apiURI);
  // console.log(tour_lati);
  // console.log(tour_longi);
    $.ajax({
      url: apiURI,
      dataType: "json",
      type: "GET",
      async:"false",
      success: function (resp) {
        console.log(resp);

        // 시간 1 (날짜) 
        var $date1 = (resp.list[2].dt_txt).substr(0,10);
        // 온도1
        var $Temp1 = Math.floor(resp.list[2].main.temp - 273.15)+' °C';
        // 날씨1
        var $Weather1 =(resp.list[2].weather[0].main) ;
        // 아이콘 날씨1
        var $Icon1 = (resp.list[2].weather[0].icon).substr(0,2);


        // 시간 날씨 2
        var $date2 = (resp.list[10].dt_txt).substr(0,10);
        // 온도2
        var $Temp2 = Math.floor(resp.list[10].main.temp - 273.15)+' °C';
        // 날씨2
        var $Weather2 =(resp.list[10].weather[0].main) ;
        // 아이콘 날씨2
        var $Icon2 = (resp.list[10].weather[0].icon).substr(0,2)        

        // 시간 날씨 3
        var $date3 = (resp.list[18].dt_txt).substr(0,10);
        // 온도3
        var $Temp3 = Math.floor(resp.list[18].main.temp - 273.15)+' °C';
        // 날씨3
        var $Weather3 =(resp.list[18].weather[0].main) ;
        // 아이콘 날씨3
        var $Icon3 = (resp.list[18].weather[0].icon).substr(0,2)

        // 시간 날씨 4
        var $date4 = (resp.list[26].dt_txt).substr(0,10);
        // 온도4
        var $Temp4 = Math.floor(resp.list[26].main.temp - 273.15)+' °C';
        // 날씨4
        var $Weather4 =(resp.list[26].weather[0].main) ;
        // 아이콘 날씨4
        var $Icon4 = (resp.list[26].weather[0].icon).substr(0,2)
        console.log($date1,"//",$Temp1,"//",$Weather1,"//",$Icon1);
        console.log($date2,"//",$Temp2,"//",$Weather2,"//",$Icon2 );
        console.log($date3,"//",$Temp3,"//",$Weather3,"//",$Icon3 );
        console.log($date4,"//",$Temp4,"//",$Weather4,"//",$Icon4 );
        
        // 1번 day
        $('#one_weather').append('<h5>'+$date1+
        '</h5>'
        +'<i class="'
        + weatherIcon[$Icon1] 
        + ' fa-5x" style="height : 95px; width : 45px;"></i>'
        +'<h6>'+$Temp1+'</h6>') ;

        // 2번 day
        $('#two_weather').append('<h5>'+$date2+
        '</h5>'
        +'<i class="'
        + weatherIcon[$Icon2] 
        + ' fa-5x" style="height : 95px; width : 45px;"></i>'
        +'<h6>'+$Temp2+'</h6>') ;

        // 3번 day
        $('#three_weather').append('<h5>'+$date3+
        '</h5>'
        +'<i class="'
        + weatherIcon[$Icon3] 
        + ' fa-5x" style="height : 95px; width : 45px;"></i>'
        +'<h6>'+$Temp3+'</h6>') ;
        
        // 4번 day
        $('#four_weather').append('<h5>'+$date4+
        '</h5>'
        +'<i class="'
        + weatherIcon[$Icon4] 
        + ' fa-5x" style="height : 95px; width : 45px;"></i>'
        +'<h6>'+$Temp4+'</h6>') ;
        


      },
    });


    var container = document.getElementById('location'); // 지도를 담을 영역의 DOM 레퍼런스
    var tabs = document.querySelectorAll('.nav-link');
    
    // tab의 위치가 아이디가 location이 아닐 경우 숨기기 코드
    tabs.forEach(function(tab) {
      tab.addEventListener('click', function() {
        if (tab.getAttribute('href') === '#location') {
          // 여기에 지도 생성 및 마커 설정 코드 추가
          container.style.display = 'block';
          var options = {
            center: new kakao.maps.LatLng(tour_lati, tour_longi),
            level: 6
          };
          
          var map = new kakao.maps.Map(container, options); // 지도 생성 및 객체 리턴

          // 마커가 표시될 위치입니다 
          var markerPosition  = new kakao.maps.LatLng(tour_lati, tour_longi); 

          // 마커를 생성합니다
          var marker = new kakao.maps.Marker({
            position: markerPosition
          });

          marker.setMap(map);
              } 
          else {
                container.style.display = 'none';
        }
      });
    });
    // 지도 생성할 때에는 화면에 표시되어야 함
    
    
    // 나중에 지도 객체를 참조하려면 아래처럼 사용
    //map.relayout();
    



});
