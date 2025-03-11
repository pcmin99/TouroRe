<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<html lang="UTF-8">
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
      rel="stylesheet"
    />
    <script
      src="https://code.jquery.com/jquery-3.7.1.min.js"
      integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
      crossorigin="anonymous"
    ></script>
    <link
      href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap"
      rel="stylesheet"
    />

    <!-- Icons -->
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/font-awesome.css"
    />

    <!-- Animation -->
    <link rel="stylesheet" type="text/css" href="../assets/css/animate.css" />

    <!-- magnific css -->
    <link rel="stylesheet" href="../assets/css/magnific-popup.css" />

    <!--Slick slider css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/slick.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/slick-theme.css"
    />

    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/color1.css" />

    <style>
      #reviewBOX {
       display: none;
     }
    
   </style>

    <!-- 리뷰 달기 -->
    <script>
      $(function(){
        let stars = ''
        var review_div = $('#tour_review');
        var user_id = $('#sessionId').val();
        var tour_num = $('#tourNum').val();
        review_div.html('');
        // 초기 불러오기
       getReviewList();
        $('.dropdown-item').click(function (e) {
          e.preventDefault();
          
          var stars = $(this).data('stars');
          // 리뷰 삽입
          
          // $('#tourReviewBtn').trigger('click', stars);

          $('#tourReviewBtn').data('selectedStars', stars);

        
        }) // end 별점 등록
        
        // 리뷰 등록
        $('#tourReviewBtn').click((e, stars) => {
            e.preventDefault();
            console.log(user_id)
            if(user_id == " " || user_id == null) {
              console.log(1)
              swal("", "로그인이 필요한 기능입니다.", "warning");
              // alert("로그인 후 이용해주세요")
              window.location.href = '/user/login'; // 수정된 부분
            }
            else {
              var stars = $('#tourReviewBtn').data('selectedStars');
              var reviewText = $('.review_content').val();
              
              // 리뷰 등록 ajax
              $.ajax({
                type:'post',
                url : '/touro/tour/reviewInsert',
                data : { tour_review_content : reviewText, tour_review_star : stars, user_id : user_id, tour_num : tour_num },
                success : function(result) {
                  review_div.html('');
                  getReviewList();
                  console.log("리뷰등록" + result);
                  $('.review_content').val(" ");

                },
                error : function(err) {
                  console.log(err)
                }
              }) // end ajax
            }
           
        }); // end 리뷰작성 클릭

      // 리뷰 전체 보이게 하기
      function getReviewList() {
        $.ajax({
          type:'get',
          url : '/touro/tour/selectReview',
          data : {tour_num : tour_num},
          dataType : 'json',
          contentType: "application/x-www-form-urlencoded; charset=UTF-8",
          success : function(result){
            review_div.html('');
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
            $(result).each(function(){
              const ratingStars = generateStars(this.tour_review_star);
              console.log(this.tour_review_content);

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
                        <h6>by ${'${this.user_id}'}, ${'${this.tour_review_regdate}'}</h6>
                        <p>${'${this.tour_review_content}'}</p>
                      </div>
                    </div>
                  `
                  review_div.append(html);
            });
            // 별점에 대한 HTML을 생성하는 함수

            // 별점에 대한 HTML을 생성하는 함수
            $(".review-box:lt(3)").css('display', 'flex'); // 초기갯수

            $("#moreReview").click(function(e){ // 클릭시 more
              e.preventDefault();
              $(".review-box:hidden").slice(0, 3).css('display', 'flex'); // 클릭시 more 갯수 지저정
              if($(".review-box:hidden").length == 0){ // 컨텐츠 남아있는지 확인
                $("#moreReview").hide(); // 컨텐츠 없을시 alert 창 띄우기 
              }
            })

          },
          error : function(err) {
            console.log(err);
          }

        }) // end ajax
      }

      // $('#inquiry_modal').click((e) => {
      //   e.preventDefault();
      //   $('#tour-q').attr('class', 'modal fade hide')
      //   if(user_id == null || user_id == "") {
      //     swal('', '로그인이 필요한 기능입니다.', 'info')
      //   } else {
      //     $('#tour-q').modal('show')
      //   }
      // })


      // moreReview 클릭 시 5개씩 리뷰 보이게 하기
      }) // end script
    </script>
    <!--   -->

  </head>

  <body>
    <!-- 세션 로그인 값 -->
    <input type="hidden" value="${sessionScope.loggedInUser.user_id}" id="sessionId"/>
    <input type="hidden" value="${TourData.tour_lati}" id="tour_lati" />
    <input type="hidden" value="${TourData.tour_longi}" id="tour_longi" />
    <input type="hidden" value="${TourData.tour_num}" id="tourNum"/>
    <input
      type="hidden"
      value="${TourData.tour_cate_code}"
      id="tour_cate_code"
    />
    <!-- header start -->
   <%@ include file='../header/header.jsp' %>
    <!--  header end -->

    <!-- breadcrumb start -->
    <section class="home_section p-0">
      <div>
        <div class="home home-60">
          <img
            src="../assets/images/tour/spain4.jpg"
            class="img-fluid blur-up lazyload bg-img"
            alt=""
          />
          <div class="container">
            <div class="row">
              <div class="col-md-8 offset-md-2">
                <div class="home-content pt-0 mix-layout mrg-cls">
                  <div>
                    <h1>${TourData.tour_name}</h1>
                    <ul class="package-detail">
                      <li>${TourData.tour_addr}</li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- breadcrumb end -->

    <!-- section start -->
    <section class="single-section small-section bg-inner">
      <div class="container">
        <div class="row">
          <div class="">
            <div class="description-section tab-section">
              <!-- 메뉴 -->
              <div class="menu-top menu-up">
                <ul class="nav nav-tabs" id="top-tab" role="tablist">
                  <li class="nav-item">
                    <a
                      data-bs-toggle="tab"
                      class="nav-link active"
                      href="#highlight"
                      >여행지 소개</a
                    >
                  </li>
                  <li class="nav-item">
                    <a data-bs-toggle="tab" class="nav-link" href="#itinerary"
                      >상세 정보</a
                    >
                  </li>
                  <li class="nav-item">
                    <a data-bs-toggle="tab" class="nav-link" href="#gallery"
                      >사진</a
                    >
                  </li>
                  <li class="nav-item">
                    <a
                      data-bs-toggle="tab"
                      class="nav-link"
                      href="#accommodations"
                    >
                      주변 여행지 정보
                    </a>
                  </li>
                  <li class="nav-item">
                    <a data-bs-toggle="tab" class="nav-link" href="#location" id="kakaomap">
                      지도
                    </a>
                  </li>
                  <li class="nav-item">
                    <a data-bs-toggle="tab" class="nav-link" href="#review">
                      댓글 리뷰
                    </a>
                  </li>
                </ul>
              </div>

              <div class="description-details tab-content" id="top-tabContent">
                <!-- 여행지 소개 -->
                <div
                  class="menu-part about tab-pane fade show active"
                  id="highlight"
                >
                  <div class="row row-cols-3">
                    <div class="about-sec col-lg-6">
                      <div>
                        <br />
                        <h2>
                          ${TourData.tour_name} -
                          <c:choose>
                            <c:when test="${TourData.tour_cate_code eq 12}"
                              >관광지</c:when
                            >
                            <c:when test="${TourData.tour_cate_code eq 32}"
                              >숙박업</c:when
                            >
                            <c:when test="${TourData.tour_cate_code eq 39}"
                              >음식점</c:when
                            >
                            <c:otherwise>?</c:otherwise>
                          </c:choose>
                        </h2>
                      </div>
                      <div class="row"><br /></div>
                      <div class="about-sec">
                        <h4>${TourData.tour_addr}</h4>
                      </div>
                      <div class="row col-11" id = num222>
                        <h6>소개문</h6>
                        <p>${TourData.tour_content}...
                        </p>
                      </div>
                      <div class="row">
                        <div class="col btn-group-showcase">
                          <a
                            href="#"
                            class="btn btn-rounded btn-secondary col-1  "
                            data-bs-toggle=""
                            data-placement=""
                            title="${TourData.tour_num}"
                            data-original-title="Add_to_Wishlist"
                            style="
                            padding-left: 0px;
                            padding-right: 0px;
                            "
                          >
                            <i class="far fa-heart"></i
                          ></a>
                          <a
                            href="#"
                            class="btn btn-rounded color2 col-4"
                            data-bs-toggle="modal"
                            data-bs-target="#tour-q"
                            title=""
                            id="inquiry_modal"
                          >
                            문의하기
                          </a>
                        </div>
                      </div>
                    </div>

                    <div class="detail-img card col-lg-6">
                      <img
                        src="../${TourData.tour_img1_path}"
                        class="card-body img-fluid blur-up lazyload"
                        alt=""
                      />
                    </div>
                  </div>
                  <!-- <div class="row" id = num123>
                    <div class="about-sec col-lg-6" id = num222>
                      <h6>소개문</h6>
                      <p>${TourData.tour_content}...
                      </p>
                    </div>
                    <div class="col-1"></div>
                    <div class="col-lg-5 row">
                      <div class="row"></div>
                      <div class="btn-group-showcase offset-xl-1">
                        <a
                          href="#"
                          class="btn btn-rounded btn-secondary col-2"
                          data-bs-toggle=""
                          data-placement=""
                          title="${TourData.tour_num}"
                          data-original-title="Add_to_Wishlist"
                        >
                          <i class="far fa-heart"></i
                        ></a>
                        <a
                          href="#"
                          class="btn btn-rounded color2 col-4"
                          data-bs-toggle="modal"
                          data-bs-target="#tour-q"
                          title=""
                        >
                          문의하기
                        </a>
                      </div>
                    </div>
                  </div> -->
                </div>

                <!-- 상세 정보 -->
                <div class="menu-part accordion tab-pane fade" id="itinerary">
                  <div id="accordion" class="row">
                    <div class="card col-lg-8">
                      <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                          <button
                            class="btn btn-link disabled"
                            data-bs-toggle="collapse"
                            data-bs-target="#collapseOne"
                            aria-expanded="true"
                            aria-controls="collapseOne"
                            id="info_head"
                          >
                            상세 정보
                          </button>
                        </h5>
                      </div>
                      <div
                        id="collapseOne"
                        class="collapse show"
                        aria-labelledby="headingOne"
                        data-bs-parent="#accordion"
                      >
                        
                        <div id="info_head_body" class="card-body">
                          <div class="highlight">
                            ${TourData.tour_content}
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="card col-lg-4">
                      <div class="card-header" id="headingThree">
                        <h5 class="mb-0">
                          <button
                            class="btn btn-link collapsed disabled"
                            data-bs-toggle="collapse"
                            data-bs-target="#collapseThree"
                            aria-expanded="false"
                            aria-controls="collapseThree"
                          >
                            여행지 현재 별점
                          </button>
                        </h5>
                      </div>
                      <div
                        id="collapseThree"
                        class="collapse show"
                        aria-labelledby="headingThree"
                        data-bs-parent="#accordion"
                      >
                        <div class="card-body">
                          <div class="highlight" style="color: #FF0000">
                            <c:choose>
                              <c:when
                                test="${0 eq TourData.tour_star
                            }"
                              >
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                              </c:when>
                              <c:when
                                test="${TourData.tour_star > 0 and 1 > TourData.tour_star}"
                              >
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                              </c:when>
                              <c:when
                                test="${TourData.tour_star > 1 and 2 > TourData.tour_star}"
                              >
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                              </c:when>
                              <c:when
                                test="${TourData.tour_star > 3 and 4 > TourData.tour_star}"
                              >
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li class="not-include">
                                  <i class="far fa-star"></i>
                                </li>
                              </c:when>
                              <c:when test="${TourData.tour_star > 4}">
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                                <li>
                                  <i class="fas fa-star"></i>
                                </li>
                              </c:when>

                              <c:otherwise>
                                <li>
                                  <i class="far fa-star">?</i>
                                </li>
                              </c:otherwise>
                            </c:choose>
                          </div>
                        </div>
                      </div>
                    </div>

                    <div class="card col-lg-6">
                      <div class="card-header" id="headingFour">
                        <h5 class="mb-0">
                          <button
                            class="btn btn-link disabled"
                            data-bs-toggle="collapse"
                            data-bs-target="#collapseFour"
                            aria-expanded="true"
                            aria-controls="collapseFour"
                          >
                            날씨 정보
                          </button>
                        </h5>
                      </div>

                      <div
                        id="collapseFour"
                        class="collapse show"
                        aria-labelledby="headingFour"
                        data-bs-parent="#accordion"
                      >
                        <div class="card-body">
                          <div class="single-sidebar">
                            <ul class="weather-sec">

                              <!-- 1번째 날-->
                              <li id = "one_weather">
                                <!-- <%-- <h5> </h5>  -->
                                  <svg
                                    viewBox="0 0 512.00722 512"
                                    xmlns="http://www.w3.org/2000/svg"
                                  >
                                  </svg>
                                  <!-- <h6></h6> --%> -->
                              </li>

                              <!-- 2번째 날-->
                              <li id = "two_weather">
                                <!-- <%-- <h5>10 Sep</h5> -->
                                <svg
                                  viewBox="0 0 512.00119 512"
                                  xmlns="http://www.w3.org/2000/svg"
                                >
                                </svg>
                                <!-- <h6>26 °C</h6> --%> -->
                              </li>

                              <!-- 3번째 날-->
                              <li id = "three_weather">
                                <!-- <%-- <h5>11 Sep</h5> -->
                                <svg
                                  viewBox="0 0 512.00038 512"
                                  xmlns="http://www.w3.org/2000/svg"
                                >
                                </svg>
                                <!-- <h6>25 °C</h6> --%> -->
                              </li>

                              <!-- 4번째 날-->
                              <li id = "four_weather">
                                <!-- <%-- <h5>12 Sep</h5> -->
                                <svg
                                  viewBox="0 1 511 511.99899"
                                  xmlns="http://www.w3.org/2000/svg"
                                >
                                </svg>
                                <!-- <h6>24 °C</h6> --%> -->
                              </li>

                            </ul>
                          </div>
                        </div>
                      </div>
                    </div>

<!-- 
                    <%-- <div class="card col-lg-6">
                      <div class="card-header" id="headingFive">
                        <h5 class="mb-0">
                          <button
                            class="btn btn-link collapsed disabled"
                            data-bs-toggle="collapse show"
                            data-bs-target="#collapseFive"
                            aria-expanded="false"
                            aria-controls="collapseFive"
                          >
                            태그
                          </button>
                        </h5>
                      </div>
                      <div
                        id="collapseFive"
                        class="collapse show"
                        aria-labelledby="headingFive"
                        data-bs-parent="#accordion"
                      >
                        <div class="card-body"></div>
                      </div>
                    </div> --%> -->

                    
                  </div>
                </div>

                <!-- 사진 -->
                <div class="menu-part tab-pane fade" id="gallery">
                  <div class="container-fluid p-0 ratio3_2">
                    <div class="row zoom-gallery">
                      <div class="col-lg-4 col-sm-6">
                        <div id="tour_img1" class="overlay">
                          <a href="../assets/images/tour/tour/7.jpg">
                            <div class="overlay-background">
                              <i class="fa fa-plus" aria-hidden="true"></i>
                            </div>
                            <img
                              src="../assets/images/tour/tour/7.jpg"
                              alt=""
                              class="img-fluid blur-up lazyload"
                            />
                          </a>
                        </div>
                      </div>
                      <div id="tour_img2" class="col-lg-4 col-sm-6">
                        <div class="overlay">
                          <a href="">
                            <div class="overlay-background">
                              <i class="fa fa-plus" aria-hidden="true"></i>
                            </div>
                            <img
                              src=""
                              alt=""
                              class="img-fluid blur-up lazyload"
                            />
                          </a>
                        </div>
                      </div>
                      <div class="col-lg-4 col-sm-6">
                        <div id="tour_img3" class="overlay">
                          <a href="">
                            <div class="overlay-background">
                              <i class="fa fa-plus" aria-hidden="true"></i>
                            </div>
                            <img
                              src=""
                              alt=""
                              class="img-fluid blur-up lazyload"
                            />
                          </a>
                        </div>
                      </div>
                      <div class="col-lg-4 col-sm-6">
                        <div id="tour_img4" class="overlay">
                          <a href="">
                            <div class="overlay-background">
                              <i class="fa fa-plus" aria-hidden="true"></i>
                            </div>
                            <img
                              src=""
                              alt=""
                              class="img-fluid blur-up lazyload"
                            />
                          </a>
                        </div>
                      </div>
                      <div class="col-lg-4 col-sm-6">
                        <div id="tour_img5" class="overlay">
                          <a href="">
                            <div class="overlay-background">
                              <i class="fa fa-plus" aria-hidden="true"></i>
                            </div>
                            <img
                              src=""
                              alt=""
                              class="img-fluid blur-up lazyload"
                            />
                          </a>
                        </div>
                      </div>
                      <div class="col-lg-4 col-sm-6">
                        <div id="tour_img6" class="overlay">
                          <a href="">
                            <div class="overlay-background">
                              <i class="fa fa-plus" aria-hidden="true"></i>
                            </div>
                            <img
                              src=""
                              alt=""
                              class="img-fluid blur-up lazyload"
                            />
                          </a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 주변 여행지 -->
                <div class="menu-part tab-pane fade" id="accommodations">
                  <div class="col-lg-12 ratio3_2">
                    <div class="product-wrapper-grid special-section grid-box">
                      <div class="row content grid">
                        <div
                          class="col-xl-4 col-sm-6 popular grid-item wow fadeInUp"
                          data-class="popular"
                        >
                          <div class="special-box p-0">
                            <div id="accommod_tour1" class="special-img">
                              <a href="/jsp/Tourinfo">
                                <img
                                  src="../assets/images/tour/tour/7.jpg"
                                  class="img-fluid blur-up lazyload"
                                  alt=""
                                />
                              </a>
                              <div class="top-icon">
                                <a
                                  href="#"
                                  class=""
                                  data-bs-toggle="tooltip"
                                  data-placement="top"
                                  title=""
                                  data-original-title="Add to Wishlist"
                                >
                                  <i class="far fa-heart"></i>
                                </a>
                              </div>
                              <div class="content-inner">
                                <h5>여행지 명</h5>
                              </div>
                            </div>
                            <div class="label-offer"></div>
                          </div>
                        </div>

                        <div
                          class="col-xl-4 col-sm-6 popular grid-item wow fadeInUp"
                          data-class="popular"
                        >
                          <div class="special-box p-0">
                            <div id="accommod_tour2" class="special-img">
                              <a href="/jsp/Tourinfo">
                                <img
                                  src="../assets/images/tour/tour/7.jpg"
                                  class="img-fluid blur-up lazyload"
                                  alt=""
                                />
                              </a>
                              <div class="top-icon">
                                <a
                                  href="#"
                                  class=""
                                  data-bs-toggle="tooltip"
                                  data-placement="top"
                                  title=""
                                  data-original-title="Add to Wishlist"
                                >
                                  <i class="far fa-heart"></i>
                                </a>
                              </div>
                              <div class="content-inner">
                                <h5>여행지 명</h5>
                              </div>
                            </div>
                            <div class="label-offer"></div>
                          </div>
                        </div>

                        <div
                          class="col-xl-4 col-sm-6 popular grid-item wow fadeInUp"
                          data-class="popular"
                        >
                          <div class="special-box p-0">
                            <div id="accommod_tour3" class="special-img">
                              <a href="/jsp/Tourinfo">
                                <img
                                  src="../assets/images/tour/tour/7.jpg"
                                  class="img-fluid blur-up lazyload"
                                  alt=""
                                />
                              </a>
                              <div class="top-icon">
                                <a
                                  href="#"
                                  class=""
                                  data-bs-toggle="tooltip"
                                  data-placement="top"
                                  title=""
                                  data-original-title="Add to Wishlist"
                                >
                                  <i class="far fa-heart"></i>
                                </a>
                              </div>
                              <div class="content-inner">
                                <h5>여행지 명</h5>
                              </div>
                            </div>
                            <div class="label-offer"></div>
                          </div>
                        </div>

                        <div
                          class="col-xl-4 col-sm-6 popular grid-item wow fadeInUp"
                          data-class="popular"
                        >
                          <div class="special-box p-0">
                            <div id="accommod_tour4" class="special-img">
                              <a href="/jsp/Tourinfo">
                                <img
                                  src="../assets/images/tour/tour/7.jpg"
                                  class="img-fluid blur-up lazyload"
                                  alt=""
                                />
                              </a>
                              <div class="top-icon">
                                <a
                                  href="#"
                                  class=""
                                  data-bs-toggle="tooltip"
                                  data-placement="top"
                                  title=""
                                  data-original-title="Add to Wishlist"
                                >
                                  <i class="far fa-heart"></i>
                                </a>
                              </div>
                              <div class="content-inner">
                                <h5>여행지 명</h5>
                              </div>
                            </div>
                            <div class="label-offer"></div>
                          </div>
                        </div>

                        <div
                          class="col-xl-4 col-sm-6 popular grid-item wow fadeInUp"
                          data-class="popular"
                        >
                          <div class="special-box p-0">
                            <div id="accommod_tour5" class="special-img">
                              <a href="/jsp/Tourinfo">
                                <img
                                  src="../assets/images/tour/tour/7.jpg"
                                  class="img-fluid blur-up lazyload"
                                  alt=""
                                />
                              </a>
                              <div class="top-icon">
                                <a
                                  href="#"
                                  class=""
                                  data-bs-toggle="tooltip"
                                  data-placement="top"
                                  title=""
                                  data-original-title="Add to Wishlist"
                                >
                                  <i class="far fa-heart"></i>
                                </a>
                              </div>
                              <div class="content-inner">
                                <h5>여행지 명</h5>
                              </div>
                            </div>
                            <div class="label-offer"></div>
                          </div>
                        </div>

                        <div
                          class="col-xl-4 col-sm-6 popular grid-item wow fadeInUp"
                          data-class="popular"
                        >
                          <div class="special-box p-0">
                            <div id="accommod_tour6" class="special-img">
                              <a href="/jsp/Tourinfo">
                                <img
                                  src="../assets/images/tour/tour/7.jpg"
                                  class="img-fluid blur-up lazyload"
                                  alt=""
                                />
                              </a>
                              <div class="top-icon">
                                <a
                                  href="#"
                                  class=""
                                  data-bs-toggle="tooltip"
                                  data-placement="top"
                                  title=""
                                  data-original-title="Add to Wishlist"
                                >
                                  <i class="far fa-heart"></i>
                                </a>
                              </div>
                              <div class="content-inner">
                                <h5>여행지 명</h5>
                              </div>
                            </div>
                            <div class="label-offer"></div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                <!-- 지도 --> 
                <div class="menu-part tab-pane fade map" id="location" style="width: 100%; height: 400px;">
                   
                </div>

                <!-- 댓글 리뷰 -->
                <div class="menu-part tab-pane fade review" id="review">
                  <form>
                    <div class="row">
                      <div class="form-group col-10">
                        <label for="exampleFormControlTextarea1">
                          리뷰 작성
                        </label>
                        <textarea
                          class="form-control review_content"
                          id="exampleFormControlTextarea1"
                          rows="2"
                          placeholder=""
                        ></textarea>
                      </div>
                      <div class="col-2 row">
                        <div class="dropdown">
                          <button
                            class="btn btn-warning btn-rounded dropdown-toggle"
                            type="button"
                            id="dropdownStarCount"
                            data-bs-toggle="dropdown"
                            aria-expanded="false"
                          >
                            별점 선택
                          </button>
                          <ul
                            class="dropdown-menu"
                            aria-labelledby="dropdownStarCount"
                          >
                            <li>
                              <a class="dropdown-item" href="#" data-stars="5"
                                ><i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i
                              ></a>
                            </li>
                            <li>
                              <a class="dropdown-item" href="#" data-stars="4"
                                ><i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i
                              ></a>
                            </li>
                            <li>
                              <a class="dropdown-item" href="#" data-stars="3"
                                ><i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i
                              ></a>
                            </li>
                            <li>
                              <a class="dropdown-item" href="#" data-stars="2"
                                ><i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i
                              ></a>
                            </li>
                            <li>
                              <a class="dropdown-item" href="#" data-stars="1"
                                ><i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i>
                                <i class="far fa-star"></i
                              ></a>
                            </li>
                          </ul>
                        </div>
                        <div class="submit-btn">
                          <button
                            type="button"
                            id="tourReviewBtn"
                            class="btn btn-rounded color1">
                            리뷰 작성
                          </button>
                        </div>
                      </div>
                    </div>
                  </form>
                 <!-- 댓글 추가하는 부분 -->
                  <div id="tour_review">
                    
                  </div>
                  <button
                    type="button"
                    class="btn btn-secondary col-2 offset-xl-5"
                    id="moreReview"
                  >
                    리뷰 더보기
                  </button>

                 
                </div>
              </div>
            </div>
        </div>
      </div>
    </section>
    <!-- section end -->

    <!-- book now section start -->
    <div class="book-panel">
      <button
        data-bs-toggle="modal"
        data-bs-target="#booknowModal"
        type="button"
        class="btn bottom-btn theme-color"
      >
        book now
      </button>
      <button
        data-bs-toggle="modal"
        data-bs-target="#enquiryModal"
        type="button"
        class="btn bottom-btn"
      >
        enquiry
      </button>
    </div>

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

    <!-- setting start -->
    <div class="theme-setting">
      <div class="dark">
        <input class="tgl tgl-skewed" id="dark" type="checkbox" />
        <label
          class="tgl-btn"
          data-tg-off="Dark"
          data-tg-on="Light"
          for="dark"
        ></label>
      </div>
      <div class="rtl">
        <input class="tgl tgl-skewed" id="rtl" type="checkbox" />
        <label
          class="tgl-btn"
          data-tg-off="RTL"
          data-tg-on="LTR"
          for="rtl"
        ></label>
      </div>
    </div>
    <!-- setting end -->

    <!-- enquiry modal start-->
    <div
      class="modal fade enquiry-modal"
      id="enquiryModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <div>
              <h5 class="modal-title">Quick Enquiry</h5>
              <p>
                if you have any queries kindly take a moment to fill this form,
                our representative will contact you shortly..
              </p>
            </div>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form>
              <input type="text" class="form-control" placeholder="Full Name" />
              <input
                type="email"
                class="form-control"
                placeholder="Enter email"
              />
              <input
                type="number"
                class="form-control"
                placeholder="Phone no:"
              />
              <textarea
                class="form-control"
                rows="3"
                placeholder="Your Query"
              ></textarea>
              <div class="text-end">
                <button type="submit" class="btn btn-solid">submit</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    <!-- enquiry modal end -->

    <!-- book now modal start-->
    <div
      class="modal fade enquiry-modal"
      id="booknowModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content single-section">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">Book this tour</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body single-sidebar mt-0">
            <div class="book-btn-section pt-0 border-top-0">
              <div class="detail-top">
                <input
                  type="text"
                  id="first-Name"
                  class="form-control"
                  placeholder="First name"
                />
                <input
                  type="email"
                  class="form-control"
                  placeholder="Enter your email"
                />
                <input
                  type="number"
                  class="form-control"
                  placeholder="Phone Number"
                />
              </div>
              <div class="rooms-section">
                <input
                  type="email"
                  class="form-control open-select"
                  placeholder="Rooms & guests"
                />
                <div class="selector-box">
                  <div class="room-cls">
                    <label class="title_room">room 1</label>
                    <div class="qty-box">
                      <label>adult</label>
                      <div class="input-group">
                        <button
                          type="button"
                          class="btn quantity-left-minus"
                          data-type="minus"
                          data-field=""
                        >
                          -
                        </button>
                        <input
                          type="text"
                          name="quantity"
                          class="form-control qty-input input-number"
                          value="1"
                        />
                        <button
                          type="button"
                          class="btn quantity-right-plus"
                          data-type="plus"
                          data-field=""
                        >
                          +
                        </button>
                      </div>
                    </div>
                    <div class="qty-box">
                      <label>children</label>
                      <div class="input-group">
                        <button
                          type="button"
                          class="btn quantity-left-minus"
                          data-type="minus"
                          data-field=""
                        >
                          -
                        </button>
                        <input
                          type="text"
                          name="quantity"
                          class="form-control qty-input input-number"
                          value="1"
                        />
                        <button
                          type="button"
                          class="btn quantity-right-plus"
                          data-type="plus"
                          data-field=""
                        >
                          +
                        </button>
                      </div>
                    </div>
                  </div>
                  <div class="bottom-part">
                    <a href="#" class="add-room">add room +</a>
                    <a href="javascript:void(0)" class="btn">apply</a>
                  </div>
                </div>
              </div>
              <div class="selector">
                <select class="mt-0">
                  <option value="" disabled selected>Select your date</option>
                  <option value="saab">15 march, 2019</option>
                  <option value="saab">27 August, 2019</option>
                  <option value="audi">20 December, 2019</option>
                </select>
              </div>
              <a href="#" class="btn btn-rounded btn-sm color1"
                >book this now</a
              >
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- book now modal end -->

    <!-- 사용자 페이지(Modal) 창 구성 시작 -->
    <div
      class="modal fade edit-profile-modal"
      id="edit-profile"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">사용자 페이지</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body dashboard-section">
            <div class="pro_sticky_info" data-sticky_column="">
              <div class="dashboard-sidebar">
                <div class="profile-top">
                  <div class="profile-image">
                    <img
                      src="../assets/images/avtar/1.jpg"
                      class="img-fluid blur-up lazyloaded"
                      alt=""
                    />
                  </div>
                  <div class="profile-detail">
                    <h5>사용자 연령대</h5>
                    <h6>mark.enderess@mail.com</h6>
                  </div>
                </div>
                <div class="dashboard-box">
                  <div class="dashboard-detail">
                    <div class="booking-box">
                      <div class="date-box">
                        <span class="date">ID</span>
                      </div>
                      <div class="detail-middle">
                        <div class="media">
                          <div class="media-body">
                            <h6 class="media-heading">사용자 아이디</h6>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="dashboard-box">
                  <div class="dashboard-detail">
                    <div class="booking-box">
                      <div class="date-box">
                        <span class="date">선호 여행 유형</span>
                      </div>
                      <div class="detail-middle">
                        <div class="media">
                          <div class="media-body">
                            <h6 class="media-heading">유형</h6>
                            <p>1 순위</p>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">유형</h6>
                            <p>2 순위</p>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">유형</h6>
                            <p>3 순위</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="dashboard-box">
                  <div class="dashboard-detail">
                    <div class="booking-box">
                      <div class="date-box">
                        <span class="date">선호 지역</span>
                      </div>
                      <div class="detail-middle">
                        <div class="media">
                          <div class="media-body">
                            <h6 class="media-heading">지역</h6>
                            <p>1 순위</p>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">지역</h6>
                            <p>2 순위</p>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">지역</h6>
                            <p>3 순위</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 사용자 페이지 창 구성 끝 -->

    <!-- 문의 작성(Modal) 시작 -->
    <div
      class="modal fade edit-profile-modal"
      id="tour-q"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <form id="inquiry">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">문의</h5>
              <!--<button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>-->
            </div>
            <div class="modal-body dashboard-section">
              <div class="row">
                <div class="form-group col-12">
                  <label for="old">여행지</label>
                  <input
                    class="form-control"
                    value="${TourData.tour_name}"
                    disabled
                  />
                  <input
                    type="hidden"
                    class="form-control"
                    value="${TourData.tour_num}"
                    name="tour_num"
                    id="tour_num"
                  />
                  <input
                    type="hidden"
                    value="${sessionScope.loggedId}"
                    name="user_id"
                    id="loggedInUser"
                  />
                </div>
                <div class="form-group col-12">
                  <label for="new">제목</label>
                  <input class="form-control" name="inquiry_title" />
                </div>
                <div class="form-group col-12">
                  <label for="comfirm">내용</label>
                  <textarea
                    class="form-control"
                    name="inquiry_content"
                    placeholder="문의 사항을 입력해주세요."
                    rows="3"
                  ></textarea>
                </div>
              </div>
            </div>
            <div class="modal-footer dashboard-section">
              <button type="submit" class="btn btn-solid" id="btnInquiry">
                작성
              </button>
              <button
                type="reset"
                class="btn btn-secondary"
                data-bs-dismiss="modal"
              >
                취소
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
    <!-- 문의 작성 끝 -->

    <!-- latest jquery-->
    <script src="../assets/js/jquery-3.5.1.min.js"></script>

    <!-- zoom gallery js -->
    <script src="../assets/js/jquery.magnific-popup.js"></script>
    <script src="../assets/js/zoom-gallery.js"></script>

    <!-- slick js-->
    <script src="../assets/js/slick.js"></script>

    <!-- Bootstrap js-->
    <script src="../assets/js/bootstrap.bundle.min.js"></script>

    <!-- lazyload js-->
    <script src="../assets/js/lazysizes.min.js"></script>

    <!-- Theme js-->
    <script src="../assets/js/script.js"></script>

    <!-- 찜리스트 추가용 js-->
    <script src="../assets/js/addWishList.js"></script>

    <!-- 날씨 API (위도, 경도로 4일정도) js -->
    <script src="../assets/js/tourDetailWeather.js"></script>

    <!-- 여행지 API 주변 관광 정보 & 여행지 API 상세 내용 js -->
    <script src="../assets/js/tourDetailData.js"></script>

    <!-- 소개문 관련 js-->
    <script src= "../assets/js/tour_detail.js"></script>

    <!-- 카카오 지도 api 관련-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c24da0b739365422264a4d30230c887c"></script>

    <!-- sweetalert.js -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

  </body>
</html>
