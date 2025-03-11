// #exampleModalLabel
// 사용자 모달에 정보 넣기
// 일단 자리에 설정된 아이디로 정보를 가져옴("userInfo_(사용자 아이디)")
$(function () {
  $("a[id^=userInfo_]").each((idx, item) => {
    var id = $(item).attr("id");
    id = id.substring("userInfo_".length, id.length);
    $(item).children().next().find("h3").text(id);

    $(item)
      .children(0)
      .attr("src", "../assets/images/profile/default_profile.png");

    $.ajax({
      url: "/touro/getprofileImg",
      type: "POST",
      data: { user_id: id },
      success: function (respons) {
        if (respons != "") {
          $(item)
            .children(0)
            .attr("src", "../assets/images/profile/" + respons);
        }
      },
      error: function (err) {
        console.log(err);
      },
    });
  });

  $("a[id^=userInfo_]").on("click", function (event) {
    var id = event.currentTarget.id;
    id = id.substring("userInfo_".length, id.length);
    console.log(id);

    $.ajax({
      url: "/touro/userInfo",
      type: "post",
      dataType: "json",
      data: { user_id: id },
      success: function (result) {
        console.log(result);
        $("#user_email").text(result.user_email);
        $("#user_id").text(result.user_id);
        $("#user_prefer_loc1").text(locCate(result.user_prefer_loc1));
        $("#user_prefer_loc2").text(locCate(result.user_prefer_loc2));
        $("#user_prefer_loc3").text(locCate(result.user_prefer_loc3));
        $("#user_prefer_type1").text(result.user_prefer_type1);
        $("#user_prefer_type2").text(result.user_prefer_type2);
        $("#user_prefer_type3").text(result.user_prefer_type3);
        $("#user_age").text(result.user_age[0] + "0대");
      },
      error: function (err) {
        console.log(err);
      },
    });
    $.ajax({
      url: "/touro/getprofileImg",
      type: "POST",
      data: { user_id: id },
      success: function (respons) {
        if (respons != null && respons != "") {
          $("#modalProfileImg").attr(
            "src",
            "../assets/images/profile/" + respons
          );
        } else {
          $("#modalProfileImg").attr(
            "src",
            "../assets/images/profile/default_profile.png"
          );
        }
      },
      error: function (err) {
        console.log(err);
      },
    });
  });

  // user_prefer_loc1, 2, 3 하고 지역 카테고리로 구분하는 부문에서 막혀 임시로 이렇게 처리함
  function locCate(locCode) {
    switch (locCode) {
      case "1.0":
        return "서울";
        break;
      case "2.0":
        return "인천";
        break;
      case "3.0":
        return "대전";
        break;
      case "31.0":
        return "경기도";
        break;
      case "32.0":
        return "강원도";
        break;
      case "33.0":
        return "충청북도";
        break;
      case "34.0":
        return "충청남도";
        break;
      case "35.0":
        return "경상북도";
        break;
      case "36.0":
        return "경상남도";
        break;
      case "37.0":
        return "전라북도";
        break;
      case "38.0":
        return "전라남도";
        break;
      case "39.0":
        return "제주도";
        break;
      case "4.0":
        return "대구";
        break;
      case "5.0":
        return "광주";
        break;
      case "6.0":
        return "부산";
        break;
      case "7.0":
        return "울산";
        break;
      default:
        return "세종특별자치시";
        break;
    }
  }
});
