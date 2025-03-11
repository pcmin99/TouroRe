// 지역 조건 체크박스 선택값 저장
var LocArray = {};
// 별점 조건 체크박스 선택값 저장
var StarArray = {};

$("h6.collapse-block-title").attr("disabled", true);
$(() => {
  // 지역 코드 분류 체크 확인
  $("div[name=Loc_cates]").each((idx, items) => {
    // 누를시 false <-> true 처리
    $(items)
      .find("input[name=Loc]")
      .each((idx, item) => {
        LocArray[$(item).val()] = false;
        $(item).on("click", () => {
          if (LocArray[$(item).val()] == false) {
            LocArray[$(item).val()] = true;
          } else if (LocArray[$(item).val()] == true) {
            LocArray[$(item).val()] = false;
          }
        });
      });
  });
  // 별점 코드 분류 체크 확인
  $("input[name=star]").each((idx, item) => {
    StarArray[$(item).val()] = false;
    // 누를시 false <-> true 처리
    $(item).on("click", () => {
      if (StarArray[$(item).val()] == false) {
        StarArray[$(item).val()] = true;
      } else if (StarArray[$(item).val()] == true) {
        StarArray[$(item).val()] = false;
      }
      console.log(StarArray[$(item).val()]);
    });
  });
});

//이전 버튼 이벤트
//5개의 인자값을 가지고 이동
//무조건 이전페이지 범위의 가장 앞 페이지로 이동
function fn_prev(
  page,
  range,
  rangeSize,
  listSize,
  tour_cate_code,
  keyword,
  Locs,
  Star
) {
  var page = (range - 2) * rangeSize + 1;
  var range = range - 1;

  var url = "/touro/tour";
  url = url + "?page=" + page;
  url = url + "&range=" + range;
  url = url + "&listSize=" + listSize;
  url = url + "&tour_cate_code=" + tour_cate_code;
  url = url + "&keyword=" + keyword;
  url = url + "&Locs=" + Locs;
  url = url + "&Star=" + Star;
  location.href = url;
}

// 페이지 번호 클릭 동작
function fn_pagination(
  page,
  range,
  rangeSize,
  listSize,
  tour_cate_code,
  keyword,
  Locs,
  Star
) {
  var url = "/touro/tour";
  url = url + "?page=" + page;
  url = url + "&range=" + range;
  url = url + "&listSize=" + listSize;
  url = url + "&tour_cate_code=" + tour_cate_code;
  url = url + "&keyword=" + keyword;
  url = url + "&Locs=" + Locs;
  url = url + "&Star=" + Star;
  location.href = url;
}

//다음 버튼 이벤트
//다음 페이지 범위의 가장 앞 페이지로 이동
function fn_next(
  page,
  range,
  rangeSize,
  listSize,
  tour_cate_code,
  keyword,
  Locs,
  Star
) {
  var page = parseInt(range * rangeSize) + 1;
  var range = parseInt(range) + 1;
  var url = "/touro/tour";
  url = url + "?page=" + page;
  url = url + "&range=" + range;
  url = url + "&listSize=" + listSize;
  url = url + "&tour_cate_code=" + tour_cate_code;
  url = url + "&keyword=" + keyword;
  url = url + "&Locs=" + Locs;
  url = url + "&Star=" + Star;
  location.href = url;
}

// 저장된 값들로 검색
$(document).on("click", "#btnSearch", function (e) {
  e.preventDefault();
  var url = "/touro/tour";
  url = url + "?tour_cate_code=" + $("#tour_cate_code option:selected").val();
  url = url + "&keyword=" + $("#keyword").val() + "&Locs=";
  Object.keys(LocArray).forEach((key) => {
    if (LocArray[key] != false) {
      url = url + "" + key + "/";
    }
  });
  url = url + "&Star=";
  Object.keys(StarArray).forEach((key) => {
    if (StarArray[key] != false) {
      url = url + "" + key + "/";
    }
  });
  location.href = url;
});

// 검색 여행지 항목 설정
$(() => {
  $("select#tour_cate_code")
    .val($("input#tour_cate_code").val())
    .prop("selected", true);

  // 시간날때 선택 객체들도 설정되도록 하기
});
