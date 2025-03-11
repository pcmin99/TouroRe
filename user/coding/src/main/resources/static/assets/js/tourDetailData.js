$(() => {
  // 여행지 번호
  var tour_num = $("#tour_num").val();

  // 여행지 위치
  var tour_lati = $("#tour_lati").val();
  var tour_longi = $("#tour_longi").val();

  var cate = $("#tour_cate_code").val();

  var id = $("#loggedInUser").val();

  //console.log(tour_num + " / " + tour_lati + " / " + tour_longi);
  // 해당 여행지 상세 정보
  getTourData(tour_num, cate);
  // 이미지 API
  getTourGallery(tour_num);
  // 주변 여행지 API
  getTourAccommodations(tour_lati, tour_longi, cate);
  /*
  var inq = $("#tour-q")
    .children("div .modal-footer dashboard-section")
    .find("button .btn-solid");
  */
  // 여행지 문의 작성
  $(document).on("click", "#btnInquiry", (e) => {
    e.preventDefault();
    var inquiryForm = $("#inquiry").serialize();
    var ck = "0";
    var icon = $(this).children();
    console.log(icon.attr("class"));

    // 로그인 상태 구분
    if (id != null && id != "") {
      // 문의 작성 여부 확인용 조건
      if (ck != 1) {
        // alert("문의 작성");
        $.ajax({
          url: "/touro/inquiry",
          type: "post",
          dataType: "json",
          data: inquiryForm,
          success: function (result) {
            ck = result;
          },
          error: function (err) {
            console.log(err);
          },
        });
        $(icon).attr("class", "fas fa-heart").css("color", "#ff0000");
      } else {
        swal("", "이미 문의 내역이 존재하는 여행지입니다.", "error");
        // alert("이미 문의 내역이 존재하는 여행지입니다.");
      }
    } else if (id == null || id == "") alert("로그인이 필요합니다.");

    $("button[data-bs-dismiss=modal]").trigger("click");
  });
});

