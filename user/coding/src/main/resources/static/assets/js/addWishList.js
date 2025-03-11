$(() => {
  // 찜버튼들 찾아서 각 버튼마다 동작 작업
  $("a[data-original-title=Add_to_Wishlist]").each(function (idx, item) {
    // 여행지 값, 사용자 정보 가져오기
    var num = $(item).attr("title");
    var id = $("#loggedInUser").val();

    // 찜 기록 확인 - 있으면 하트 체크 - 없다면 넘김
    ckWishList(item, num, id);

    // 찜버튼 누를 때 동작
    $(item).on("click", (e) => {
      e.preventDefault();

      var ck = "0";
      var icon = $(this).children();

      // 찜 상태 구분으로 중복 찜처리 방지
      if (id != null && id != "") {
        if (icon.attr("class") != "fas fa-heart") {
          $.ajax({
            url: "/touro/addWishList",
            type: "post",
            dataType: "json",
            data: { user_id: id, tour_num: num },
            success: function (result) {
              ck = result;
            },
            error: function (err) {
              console.log(err);
            },
          });
          $(icon).attr("class", "fas fa-heart").css("color", "#ff0000");
        } else {
            $.ajax({
              type:'post',
              data : {tour_num : num, user_id : id},
              url : "/touro/deleteWishList",
              success : function (result) {
                if(result == "ok") {
                  $(icon).attr("class", "far fa-heart").css("color", "#ffffff");
                }
              },
              error : function (err) {
                console.log(err)
              }
            }) // end ajax
          
        }
      } else if (id == null || id == "")
        swal("", "로그인이 필요한 기능입니다.", "info");
        // alert("로그인이 필요한 기능입니다.");
    });
  });
});

// 찜 확인
function ckWishList(item, num, id) {
  $.ajax({
    url: "/touro/ckWishList",
    type: "post",
    dataType: "json",
    data: { user_id: id, tour_num: num },
    success: function (result) {
      if (result == "1") {
        $(item)
          .children()
          .attr("class", "fas fa-heart")
          .css("color", "#ff0000");
      }
    },
    error: function (err) {
      console.log(err);
    }
  });
}
