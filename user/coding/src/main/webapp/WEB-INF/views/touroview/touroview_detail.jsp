<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <meta name="description" content="rica" />
      <meta name="keywords" content="rica" />
      <meta name="author" content="rica" />
      <link rel="icon" href="../assets/images/favicon.png" type="image/x-icon" />
      <title>여행을 더욱 특별하게, TOURO</title>

      <!--Google font-->
      <link
        href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&display=swap"
        rel="stylesheet" />
      <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

      <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet" />

      <!-- Icons -->
      <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css" />

      <!-- Animation -->
      <link rel="stylesheet" type="text/css" href="../assets/css/animate.css" />

      <!-- Date-time picker css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/datepicker.min.css" />

      <!-- magnific css -->
      <link rel="stylesheet" href="../assets/css/magnific-popup.css" />

      <!--Slick slider css-->
      <link rel="stylesheet" type="text/css" href="../assets/css/slick.css" />
      <link rel="stylesheet" type="text/css" href="../assets/css/slick-theme.css" />

      <!-- Bootstrap css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />

      <!-- Theme css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/color1.css" />

      <!-- sweetalert.js -->
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

      <style>
        #reviewBOX {
          display: none;
        }
      </style>

      <!-- 리뷰 달기 -->
      <script>
        $(function () {

          let stars = ''
          var review_div = $('#tour_review');
          var user_id = $('#sessionId').val();
          var touroview_num = $('#touroviewNum').val();
          var tour_num = $('#tourNum').val();
          console.log(tour_num)
          review_div.html('');
          // 초기 불러오기
          getReviewList();
          // 페이지의 모든 리소스가 로드 되었을 때.

          $('.dropdown-item').click(function (e) {
            e.preventDefault();

            var stars = $(this).data('stars');


            $('#tourReviewBtn').data('selectedStars', stars);


          }) // end 별점 등록

          // 리뷰 등록
          $('#tourReviewBtn').click((e, stars) => {
            e.preventDefault();
            console.log(user_id)
            if (user_id == " " || user_id == null) {
              console.log(1)
              swal("", "로그인이 필요한 기능입니다.", "info");
              //  alert("로그인 후 이용해주세요")
              window.location.href = '/user/login'; // 수정된 부분
            }
            else {
              var stars = $('#tourReviewBtn').data('selectedStars');
              var reviewText = $('.review_content').val();

              // 리뷰 등록 ajax
              $.ajax({
                type: 'post',
                url: '/touroview/touroviewReviewInsert',
                data: { touroview_review_content: reviewText, touroview_review_star: stars, user_id: user_id, touroview_num: touroview_num, tour_num: tour_num },
                success: function (result) {
                  review_div.html('');
                  getReviewList();
                  console.log("리뷰등록" + result);
                  $('.review_content').val(" ");



                },
                error: function (err) {
                  console.log("aaaaaaaaaaaa");
                  console.log(err)
                }
              }) // end ajax
            }

          }); // end 리뷰작성 클릭

          // 리뷰 전체 보이게 하기
          function getReviewList() {
            $.ajax({
              type: 'get',
              url: '/touroview/touroviewSelectReview',
              data: { touroview_num: touroview_num },
              dataType: 'json',
              contentType: "application/x-www-form-urlencoded; charset=UTF-8",
              success: function (result) {
                //  review_div.html('');
                // 별점 수에 따라 별 개수 
                function generateStars(starCount) {
                  let starsHtml = '';
                  for (let i = 0; i < 5; i++) {
                    if (i < starCount) {
                      starsHtml += '<i class="fas fa-star"></i>';
                    } else {
                      starsHtml += '<i class="far fa-star"></i>';
                    }
                  }
                  return starsHtml;
                }
                $(result).each(function () {
                  const ratingStars = generateStars(this.touroview_review_star);
                  console.log(this.touroview_review_content);

                  const html = `
                <div class="review-box row" id="reviewBOX">
                    <div class="col-2">
                      <a
                        data-bs-toggle="modal"
                        data-bs-target="#edit-profile"
                        href=""
                        ><img
                          src="../assets/images/profile/${'${this.img_real_name}'}"
                          class="img-fluid blur-up lazyload"
                          alt=""
                      /></a>
                    </div>

                    <div class="col-10">
                      <div class="rating">
                        ${'${ratingStars}'}
                      </div>
                      <h6>by ${'${this.user_id}'}, ${'${this.touroview_review_register_date}'}</h6>
                      <p>${'${this.touroview_review_content}'}</p>
                    </div>
                  </div>
                `
                  review_div.append(html);


                });
                // 별점에 대한 HTML을 생성하는 함수
                $(".review-box:lt(3)").css('display', 'flex'); // 초기갯수

                $("#moreReview").click(function (e) { // 클릭시 more
                  e.preventDefault();
                  $(".review-box:hidden").slice(0, 3).css('display', 'flex'); // 클릭시 more 갯수 지저정
                  if ($(".review-box:hidden").length == 0) { // 컨텐츠 남아있는지 확인
                    $("#moreReview").hide(); // 컨텐츠 없을시 alert 창 띄우기 
                  }
                });

              },
              error: function (err) {
                console.log(err);
              }

            }) // end ajax
          }


          // moreReview 클릭 시 5개씩 리뷰 보이게 하기
        }) // end script
      </script>
      <!-- 좋아요  -->
      <script>
        $(function () {

          const loggedInUserId = $("#sessionId").val();
          // 좋아요
          // var loggedInUserId = '<%= request.getSession().getAttribute("loggedInUser") != null ? ((UserVO)request.getSession().getAttribute("loggedInUser")).getUser_id() : null %>';
          // 좋아요 버튼들 찾아서 각 버튼마다 동작 작업
          $("a[data-original-title=Add_to_Wishlist]").each(function (idx, item) {
            // 여행지 값, 사용자 정보 가져오기
            var num = $(item).attr("title");
            console.log("num >>> ", num);
            var id = loggedInUserId;
            console.log("id >>> ", id);

            // 좋아요 기록 확인 - 있으면 하트 체크 - 없다면 넘김
            ckWishList(item, num, id);

            // 좋아요 누를 때 동작
            $(item).on("click", (e) => {
              e.preventDefault();

              var ck = "0";
              var icon = $(this).children();

              console.log("아이디딩이이이이 :" + id)
              // 좋아요 상태 구분으로 중복 찜처리 방지
              if (id != null && id != "") {
                if (icon.attr("class") != "fas fa-heart") {
                  $.ajax({
                    url: "/touroview/addWishList",
                    type: "post",
                    dataType: "json",
                    data: { user_id: id, touroview_num: num },
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
                    type: 'post',
                    data: { touroview_num: num, user_id: id },
                    url: "/touroview/deleteWishList",
                    success: function (result) {
                      if (result == "ok") {
                        $(icon).attr("class", "far fa-heart").css("color", "#000000");
                      }
                    },
                    error: function (err) {
                      console.log(err)
                    }
                  }) // end ajax

                }
              } else if (id == null || id == "") {
                swal("", "로그인이 필요한 기능입니다.", "info");
                // alert("로그인이 필요합니다.")
              };
            });
          });


          // 좋아요 확인
          function ckWishList(item, num, id) {
            $.ajax({
              url: "/touroview/ckWishList",
              type: "post",
              dataType: "json",
              data: { user_id: id, touroview_num: num },
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
              },
            });
          }

          // 수정 버튼





        }) // end script



      </script>


    </head>

    <body>
      <!-- 해더 (로고, 탭메뉴 등 설정) -->
      <%@ include file='../header/header.jsp' %>
        <!--  해더 끝 -->

        <!-- 세션 로그인 값 -->
        <input type="hidden" value="${sessionScope.loggedId}" id="sessionId" />
        <input type="hidden" value="${touroviewVO.touroview_num}" id="touroviewNum" />
        <input type="hidden" value="${tourVO.tour_num}" id="tourNum" />
        <input type="hidden" value="${touroviewVO.user_tel}" id="user_tel" />
        <input type="hidden" value="${touroviewVO.user_email}" id="user_email" />

        <!-- 각 게시물 이름 및 각 게시물 이미지  -->
        <section class="hotel-single-section parallax-img pt-0">
          <img src="../assets/images/inner-pages/breadcrumb2.jpg" class="bg-img bg-bottom img-fluid blur-up lazyload"
            alt="" />
          <div class="hotel-title-section">
            <div class="container">
              <div class="row">
                <div class="col-12">
                  <div class="hotel-name">
                    <div class="left-part">
                      <div class="top">
                        <h2>${touroviewVO.touroview_title}</h2>
                        <div class="share-buttons">
                          <a href="#" class="btn btn-solid" data-original-title="Add_to_Wishlist"
                            title="${touroviewVO.touroview_num}"><i class="far fa-heart"></i> 좋아요</a>
                        </div>
                      </div>
                    </div>
                    <div class="right-part">
                      <!-- 신고 버튼 -->
                      <input type="hidden" id="touroviewNum" value="${touroviewVO.touroview_num}">
                      <a onclick="reportPost();" href="#" class="btn btn-rounded btn-sm "
                        style="background-color: #fd6668;" id="reportbutton">신고</a>

                      <!-- 수정 버튼 -->
                      <c:if test="${sessionScope.loggedInUser.user_id eq touroviewVO.user_id}">
                        <a href="${pageContext.request.contextPath}/touroview/touroview_update_delete?touroview_num=${touroviewVO.touroview_num}&action=update"
                          class="btn btn-rounded btn-sm color1 updateBtn">수정</a>
                      </c:if>

                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- 각 게시물 이름 및 각 게시물 이미지  -->

        <!-- section start -->
        <section class="single-section xs-section bg-inner">
          <div class="container">
            <div class="row">
              <div class="col-xl-9 col-lg-8">
                <!-- 이미지만 보여주는 테이블-->
                <div class="image_section">
                  <div class="row">
                    <c:forEach items="${detailImg}" var="img" end="0">
                      <div class="col-sm-8">
                        <div class="slide-1 arrow-dark zoom-gallery ratio2_3">
                          <div>
                            <a href="../assets/images/touroviewImg/${img.img_real_name}">
                              <img src="../assets/images/touroviewImg/${img.img_real_name}"
                                class="img-fluid blur-up lazyload bg-img w-100" alt="" />
                              <!-- <h6 class="view-all">view all images</h6> -->
                            </a>
                          </div>
                        </div>
                      </div>
                    </c:forEach>

                    <div class="col-sm-4 d-none d-sm-block">
                      <div class="row">
                        <div class="col-12 ratio_59">
                          <c:forEach items="${detailImg}" var="img" begin="1" end="1">
                            <div class="slide-1 zoom-gallery no-arrow">
                              <div>
                                <a href="../assets/images/touroviewImg/${img.img_real_name}">
                                  <img src="../assets/images/touroviewImg/${img.img_real_name}"
                                    class="img-fluid blur-up lazyload bg-img w-100" alt="" />
                                  <!-- <h6 class="view-all">room images</h6> -->
                                </a>
                              </div>
                            </div>
                          </c:forEach>
                          <c:forEach items="${detailImg}" var="img" begin="2" end="2">
                            <div class="slide-1 zoom-gallery no-arrow m-cls">
                              <div>
                                <a href="../assets/images/touroviewImg/${img.img_real_name}">
                                  <img src="../assets/images/touroviewImg/${img.img_real_name}"
                                    class="img-fluid blur-up lazyload bg-img w-100" alt="" />
                                  <!-- <h6 class="view-all">poll images</h6> -->
                                </a>
                              </div>
                            </div>
                          </c:forEach>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="description-section">
                  <!-- 큰 제목들 -->
                  <div class="menu-top" id="searchBar">
                    <div class="container">
                      <ul class="nav">
                        <li><a class="" href="#writerreview">게시글</a></li>
                        <li><a class="" href="#rooms">여행지</a></li>
                        <li><a class="" href="#review">리뷰</a></li>
                      </ul>
                    </div>
                  </div>
                  <div class="description-details">
                    <!-- 게시글  -->
                    <div class="desc-box">
                      <div class="about page-section menu-part" id="about">
                        <p>${touroviewVO.touroview_content}</p>
                      </div>
                    </div>
                    <!-- 여행지  -->
                    <div class="desc-box">
                      <h4 class="content-title">여행지</h4>
                      <div class="menu-part page-section" id="rooms">
                        <table class="rooms-box">
                          <tr>
                            <td>
                              <h6 class="room-title">${tourVO.tour_name}</h6>
                              <a href="#">
                                <img src="../${tourVO.tour_img1_path}" class="img-fluid blur-up lazyload" alt="" />
                              </a>
                            </td>
                            <td>
                              <h5>${tourVO.tour_addr}</h5>
                              <h6>우편번호 : ${tourVO.tour_postnum}</h6>
                              <p>${tourVO.tour_content}</p>
                            </td>
                          </tr>
                        </table>
                      </div>
                    </div>

                    <!-- 리뷰 테이블  -->
                    <div class="desc-box">
                      <h4 class="content-title">리뷰</h4>
                      <div class="menu-part page-section review" id="review">
                        <form>
                          <div class="row">
                            <div class="form-group col-10">
                              <label for="exampleFormControlTextarea1">
                                리뷰 작성
                              </label>
                              <textarea class="form-control review_content" id="exampleFormControlTextarea1" rows="2"
                                placeholder=""></textarea>
                            </div>
                            <div class="col-2 row">
                              <div class="dropdown">
                                <button class="btn btn-warning btn-rounded dropdown-toggle" type="button"
                                  id="dropdownStarCount" data-bs-toggle="dropdown" aria-expanded="false">
                                  별점 선택
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="dropdownStarCount">
                                  <li>
                                    <a class="dropdown-item" href="#" data-stars="5"><i class="fas fa-star"></i>
                                      <i class="fas fa-star"></i>
                                      <i class="fas fa-star"></i>
                                      <i class="fas fa-star"></i>
                                      <i class="fas fa-star"></i></a>
                                  </li>
                                  <li>
                                    <a class="dropdown-item" href="#" data-stars="4"><i class="fas fa-star"></i>
                                      <i class="fas fa-star"></i>
                                      <i class="fas fa-star"></i>
                                      <i class="fas fa-star"></i>
                                      <i class="far fa-star"></i></a>
                                  </li>
                                  <li>
                                    <a class="dropdown-item" href="#" data-stars="3"><i class="fas fa-star"></i>
                                      <i class="fas fa-star"></i>
                                      <i class="fas fa-star"></i>
                                      <i class="far fa-star"></i>
                                      <i class="far fa-star"></i></a>
                                  </li>
                                  <li>
                                    <a class="dropdown-item" href="#" data-stars="2"><i class="fas fa-star"></i>
                                      <i class="fas fa-star"></i>
                                      <i class="far fa-star"></i>
                                      <i class="far fa-star"></i>
                                      <i class="far fa-star"></i></a>
                                  </li>
                                  <li>
                                    <a class="dropdown-item" href="#" data-stars="1"><i class="fas fa-star"></i>
                                      <i class="far fa-star"></i>
                                      <i class="far fa-star"></i>
                                      <i class="far fa-star"></i>
                                      <i class="far fa-star"></i></a>
                                  </li>
                                </ul>
                              </div>
                              <div class="submit-btn">
                                <button type="button" id="tourReviewBtn" class="btn btn-rounded color1">
                                  리뷰 작성
                                </button>
                              </div>
                            </div>
                          </div>
                        </form>
                        <!-- 댓글 추가하는 부분 -->
                        <div id="tour_review">
                        </div>
                        <button type="button" class="btn btn-secondary col-2 offset-xl-5" id="moreReview">
                          리뷰 더보기
                        </button>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 다른 게시물 추천 테이블 -->
              </div>
              <div class="col-xl-3 col-lg-4" id="booking">
                <div class="sticky-cls">
                  <div class="single-sidebar">
                    <div class="selection-section">
                      <div class="price-part">
                        <div class="left-part">
                          <span>${touroviewVO.touroview_regdate}</span>
                        </div>
                        <div class="right-part">
                          <h6 id="writer">${touroviewVO.user_id}</h6>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="single-sidebar">
                    <h6 class="contact-title">작성자 정보</h6>

                    <p><i class="fas fa-phone"></i>${touroviewVO.user_tel}</p>
                    <p><i class="fas fa-envelope"></i>${touroviewVO.user_email}</p>
                    <div class="social-box"></div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- section end -->

        <!-- footer start -->
        <%@ include file='../footer/footer.jsp' %>
          <!-- footer end -->

          <!-- tap to top -->
          <div class="tap-top">
            <div>
              <i class="fas fa-angle-up"></i>
            </div>
          </div>
          <!-- tap to top end -->

          <!-- setting start 화면 검정 + 왼쪽 정렬 , 오른쪽 정렬 -->
          <div class="theme-setting">
            <div class="dark">
              <input class="tgl tgl-skewed" id="dark" type="checkbox" />
              <label class="tgl-btn" data-tg-off="Dark" data-tg-on="Light" for="dark"></label>
            </div>
            <div class="rtl">
              <input class="tgl tgl-skewed" id="rtl" type="checkbox" />
              <label class="tgl-btn" data-tg-off="RTL" data-tg-on="LTR" for="rtl"></label>
            </div>
          </div>
          <!-- setting end -->

          <!-- latest jquery-->
          <script src="../assets/js/jquery-3.5.1.min.js"></script>

          <!-- portfolio js -->
          <script src="../assets/js/jquery.magnific-popup.js"></script>
          <script src="../assets/js/zoom-gallery.js"></script>

          <!-- date-time picker js -->
          <script src="../assets/js/date-picker.js"></script>

          <!-- smooth scroll js -->
          <script src="../assets/js/smooth-scroll.js"></script>

          <!-- slick js-->
          <script src="../assets/js/slick.js"></script>

          <!-- Bootstrap js-->
          <script src="../assets/js/bootstrap.bundle.min.js"></script>

          <!-- lazyload js-->
          <script src="../assets/js/lazysizes.min.js"></script>

          <!-- Theme js-->
          <script src="../assets/js/script.js"></script>

          <!-- 유저 정보-->
          <script src="../assets/js/userInfoHide.js"></script>

          <script>
            $("#datepicker").datepicker({
              uiLibrary: "bootstrap4",
              format: "dd mmmm",
            });
            $("#datepicker1").datepicker({
              uiLibrary: "bootstrap4",
              format: "dd mmmm",
            });
          </script>

          <!-- 신고 기능 -->
          <script>
            function reportPost() {
              var touroviewNum = document.getElementById('touroviewNum').value;
              var sessionId = document.getElementById('sessionId').value;

              $.ajax({
                url: '/touroview/report', // 신고 처리를 위한 서버의 URL
                type: 'POST',
                data: { touroview_num: touroviewNum, user_id: sessionId },
                success: function (response) {
                  // 성공 처리
                  swal("", "신고가 처리되었습니다.", "success");
                  // alert('신고가 처리되었습니다.');
                  $("#reportbutton").css("background-color", "#fd6668"); // 버튼 색상 변경
                  document.querySelector("#reportbutton").removeAttribute('href');

                },
                error: function (xhr, status, error) {
                  // 에러 처리
                  console.error("Error: " + status + " - " + error);
                  swal("", "신고 처리 중 오류가 발생했습니다.", "error");
                  // alert('신고 처리 중 오류가 발생했습니다.');
                }
              });
            }

          </script>




    </body>

    </html>