// 위치에 따른 주변 여행지 API 데이터
const getTourAccommodations = (tour_lati, tour_longi, cate) => {
  var ids = [
    $("div #accommod_tour1"),
    $("div #accommod_tour2"),
    $("div #accommod_tour3"),
    $("div #accommod_tour4"),
    $("div #accommod_tour5"),
    $("div #accommod_tour6"),
  ];

  var count = 0;

  if (cate == "12") {
    var apiURI =
      "https://apis.data.go.kr/B551011/KorService1/locationBasedList1?numOfRows=3&pageNo=1&MobileOS=ETC&MobileApp=Touro&_type=json&arrange=O" +
      "&contentTypeId=" +
      cate +
      "&mapX=" +
      tour_lati +
      "&mapY=" +
      tour_longi +
      "&radius=20000" +
      "&serviceKey=aRoMlzYVu3EFwc8zi7gclb8VDPOjNqr0m6BfcLcXL3gebBiPZ4mXPM4XhtOboghDiVIOTzO4UDuJB4Lmy3jk5g%3D%3D";

    $.ajax({
      url: apiURI,
      dataType: "json",
      type: "GET",
      async: "false",
      success: function (result) {
        var locs = result.response.body.items.item;
        locs.forEach((loc) => {
          if (loc.dist != 0) {
            $(ids[count])
              .children("a")
              .prop("href", "/touro/" + loc.contentid);
            if (loc.firstimage != "") {
              $(ids[count]).find("a img").prop("src", loc.firstimage);
            }
            $(ids[count]).children(".content-inner").text(loc.title);
            $(ids[count]).next().text("관광지");
            count = count + 1;
          }
        });
      },
      error(e) {
        console.log(e);
      },
    });
  } else {
    var apiURI =
      "https://apis.data.go.kr/B551011/KorService1/locationBasedList1?numOfRows=2&pageNo=1&MobileOS=ETC&MobileApp=Touro&_type=json&arrange=O" +
      "&contentTypeId=12" +
      "&mapX=" +
      tour_lati +
      "&mapY=" +
      tour_longi +
      "&radius=20000" +
      "&serviceKey=aRoMlzYVu3EFwc8zi7gclb8VDPOjNqr0m6BfcLcXL3gebBiPZ4mXPM4XhtOboghDiVIOTzO4UDuJB4Lmy3jk5g%3D%3D";

    $.ajax({
      url: apiURI,
      dataType: "json",
      type: "GET",
      async: "false",
      success: function (result) {
        var locs = result.response.body.items.item;
        locs.forEach((loc) => {
          $(ids[count])
            .children("a")
            .prop("href", "/touro/" + loc.contentid);
          if (loc.firstimage != "") {
            $(ids[count]).find("a img").prop("src", loc.firstimage);
          }
          $(ids[count]).children(".content-inner").text(loc.title);
          $(ids[count]).next().text("관광지");
          count = count + 1;
        });
      },
      error(e) {
        console.log(e);
      },
    });
  }

  if (cate == "32") {
    var apiURI =
      "https://apis.data.go.kr/B551011/KorService1/locationBasedList1?numOfRows=3&pageNo=1&MobileOS=ETC&MobileApp=Touro&_type=json&arrange=O" +
      "&contentTypeId=" +
      cate +
      "&mapX=" +
      tour_lati +
      "&mapY=" +
      tour_longi +
      "&radius=20000" +
      "&serviceKey=aRoMlzYVu3EFwc8zi7gclb8VDPOjNqr0m6BfcLcXL3gebBiPZ4mXPM4XhtOboghDiVIOTzO4UDuJB4Lmy3jk5g%3D%3D";

    $.ajax({
      url: apiURI,
      dataType: "json",
      type: "GET",
      async: "false",
      success: function (result) {
        var locs = result.response.body.items.item;
        locs.forEach((loc) => {
          if (loc.dist != 0) {
            $(ids[count])
              .children("a")
              .prop("href", "/touro/" + loc.contentid);
            if (loc.firstimage != "") {
              $(ids[count]).find("a img").prop("src", loc.firstimage);
            }
            $(ids[count]).children(".content-inner").text(loc.title);
            $(ids[count]).next().text("숙박업");
            count = count + 1;
          }
          /** 
          $("div #tour_img1 a").prop("href", img.originimgurl);
          $("div #tour_img1 a img").prop("src", img.originimgurl);*/
        });
      },
      error(e) {
        console.log(e);
      },
    });
  } else {
    var apiURI =
      "https://apis.data.go.kr/B551011/KorService1/locationBasedList1?numOfRows=2&pageNo=1&MobileOS=ETC&MobileApp=Touro&_type=json&arrange=O" +
      "&contentTypeId=32" +
      "&mapX=" +
      tour_lati +
      "&mapY=" +
      tour_longi +
      "&radius=20000" +
      "&serviceKey=aRoMlzYVu3EFwc8zi7gclb8VDPOjNqr0m6BfcLcXL3gebBiPZ4mXPM4XhtOboghDiVIOTzO4UDuJB4Lmy3jk5g%3D%3D";

    $.ajax({
      url: apiURI,
      dataType: "json",
      type: "GET",
      async: "false",
      success: function (result) {
        var locs = result.response.body.items.item;
        locs.forEach((loc) => {
          $(ids[count])
            .children("a")
            .prop("href", "/touro/" + loc.contentid);
          if (loc.firstimage != "") {
            $(ids[count]).find("a img").prop("src", loc.firstimage);
          }
          $(ids[count]).children(".content-inner").text(loc.title);
          $(ids[count]).next().text("숙박업");
          count = count + 1;
        });
      },
      error(e) {
        console.log(e);
      },
    });
  }

  if (cate == "39") {
    var apiURI =
      "https://apis.data.go.kr/B551011/KorService1/locationBasedList1?numOfRows=3&pageNo=1&MobileOS=ETC&MobileApp=Touro&_type=json&arrange=O" +
      "&contentTypeId=" +
      cate +
      "&mapX=" +
      tour_lati +
      "&mapY=" +
      tour_longi +
      "&radius=20000" +
      "&serviceKey=aRoMlzYVu3EFwc8zi7gclb8VDPOjNqr0m6BfcLcXL3gebBiPZ4mXPM4XhtOboghDiVIOTzO4UDuJB4Lmy3jk5g%3D%3D";

    $.ajax({
      url: apiURI,
      dataType: "json",
      type: "GET",
      async: "false",
      success: function (result) {
        var locs = result.response.body.items.item;
        locs.forEach((loc) => {
          if (loc.dist != 0) {
            $(ids[count])
              .children("a")
              .prop("href", "/touro/" + loc.contentid);
            if (loc.firstimage != "") {
              $(ids[count]).find("a img").prop("src", loc.firstimage);
            }
            $(ids[count]).children(".content-inner").text(loc.title);
            $(ids[count]).next().text("음식점");
            count = count + 1;
          }
          /** 
          $("div #tour_img1 a").prop("href", img.originimgurl);
          $("div #tour_img1 a img").prop("src", img.originimgurl);*/
        });
      },
      error(e) {
        console.log(e);
      },
    });
  } else {
    var apiURI =
      "https://apis.data.go.kr/B551011/KorService1/locationBasedList1?numOfRows=2&pageNo=1&MobileOS=ETC&MobileApp=Touro&_type=json&arrange=O" +
      "&contentTypeId=39" +
      "&mapX=" +
      tour_lati +
      "&mapY=" +
      tour_longi +
      "&radius=20000" +
      "&serviceKey=aRoMlzYVu3EFwc8zi7gclb8VDPOjNqr0m6BfcLcXL3gebBiPZ4mXPM4XhtOboghDiVIOTzO4UDuJB4Lmy3jk5g%3D%3D";

    $.ajax({
      url: apiURI,
      dataType: "json",
      type: "GET",
      async: "false",
      success: function (result) {
        var locs = result.response.body.items.item;
        locs.forEach((loc) => {
          $(ids[count])
            .children("a")
            .prop("href", "/touro/" + loc.contentid);
          if (loc.firstimage != "") {
            $(ids[count]).find("a img").prop("src", loc.firstimage);
          }
          $(ids[count]).children(".content-inner").text(loc.title);
          $(ids[count]).next().text("음식점");
          count = count + 1;
        });
      },
      error(e) {
        console.log(e);
      },
    });
  }
};

// 여행지 번호에 따른 여행지 API 이미지
const getTourGallery = (tour_num) => {
  var apiURI =
    "https://apis.data.go.kr/B551011/KorService1/detailImage1?MobileOS=ETC&MobileApp=%20Touro&_type=json" +
    "&contentId=" +
    tour_num +
    "&subImageYN=Y&numOfRows=6&pageNo=1&serviceKey=diSO6Q1Dc2ausHMWxuu9mhBEQyHMJv4oUAFlWSytUCA9H9LU1sAfXLD6bApMVI91ZCgI86BJreDfAFF1aGa70w%3D%3D";

  var ids = [
    $("div #tour_img1 a"),
    $("div #tour_img2 a"),
    $("div #tour_img3 a"),
    $("div #tour_img4 a"),
    $("div #tour_img5 a"),
    $("div #tour_img6 a"),
  ];

  var count = 0;
  $.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function (result) {
      if (result.response.body.items == "") {
        $("div #gallery div").hide();
        $("div #gallery").append("<h2>사진이 없습니다.</h2>");
      } else {
        var imgs = result.response.body.items.item;
        imgs.forEach((img) => {
          $(ids[count]).prop("href", img.originimgurl);
          $(ids[count]).children("img").prop("src", img.originimgurl);
          count = count + 1;
        });
        if (count != 6) {
          for (; count < 6; count++) {
            $(ids[count]).hide();
          }
        }
      }
    },
    error(e) {
      console.log(e);
    },
  });
};

// 해당 여행지 상세 정보
const getTourData = (tour_num, cate) => {
  var apiURI =
    "https://apis.data.go.kr/B551011/KorService1/detailIntro1?MobileOS=ETC&MobileApp=Touro&_type=json" +
    "&contentId=" +
    tour_num +
    "&contentTypeId=" +
    cate +
    "&serviceKey=diSO6Q1Dc2ausHMWxuu9mhBEQyHMJv4oUAFlWSytUCA9H9LU1sAfXLD6bApMVI91ZCgI86BJreDfAFF1aGa70w%3D%3D";

  //console.log(apiURI);
  $.ajax({
    url: apiURI,
    dataType: "json",
    type: "GET",
    async: "false",
    success: function (result) {
      var datas = result.response.body.items.item[0];
      if (datas.opendate != null && datas.opendate != "") {
        $("#info_head_body").append("<p>" + datas.opendate + "</p>");
      }
      if (datas.opentimefood != null && datas.opentimefood != "") {
        $("#info_head_body").append(
          "<p>영업 시간 - " + datas.opentimefood + "</p>"
        );
      }
      if (datas.restdatefood != null && datas.restdatefood != "") {
        $("#info_head_body").append(
          "<p>휴무일- " + datas.restdatefood + "</p>"
        );
      }
      if (datas.usetime != null && datas.usetime != "") {
        $("#info_head_body").append("<p>" + datas.usetime + "</p>");
      }
      if (datas.checkintime != null && datas.checkintime != "") {
        $("#info_head_body").append(
          "<p>입실 시간 - " + datas.checkintime + "</p>"
        );
      }
      if (datas.checkouttime != null && datas.checkouttime != "") {
        $("#info_head_body").append(
          "<p>퇴실 시간 - " + datas.checkouttime + "</p>"
        );
      }
      if (datas.parking != null && datas.parking != "") {
        $("#info_head_body").append("<p>주차 공간 - " + datas.parking + "</p>");
      }
      if (datas.parkinglodging != null && datas.parkinglodging != "") {
        $("#info_head_body").append(
          "<p>주차 공간 - " + datas.parkinglodging + "</p>"
        );
      }
      if (datas.subfacility != null && datas.subfacility != "") {
        $("#info_head_body").append("<p>시설 - " + datas.subfacility + "</p>");
      }
      if (datas.infocenter != null && datas.infocenter != "") {
        $("#info_head_body").append("<p>Tel - " + datas.infocenter + "</p>");
      }
      if (datas.infocenterlodging != null && datas.infocenterlodging != "") {
        $("#info_head_body").append(
          "<p>Tel - " + datas.infocenterlodging + "</p>"
        );
      }
      if (datas.firstmenu != null && datas.firstmenu != "") {
        $("#info_head_body").append(
          "<p>대표메뉴 - " + datas.firstmenu + "</p>"
        );
      }
      if (datas.treatmenu != null && datas.treatmenu != "") {
        $("#info_head_body").append("<p>메뉴 - " + datas.treatmenu + "</p>");
      }
      if (datas.parkingfood != null && datas.parkingfood != "") {
        $("#info_head_body").append(
          "<p>주차 공간 - " + datas.parkingfood + "</p>"
        );
      }
      if (datas.infocenterfood != null && datas.infocenterfood != "") {
        $("#info_head_body").append(
          "<p>Tel - " + datas.infocenterfood + "</p>"
        );
      }
    },
    error(e) {
      console.log(e);
    },
  });
};
