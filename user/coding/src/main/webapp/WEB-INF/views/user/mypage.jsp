<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
    
    <title>Rica</title>
<!-- 수정 -->
    <!--Google font-->
    <link
      href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&display=swap"
      rel="stylesheet"
    />
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

    <!--Slick slider css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/slick.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/slick-theme.css"
    />

    <!-- Date-time picker css -->
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/datepicker.min.css"
    />

  <!-- 발자취 발모양-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">

    <!--Drop zon-->
    <link rel="stylesheet" type="text/css" href="../assets/css/dropzone.css" />

    <!-- 파일 업로드 : dropzone -->
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>

    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/color1.css" />
  
    <!-- 문의 내역 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">

    <!-- sweetalert.js -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <script
      src="https://code.jquery.com/jquery-3.7.1.min.js"
      integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
      crossorigin="anonymous"
    ></script>

  </head>

  <style>
    /* 사용자 메시지 스타일 */
    .chat-bubble.chat-user {
        max-width: 70%;
        background-color: #DCF8C6;
        border-radius: 10px;
        padding: 10px;
        margin-bottom: 10px;
        float: right;
        clear: both;
    }

    /* 관리자 메시지 스타일 */
    .chat-bubble.chat-admin {
        max-width: 70%;
        background-color: #EAEAEA;
        border-radius: 10px;
        padding: 10px;
        margin-bottom: 10px;
        float: left;
        clear: both;
    }

    /* 채팅 입력창 스타일 */
    #inquiryInput {
        width: 80%;
        resize: none;
        margin-right: 10px;
    }

    /* 제출 버튼 스타일 */
    #submitButton {
        width: 20%;
    }


    /* 문의 내역 토글 */
    .inquiry-response {
    line-height: 2.0; /* 기본값보다 큰 값으로 설정 */
    border-bottom: 1px solid #ddd; /* 하단에 선 추가 */
    padding-bottom: 15px; /* 내용과 선 사이의 간격 조정 */
    margin-bottom: 15px; /* 선 아래의 간격 조정 */    
  }

    .toggle-title {
    cursor: pointer;
    position: relative;
    padding-right: 30px; /* 아이콘을 위한 공간 확보 */
  }

  .toggle-title::after {
    content: '\25BC'; /* 아래쪽 화살표 */
    position: absolute;
    right: 0;
    top: 50%;
    transform: translateY(-50%);

    
  }

    /* 문의 내역 글자 */
    .inquiry-title {
    color: #4a90e2;
  }

  .inquiry-content {
    color: black;
  }

  .inquiry-answered {
    color: #4a90e2;
  }

  .inquiry-pending {
    color: #fd6686;
  }

  /* 작성한 글 페이징 오른쪽 처리 */ 
  .pagination-right {
  justify-content: right;
}

.pagination-right a {
    display: inline-block;
    padding: 5px 10px;
    margin: 5px 2px;
    border: 1px solid #ddd; /* 경계선 */
    background-color: #f8f9fa; /* 배경색 */
    color: #007bff; /* 글자색 */
    text-decoration: none; /* 링크 밑줄 제거 */
    font-size: 14px; /* 글자 크기 */
}


.pagination-right a.active {
    background-color: #007bff; /* 활성화된 페이지 배경색 */
    color: white; /* 활성화된 페이지 글자색 */
    border-color: #007bff; /* 활성화된 페이지 경계선 */
}


.inquiry-date {
    color: black; /* 글자색 검정 */
    font-size: 15px; /* 글자 크기 줄임 */
    /* 필요에 따라 추가 스타일 */
}


.footprints-section {
  /* 여기에 스타일을 추가하세요 */
  margin-top: 20px;
}

.footprints-section h3 {
  /* 섹션 제목 스타일 */
  text-align: center;
  margin-bottom: 15px;
}

#footprints i {
  /* 발자국 아이콘 스타일 */
  color: #4a4a4a;
  margin-right: 5px;
}


.footprint {
  display: inline-block;
  position: relative;
  cursor: pointer;
}

.footprint i {
  color: #4a4a4a; /* 아이콘 색상 */
  transition: transform 0.3s ease; /* 위로 올라가는 효과 */
}

.footprint:hover i {
  transform: translateY(-10px); /* 아이콘 위로 이동 */
}

.footprint .title {
  position: absolute;
  bottom: 100%; /* 아이콘 위에 위치 */
  left: 50%;
  transform: translateX(-50%) scaleY(0);
  transition: transform 0.3s ease;
  white-space: nowrap; /* 텍스트 줄바꿈 방지 */
  /* 추가 스타일링... */
}

.footprint:hover .title {
  transform: translateX(-50%) scaleY(1); /* 텍스트 보이기 */
}

.milestone {
  font-weight: bold;
  color: red; /* 메시지 색상 */
  margin: 10px 0; /* 상하 여백 */
}




#kakao-map {
    margin: 0;
    padding: 0;
}



</style>


  <body>
    <!-- header start -->
    <%@ include file='../header/header.jsp' %>
    <!--  header end -->

    <!-- breadcrumb start -->
    <section class="breadcrumb-section pt-0">
      <img
        src="../assets/images/inner-bg.jpg"
        class="bg-img img-fluid blur-up lazyload"
        alt=""
      />
      <div class="breadcrumb-content">
        <div>
          <h2>마이페이지</h2>
          <nav aria-label="breadcrumb" class="theme-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/touro">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">
                마이페이지
              </li>
            </ol>
          </nav>
        </div>
      </div>
      <div class="title-breadcrumb">TOURO</div>
    </section>
    <!-- breadcrumb end -->

    <input type="hidden" value="${TourData.tour_num}" id="tourNum"/>
    <!-- section start-->
    <section
      class="small-section dashboard-section bg-inner"
      data-sticky_parent
    >
      <div class="container">
        <div class="row">
          <div class="col-lg-3">
            <div class="pro_sticky_info" data-sticky_column>
              <div class="dashboard-sidebar">
                <div class="profile-top">
                  <div class="profile-image">
                    <img
                      src="../assets/images/profile/${profileImage}"
                      onerror="this.onerror=null; this.src='../assets/images/profile/default_profile.png';"
                      class="img-fluid blur-up lazyload"
                      alt=""
                    />
                  </div>
                  <div class="profile-detail">
                    <h5>${userVO.user_name}</h5>
                    <h5>${userVO.user_addr}</h5>
                    <h6>${userVO.user_email}</h6>
                  </div>
                </div>
                <!-- 왼쪽 카테고리 메뉴 -->
                <div class="faq-tab">
                  <ul class="nav nav-tabs" id="top-tab" role="tablist">
                    <li class="nav-item">
                      <a
                        data-bs-toggle="tab"
                        class="nav-link"
                        href="#dashboard"
                        >메인페이지</a
                      >
                    </li>
                    <li class="nav-item">
                      <a data-bs-toggle="tab" class="nav-link" href="#profile"
                        >프로필수정</a
                      >
                    </li>
                    <li class="nav-item">
                      <a data-bs-toggle="tab" class="nav-link" href="#write"
                        >작성한 글</a
                      >
                    </li>
                    <li class="nav-item">
                      <a data-bs-toggle="tab" class="nav-link" href="#trace"
                        >나의 발자취</a
                      >
                    </li>
                    <li class="nav-item">
                      <a data-bs-toggle="tab" class="nav-link" href="#wishlist"
                        >여행지 담기</a
                      >
                    </li>
                    <li class="nav-item">
                      <a data-bs-toggle="tab" class="nav-link" href="#inquiry"
                        >작성한 문의 내역</a
                      >
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-9">
            <div class="product_img_scroll" data-sticky_column>
              <div class="faq-content tab-content" id="top-tabContent">
                <div class="tab-pane fade show active" id="dashboard">
                  <div class="dashboard-main">
                    <div class="dashboard-intro">
                    <h5>어서오세요! ${userVO.user_name} 님</h5>

                      <p>인사말</p>
                      <div class="complete-profile">
                        <div class="row">
                          <div class="col-xl-4">
                            <div class="complete-box">
                              <i class="far fa-check-square"></i>
                              <h6>작성한 리뷰 개수 </br> ${touroviewCount} </h6>
                            </div>
                          </div>
                          <div class="col-xl-4">
                            <div class="complete-box">
                              <i class="far fa-check-square"></i>
                              <h6>작성한 댓글 개수 </br> ${tourReviewCount}</h6>
                            </div>
                          </div>
                          <div class="col-xl-4">
                            <div class="complete-box">
                              <i class="far fa-check-square"></i>
                              <h6>여행지 담은 개수 </br> ${touroWishCount}</h6>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="counter-section">
                      <div class="row">
                        <div class="col-xl-4 col-sm-6">
                          <div class="counter-box">
                            <h3>게시글 가져오기</h3>
                            <h3>${touroMateCount}</h3>
                            <h5>여행친구</h5>
                          </div>
                        </div>
                        <div class="col-xl-4 col-sm-6">
                          <div class="counter-box">
                            <h3>게시글 가져오기</h3>
                            <h3>${touroviewCount}</h3>
                            <h5>여행 후기</h5>
                          </div>
                        </div>
                        <div class="col-xl-4 col-sm-6">
                          <div class="counter-box">
                            <h3>게시글 가져오기</h3>
                            <h3>${receiptCount}</h3>
                            <h5>나의 발자취</h5>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="footprints-section">
                      <h3>나의 발자취 걸음</h3>
                      <p id="stepCount">현재 발걸음 수: <span>${receiptCount}</span> 걸음</p>
                      <div id="footprints">
                      </div>
                    </div>
                  </div>
                </div>
                





                <!-- 프로필 수정 페이지 -->
                <div class="tab-pane fade" id="profile">
                  <div class="dashboard-box">
                    <div
                      class="dashboard-title d-flex justify-content-between align-items-center"
                    >
                      <h4>프로필</h4>
                      <span
                        data-bs-toggle="modal"
                        data-bs-target="#profileModal"
                        >수정</span
                      >
                    </div>
                    <div class="profile-image mb-4" >
                      <img
                        src="../assets/images/profile/${profileImage}"
                        class="img-fluid blur-up lazyload"
                        alt=""
                        width="200"
                      />
                    </div>
                    <div class="dashboard-detail">
                      <ul class="list-unstyled">
                        <!-- 아이디 -->
                        <li class="d-flex justify-content-between mb-4">
                          <span>아이디</span>
                          <span>${sessionScope.loggedId}</span>
                        </li>
                        <!-- 생년월일 -->
                        <li class="d-flex justify-content-between mb-4">
                          <span>나이</span>
                          <span>${userVO.user_age}</span>
                        </li>
                        <!-- 성별 -->
                        <li class="d-flex justify-content-between mb-4">
                          <span>성별</span>
                          <span>${userVO.user_gender}</span>
                        </li>
                        <!-- 전화번호 -->
                        <li class="d-flex justify-content-between mb-4">
                          <span>전화번호</span>
                          <span>${userVO.user_tel}</span>
                        </li>
                        <!-- 메일주소 -->
                        <li class="d-flex justify-content-between mb-4">
                          <span>메일 주소</span>
                          <span>${userVO.user_email}</span>
                        </li>
                        <!-- 주소 -->
                        <li class="d-flex justify-content-between mb-4">
                          <span>주소</span>
                          <span>${userVO.user_addr}</span>
                        </li>
                        <!-- 전화번호 -->
                        <li class="d-flex justify-content-between mb-4">
                          <span>전화번호</span>
                          <span>${userVO.user_tel}</span>
                        </li>
                        <!-- 여행 취향 -->
                        <li class="d-flex justify-content-between mb-4">
                          <span>선호 여행 유형</span>
                          <span>${userVO.user_prefer_type1}</span>
                          <span>${userVO.user_prefer_type2}</span>
                          <span>${userVO.user_prefer_type3}</span>
                        </li>
                        <!-- 여행지 취향 -->
                        <li class="d-flex justify-content-between mb-4">
                          <span>선호 여행지</span>
                          <span><c:choose>
                            <c:when test="${userVO.user_prefer_loc1 == '1.0'}">서울</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '2.0'}">인천</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '3.0'}">대전</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '4.0'}">대구</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '5.0'}">광주</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '6.0'}">부산</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '7.0'}">울산</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '8.0'}">세종특별자치시</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '31.0'}">경기도</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '32.0'}">강원특별자치도</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '33.0'}">충청북도</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '34.0'}">충청남도</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '35.0'}">경상북도</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '36.0'}">경상남도</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '37.0'}">전라북도</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '38.0'}">전라남도</c:when>
                              <c:when test="${userVO.user_prefer_loc1 == '39.0'}">제주도</c:when>
                              <c:otherwise>${userVO.user_prefer_loc1}</c:otherwise>
                          </c:choose></span>
                          <span><c:choose>
                            <c:when test="${userVO.user_prefer_loc2 == '1.0'}">서울</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '2.0'}">인천</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '3.0'}">대전</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '4.0'}">대구</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '5.0'}">광주</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '6.0'}">부산</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '7.0'}">울산</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '8.0'}">세종특별자치시</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '31.0'}">경기도</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '32.0'}">강원특별자치도</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '33.0'}">충청북도</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '34.0'}">충청남도</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '35.0'}">경상북도</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '36.0'}">경상남도</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '37.0'}">전라북도</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '38.0'}">전라남도</c:when>
                              <c:when test="${userVO.user_prefer_loc2 == '39.0'}">제주도</c:when>
                              <c:otherwise>${userVO.user_prefer_loc2}</c:otherwise>
                          </c:choose></span>
                          <span><c:choose>
                            <c:when test="${userVO.user_prefer_loc3 == '1.0'}">서울</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '2.0'}">인천</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '3.0'}">대전</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '4.0'}">대구</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '5.0'}">광주</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '6.0'}">부산</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '7.0'}">울산</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '8.0'}">세종특별자치시</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '31.0'}">경기도</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '32.0'}">강원특별자치도</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '33.0'}">충청북도</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '34.0'}">충청남도</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '35.0'}">경상북도</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '36.0'}">경상남도</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '37.0'}">전라북도</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '38.0'}">전라남도</c:when>
                              <c:when test="${userVO.user_prefer_loc3 == '39.0'}">제주도</c:when>
                              <c:otherwise>${userVO.user_prefer_loc3}</c:otherwise>
                          </c:choose></span>

                        </li>
                        
                      </ul>
                    </div>
                  </div>
                </div>

                <!-- 작성한 글 -->
                <!-- 여행친구찾기 -->
                <div class="tab-pane fade" id="write">
                  <div class="dashboard-box" id="touromate" >
                    <div class="dashboard-title">
                      <h4>작성한 여행친구찾기</h4>
                    </div>
                    <div class="dashboard-detail">
                    <c:forEach var="touromate" items="${touroMateVO}">
                      <div class="booking-box">
                        <div class="detail-middle">
                          <div class="media">
                            <div class="icon"></div>
                            <div class="media-body">
                              <h6 class="media-heading">${touromate.touro_mate_title}</h6>
                            </div>
                            <div class="media-body">
                              <h6 class="media-heading">${touromate.user_id}</h6>
                              <p>${touromate.touro_mate_date}</span></p>
                            </div>
                          </div>
                        </div>
                        <div class="detail-last">
                          <a a href="/touromate/touromate_detail?touro_mate_num=${touromate.touro_mate_num}" class="badge bg-info">게시물 보기</a>
                        </div>
                      </div> 
                    </c:forEach>
                    </div>
                  </div>
                  <!-- 작성한 게시물 페이징 컨트롤 -->
                  <div class="pagination pagination-right">
                    <c:forEach begin="1" end="${totalTouroMatePages}" var="pageNum">
                        <a href="javascript:loadTouroMateData(${pageNum})">${pageNum}</a>
                    </c:forEach>
                </div>

                <!-- 여행지후기 -->
                <div class="dashboard-box" id="touroview" >
                  <div class="dashboard-title">
                    <h4>작성한 게시물</h4>
                  </div>
                  <div class="dashboard-detail">
                  <c:forEach var="touroview" items="${touroviewVO}">
                    <div class="booking-box">
                      <div class="detail-middle">
                        <div class="media">
                          <div class="icon"></div>
                          <div class="media-body">
                            <h6 class="media-heading">${touroview.touroview_title}</h6>
                          </div>
                          <div class="media-body">
                            <h6 class="media-heading">${touroview.user_id}</h6>
                            <p>${touroview.touroview_regdate}</span></p>
                          </div>
                        </div>
                      </div>
                      <div class="detail-last">
                        <a href="/touroview/touroview_detail?touroview_num=${touroview.touroview_num}" class="badge bg-info">
                          게시물 보기
                        </a>
                        </div>
                    </div> 
                  </c:forEach>
                  </div>
                </div>
                <!-- 작성한 게시물 페이징 컨트롤 -->
                <div class="pagination pagination-right">
                  <c:forEach begin="1" end="${totalTouroviewPages}" var="pageNum">
                      <a href="javascript:loadTouroviewData(${pageNum})">${pageNum}</a>
                  </c:forEach>
              </div>
            
                  <!-- 여행 후기 댓글-->
                  <div class="dashboard-box" id="review">
                    <div class="dashboard-title">
                      <h4>작성한 여행후기 댓글</h4>
                    </div>
                    <div class="dashboard-detail">
                    <c:forEach var="touroviewreview" items="${touroviewReviewVO}" varStatus="status">
                      <div class="booking-box">
                        <div class="detail-middle">
                          <div class="media">
                            <div class="icon"></div>
                            <div class="media-body">
                              <h6 class="media-heading">${touroviewreview.touroview_review_content}</h6>
                            </div>
                            <div class="media-body">
                              <h6 class="media-heading">${touroviewreview.user_id}</h6>
                              <p>${touroviewreview.touroview_review_register_date}</span></p>
                            </div>
                          </div>
                        </div>
                        <div class="detail-last">
                          <a href="/touroview/touroview_detail?touroview_num=${touroviewreview.touroview_num}" class="badge bg-secondary">
                            댓글 보기
                          </a>                       
                        </div>
                      </div>
                      </c:forEach>
                    </div>
                  </div>
                  <!-- 작성한 리뷰 페이징 컨트롤 -->
                    <!-- 작성한 리뷰 페이징 컨트롤 -->
                     <div class="pagination pagination-right" id="review" >
                        <c:forEach begin="1" end="${totalTouroviewReviewPages}" var="reviewPageNum">
                            <a href="javascript:loadTouroviewReviewData(${reviewPageNum})">${reviewPageNum}</a>
                        </c:forEach>
                    </div>


                    <!-- 여행지 댓글 -->
                  <div class="dashboard-box" id="comment">
                    <div class="dashboard-title">
                      <h4>작성한 여행지 댓글</h4>
                    </div>
                    <div class="dashboard-detail">
                    <c:forEach var="tourreview" items="${tourReviewVO}" varStatus="status">
                      <div class="booking-box">
                        <div class="detail-middle">
                          <div class="media">
                            <div class="icon"></div>
                            <div class="media-body">
                              <h6 class="media-heading">${tourreview.tour_review_content}</h6>
                            </div>
                            <div class="media-body">
                              <h6 class="media-heading">${tourreview.user_id}</h6>
                              <p>${tourreview.tour_review_star}</span></p>
                            </div>
                          </div>
                        </div>
                        <div class="detail-last">
                          <a href="/touro/${tourreview.tour_num}" class="badge bg-secondary">
                            댓글보기
                          </a>                        
                      </div>
                      </div>
                   </c:forEach>
                  </div>
                </div>
                <!-- 작성한 댓글 페이징 컨트롤 -->
                <div class="pagination pagination-right" id="comment">
                  <c:forEach begin="1" end="${totalTourReviewPages}" var="commentPageNum">
                      <a href="javascript:loadTourReviewData(${commentPageNum})">${commentPageNum}</a>
                  </c:forEach>
              </div>
            </div>                


                <!-- 나의 발자취 페이지 -->
                <div class="tab-pane fade" id="trace">
                  <div class="dashboard-box">
                    <div class="row">
                      <div class="dashboard-title col-6">
                        <h4>나의 발자취</h4>
                      </div>
                      <div
                        class="dashboard-title col"
                        style="justify-content: right"
                      >
                        <a href="user/appReview">영수증 앱 리뷰</a>
                      </div>
                      <div
                        class="dashboard-title col"
                        style="justify-content: right"
                      >
                        <%-- <span
                          data-bs-toggle="modal"
                          data-bs-target="#edit-address"
                          >영수증 리뷰 작성
                        </span> --%>
                      </div>
                    </div>

                    <!-- 카카오 지도 --> 
                    <div id="kakao-map" style="width:100%; height:400px;"></div>

                    <div
                      class="product-wrapper-grid ratio3_2 special-section grid-box">
                      <div id="receiptItems" class="row content grid">
                        <!-- 여기에 receipt 목록 -->
                      <c:forEach var="receipt" items="${receiptVO}" varStatus="status">
                        <div class="col-xl-4 col-sm-6 grid-item">
                          <div class="special-box">
                            <div class="special-img">
                              <a href="">
                                <!-- 이미지 -->
                                <img class="img-fluid blur-up lazyload bg-img fixed-size-img"/>
                              </a>
                              <div class="content_inner">
                                <!-- 여행지 주소-->
                                <h5>${receipt.receipt_business_addr}</h5>
                                <!-- 여행지 제목-->
                                <a href="/tourDetail/${receipt.tour_num}">
                                  <h5>${receipt.receipt_name}</h5>
                                </a>
                                <h6>${receipt.receipt_date}</h6>
                              </div>
                              <div class="top-icon">
                              </div>
                            </div>
                          </div>
                        </div> 
                      </c:forEach>
                    </div>
                    <div class="pagination-container">
                      <nav aria-label="Page navigation">
                        <ul class="pagination" id="receiptPagination">
                          <li class="page-item"><a class="page-link" href="#" data-page="1">1</a></li>
                        </ul>
                      </nav>
                    </div>
                      </div>
                    </div>
                  </div>

                <!-- 여행지 담기 페이지 -->
                <div class="tab-pane fade" id="wishlist">
                  <div class="dashboard-box">
                    <div class="dashboard-title">
                      <h4>내가 담은 여행지</h4>
                    </div>

                    <div
                      id="wishListContainer" class="product-wrapper-grid ratio3_2 special-section grid-box" >
                      <div id="wishListItems" class="row content grid">
                      <!-- 여기에 WishlistVO 목록 표시 --> 
                       <c:forEach var="wishList" items="${wishListVO}" varStatus="status">
                        <div class="col-xl-4 col-sm-6 grid-item">
                              <div class="special-box">
                                  <div class="special-img" style="height: 200px;">
                                      <a href="/touro/${wishList.tour_num}">
                                        <img src="../${wishList.tour_img1_path}" class="img-fluid blur-up lazyload"
                                        alt="" />
                                      </a>
                                      <div class="content_inner">
                                          <a href="/touro/${wishList.tour_num}">
                                              <h5>${wishList.tour_name}</h5>
                                          </a>
                                      </div>
                                      <!-- 삭제 아이콘 -->
                                      <div class="top-icon">
                                          <a href="#" class=""
                                            data-bs-toggle="tooltip"
                                            data-placement="top"
                                            title="Remove from Wishlist">
                                              <i class="fas fa-times"></i>
                                          </a>
                                      </div>
                                  </div>
                              </div>
                          </div>
                        </c:forEach>
                      </div>
                    <div class="pagination-container">
                      <nav aria-label="Page navigation">
                        <ul class="pagination" id="wishlistPagination">
                          <li class="page-item"><a class="page-link" href="#" data-page="1">1</a></li>
                        </ul>
                      </nav>
                    </div>
                  </div>
                </div>
              </div>


                <!--작성한 문의 내역 -->
                <div class="tab-pane fade" id="inquiry">
                  <div class="dashboard-main">
                    <div class="dashboard-intro" style="width: 270px; background-color: #ebebeb">
                        <h5>문의내역</h5>
                    </div>
                      <div id="inquiryItems"class="row">
                          <c:forEach var="inquiry" items="${inquiryVO}" varStatus="status">
                              <div class="col-md-12">
                                  <div class="card mb-4">
                                    <div class="card-body">
                                      <!-- 문의 내용 열 -->
                                        <!-- 클릭 가능한 제목 -->
                                        <h5 class="card-title toggle-title inquiry-title" onclick="toggleInquiryDetails('details-${inquiry.inquiry_num}', event)">
                                          제목: ${inquiry.inquiry_title}                   
                                          <span class="inquiry-date" >${inquiry.inquiry_regdate}</span>
                                        </h5>

                                        <!-- 숨겨진 문의 내용 및 답변 -->
                                        <div id="details-${inquiry.inquiry_num}" style="display: none;">
                                        <p class="card-text inquiry-content" style="font-size: 18px;" >문의 내용: ${inquiry.inquiry_content}</p>
                                        <p class="card-text">답변 여부: 
                                          <span class="${inquiry.inquiry_process == 1 ? 'inquiry-answered' : 'inquiry-pending'}">
                                            ${inquiry.inquiry_process == 1 ? '답변 완료' : '답변 대기'}
                                              </span>
                                            </p>
                                            <div class="inquiry-response" style="font-size: 18px;">답변 내용: ${inquiry.inquiry_review_content}</div>
                                          </div>
                                      </div>
                                  </div>
                              </div>
                        </c:forEach>
                      </div>
                      <div class="pagination-container">
                        <nav aria-label="Page navigation">
                          <ul class="pagination" id="inquiryPagination">
                            <li class="page-item"><a class="page-link" href="#" data-page="1">1</a></li>
                          </ul>
                        </nav>
                      </div>
                  </div>
                </div>
    </section>
    <!-- section end-->

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

    <!-- edit profile modal start -->
    <div
      class="modal fade edit-profile-modal"
      id="profileModal"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="exampleModalLabel">프로필 수정</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form id="profileForm">
              <div class="row">
                <div class="form-group col-md-6" >
                  <label for="profileImage" >프로필 사진</label>
                  <input type="file" class="form-control" id="profileImage" accept="image/*" onchange="previewImage()" />
                  <img id="imagePreview" src="#" alt="프로필 미리보기" style="display: none; max-width: 100%; margin-top: 10px;">
                </div>

              <div class="row">
                <div class="form-group col-md-6">
                  <label for="userId">아이디</label>
                  <input
                    type="text"
                    class="form-control"
                    id="userId"
                    placeholder="아이디"
                    value="${userVO.user_id}" readonly
                  />
                </div>
                <div class="form-group col-md-6">
                  <label for="userTel">전화번호</label>
                  <input
                    type="text"
                    class="form-control"
                    id="userTel"
                    placeholder="전화번호"
                    value="${userVO.user_tel}"
                  />
                </div>
                <div class="form-group col-md-6">
                  <label>나이</label>
                  <input
                    type="text"
                    class="form-control"
                    placeholder="나이"
                    id="userAge"
                    value="${userVO.user_age}"
                  />
                </div>
                <div class="form-group col-md-6">
                  <label for="inputEmail">메일주소</label>
                  <input type="text" class="form-control" id="userEmail" value="${userVO.user_email}"/>
                </div>
                <div class="form-group col-md-6">
                  <label for="inputState1">선호 여행 유형1</label>
                  <select id="inputState1" class="form-control">
                      <option value="관광지" ${userVO.user_prefer_type1 == '관광지' ? 'selected' : ''}>관광지</option>
                      <option value="음식점" ${userVO.user_prefer_type1 == '음식점' ? 'selected' : ''}>음식점</option>
                      <option value="숙박" ${userVO.user_prefer_type1 == '숙박' ? 'selected' : ''}>숙박</option>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="inputarea1">선호 여행지1</label>
                  <select id="inputarea1" class="form-control">
                    <option value="1.0" ${userVO.user_prefer_loc1 == '1.0' ? 'selected' : ''}>서울</option>
                    <option value="2.0" ${userVO.user_prefer_loc1 == '2.0' ? 'selected' : ''}>인천</option>
                    <option value="3.0" ${userVO.user_prefer_loc1 == '3.0' ? 'selected' : ''}>대전</option>
                    <option value="4.0" ${userVO.user_prefer_loc1 == '4.0' ? 'selected' : ''}>대구</option>
                    <option value="5.0" ${userVO.user_prefer_loc1 == '5.0' ? 'selected' : ''}>광주</option>
                    <option value="6.0" ${userVO.user_prefer_loc1 == '6.0' ? 'selected' : ''}>부산</option>
                    <option value="7.0" ${userVO.user_prefer_loc1 == '7.0' ? 'selected' : ''}>울산</option>
                    <option value="8.0" ${userVO.user_prefer_loc1 == '8.0' ? 'selected' : ''}>세종특별자치시</option>
                    <option value="31.0" ${userVO.user_prefer_loc1 == '31.0' ? 'selected' : ''}>경기도</option>
                    <option value="32.0" ${userVO.user_prefer_loc1 == '32.0' ? 'selected' : ''}>강원도</option>
                    <option value="33.0" ${userVO.user_prefer_loc1 == '33.0' ? 'selected' : ''}>충청북도</option>
                    <option value="34.0" ${userVO.user_prefer_loc1 == '34.0' ? 'selected' : ''}>충청남도</option>
                    <option value="35.0" ${userVO.user_prefer_loc1 == '35.0' ? 'selected' : ''}>경상북도</option>
                    <option value="36.0" ${userVO.user_prefer_loc1 == '36.0' ? 'selected' : ''}>경상남도</option>
                    <option value="37.0" ${userVO.user_prefer_loc1 == '37.0' ? 'selected' : ''}>전라북도</option>
                    <option value="38.0" ${userVO.user_prefer_loc1 == '38.0' ? 'selected' : ''}>전라남도</option>
                    <option value="39.0" ${userVO.user_prefer_loc1 == '39.0' ? 'selected' : ''}>제주도</option>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="inputState2">선호 여행 유형2</label>
                  <select id="inputState2" class="form-control">
                    <option value="관광지" ${userVO.user_prefer_type2 == '관광지' ? 'selected' : ''}>관광지</option>
                    <option value="음식점" ${userVO.user_prefer_type2 == '음식점' ? 'selected' : ''}>음식점</option>
                    <option value="숙박" ${userVO.user_prefer_type2 == '숙박' ? 'selected' : ''}>숙박</option>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="inputarea2">선호 여행지2</label>
                  <select id="inputarea2" class="form-control">
                    <option value="1.0" ${userVO.user_prefer_loc2 == '1.0' ? 'selected' : ''}>서울</option>
                    <option value="2.0" ${userVO.user_prefer_loc2 == '2.0' ? 'selected' : ''}>인천</option>
                    <option value="3.0" ${userVO.user_prefer_loc2 == '3.0' ? 'selected' : ''}>대전</option>
                    <option value="4.0" ${userVO.user_prefer_loc2 == '4.0' ? 'selected' : ''}>대구</option>
                    <option value="5.0" ${userVO.user_prefer_loc2 == '5.0' ? 'selected' : ''}>광주</option>
                    <option value="6.0" ${userVO.user_prefer_loc2 == '6.0' ? 'selected' : ''}>부산</option>
                    <option value="7.0" ${userVO.user_prefer_loc2 == '7.0' ? 'selected' : ''}>울산</option>
                    <option value="8.0" ${userVO.user_prefer_loc2 == '8.0' ? 'selected' : ''}>세종특별자치시</option>
                    <option value="31.0" ${userVO.user_prefer_loc2 == '31.0' ? 'selected' : ''}>경기도</option>
                    <option value="32.0" ${userVO.user_prefer_loc2 == '32.0' ? 'selected' : ''}>강원도</option>
                    <option value="33.0" ${userVO.user_prefer_loc2 == '33.0' ? 'selected' : ''}>충청북도</option>
                    <option value="34.0" ${userVO.user_prefer_loc2 == '34.0' ? 'selected' : ''}>충청남도</option>
                    <option value="35.0" ${userVO.user_prefer_loc2 == '35.0' ? 'selected' : ''}>경상북도</option>
                    <option value="36.0" ${userVO.user_prefer_loc2 == '36.0' ? 'selected' : ''}>경상남도</option>
                    <option value="37.0" ${userVO.user_prefer_loc2 == '37.0' ? 'selected' : ''}>전라북도</option>
                    <option value="38.0" ${userVO.user_prefer_loc2 == '38.0' ? 'selected' : ''}>전라남도</option>
                    <option value="39.0" ${userVO.user_prefer_loc2 == '39.0' ? 'selected' : ''}>제주도</option>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="inputState3">선호 여행 유형3</label>
                  <select id="inputState3" class="form-control">
                    <option value="관광지" ${userVO.user_prefer_type3 == '관광지' ? 'selected' : ''}>관광지</option>
                    <option value="음식점" ${userVO.user_prefer_type3 == '음식점' ? 'selected' : ''}>음식점</option>
                    <option value="숙박" ${userVO.user_prefer_type3 == '숙박' ? 'selected' : ''}>숙박</option>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label for="inputarea3">선호 여행지3</label>
                  <select id="inputarea3" class="form-control">
                    <option value="1.0" ${userVO.user_prefer_loc3 == '1.0' ? 'selected' : ''}>서울</option>
                    <option value="2.0" ${userVO.user_prefer_loc3 == '2.0' ? 'selected' : ''}>인천</option>
                    <option value="3.0" ${userVO.user_prefer_loc3 == '3.0' ? 'selected' : ''}>대전</option>
                    <option value="4.0" ${userVO.user_prefer_loc3 == '4.0' ? 'selected' : ''}>대구</option>
                    <option value="5.0" ${userVO.user_prefer_loc3 == '5.0' ? 'selected' : ''}>광주</option>
                    <option value="6.0" ${userVO.user_prefer_loc3 == '6.0' ? 'selected' : ''}>부산</option>
                    <option value="7.0" ${userVO.user_prefer_loc3 == '7.0' ? 'selected' : ''}>울산</option>
                    <option value="8.0" ${userVO.user_prefer_loc3 == '8.0' ? 'selected' : ''}>세종특별자치시</option>
                    <option value="31.0" ${userVO.user_prefer_loc3 == '31.0' ? 'selected' : ''}>경기도</option>
                    <option value="32.0" ${userVO.user_prefer_loc3 == '32.0' ? 'selected' : ''}>강원도</option>
                    <option value="33.0" ${userVO.user_prefer_loc3 == '33.0' ? 'selected' : ''}>충청북도</option>
                    <option value="34.0" ${userVO.user_prefer_loc3 == '34.0' ? 'selected' : ''}>충청남도</option>
                    <option value="35.0" ${userVO.user_prefer_loc3 == '35.0' ? 'selected' : ''}>경상북도</option>
                    <option value="36.0" ${userVO.user_prefer_loc3 == '36.0' ? 'selected' : ''}>경상남도</option>
                    <option value="37.0" ${userVO.user_prefer_loc3 == '37.0' ? 'selected' : ''}>전라북도</option>
                    <option value="38.0" ${userVO.user_prefer_loc3 == '38.0' ? 'selected' : ''}>전라남도</option>
                    <option value="39.0" ${userVO.user_prefer_loc3 == '39.0' ? 'selected' : ''}>제주도</option>
                  </select>
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              닫기
            </button>
            <button type="button" class="btn btn-solid" onclick="updateProfile()">변경하기</button>
          </div>
        </div>
      </div>
    </div>
    <!-- edit profile modal start -->

    <!-- 영수증 리뷰 모달 -->
    <!-- edit address modal start -->
    <div
      class="modal fade edit-profile-modal"
      id="edit-address"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">영수증 리뷰 등록</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form>
              <div class="row">
                <div class="form-group col-12">
                  <label for="old">영수증 이미지 파일 업로드</label>
                </div>
                <div
                  class="dropzone"
                  id="singleFileUpload"
                  style="margin-bottom: 10px"
                >
                  <div class="dz-message needsclick">
                    <i class="icon-cloud-up"></i>
                    <h6>Drop files here or click to upload.</h6>
                  </div>
                </div>
                <div class="form-group col-12">
                  <label for="old">사업자번호</label>
                  <input type="text" class="form-control" id="old" />
                </div>
                <div class="form-group col-12">
                  <label for="new">주소</label>
                  <input type="text" class="form-control" id="new" />
                </div>
                <div class="form-group col-12">
                  <label for="comfirm">리뷰 내용</label>
                  <input type="text" class="form-control" id="comfirm" />
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              취소
            </button>
            <button type="button" class="btn btn-solid">등록하기</button>
          </div>
        </div>
      </div>
    </div>
    <!-- edit address modal start -->

    <!-- edit phone no modal start -->
    <div
      class="modal fade edit-profile-modal"
      id="edit-phone"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">change phone no</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form>
              <div class="row">
                <div class="form-group col-12">
                  <label for="ph-o">old phone no</label>
                  <input type="number" class="form-control" id="ph-o" />
                </div>
                <div class="form-group col-12">
                  <label for="ph-n">enter new phone no</label>
                  <input type="number" class="form-control" id="ph-n" />
                </div>
                <div class="form-group col-12">
                  <label for="ph-c">confirm your phone no</label>
                  <input type="number" class="form-control" id="ph-c" />
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button type="button" class="btn btn-solid">Save changes</button>
          </div>
        </div>
      </div>
    </div>
    <!-- edit phone no modal start -->

    <!-- edit password modal start -->
    <div
      class="modal fade edit-profile-modal"
      id="edit-password"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">change email address</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form>
              <div class="row">
                <div class="form-group col-12">
                  <label for="p-o">old password</label>
                  <input type="email" class="form-control" id="p-o" />
                </div>
                <div class="form-group col-12">
                  <label for="p-n">enter new password</label>
                  <input type="email" class="form-control" id="p-n" />
                </div>
                <div class="form-group col-12">
                  <label for="p-c">confirm your password</label>
                  <input type="email" class="form-control" id="p-c" />
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button type="button" class="btn btn-solid">Save changes</button>
          </div>
        </div>
      </div>
    </div>
    <!-- edit password modal start -->

    <!-- edit password modal start -->
    <div
      class="modal fade edit-profile-modal"
      id="edit-card"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">edit your card</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="name">name on card</label>
                <input
                  type="text"
                  class="form-control"
                  id="name"
                  placeholder="Mark jecno"
                />
              </div>
              <div class="form-group">
                <label for="number">card number</label>
                <input
                  type="text"
                  class="form-control"
                  id="number"
                  placeholder="7451 2154 2115 2510"
                />
              </div>
              <div class="row">
                <div class="form-group col-md-8">
                  <label for="expiry">expiry date</label>
                  <input
                    type="text"
                    class="form-control"
                    id="expiry"
                    placeholder="12/23"
                  />
                </div>
                <div class="form-group col-md-4">
                  <label for="cvv">cvv</label>
                  <input
                    type="password"
                    maxlength="3"
                    class="form-control"
                    id="cvv"
                    placeholder="&#9679;&#9679;&#9679;"
                  />
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button type="button" class="btn btn-solid">update card</button>
          </div>
        </div>
      </div>
    </div>
    <!-- edit password modal start -->

    <!-- add card modal start -->
    <div
      class="modal fade edit-profile-modal"
      id="add-card"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">add new card</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <form>
              <div class="form-group">
                <label for="a-month">card type</label>
                <select id="a-month" class="form-control">
                  <option selected>add new card...</option>
                  <option>credit card</option>
                  <option>debit card</option>
                  <option>debit card with ATM pin</option>
                </select>
              </div>
              <div class="form-group">
                <label for="a-na">name on card</label>
                <input type="text" class="form-control" id="a-na" />
              </div>
              <div class="form-group">
                <label for="a-n">card number</label>
                <input type="text" class="form-control" id="a-n" />
              </div>
              <div class="row">
                <div class="form-group col-md-8">
                  <label for="a-e">expiry date</label>
                  <input type="text" class="form-control" id="a-e" />
                </div>
                <div class="form-group col-md-4">
                  <label for="a-c">cvv</label>
                  <input
                    type="password"
                    maxlength="3"
                    class="form-control"
                    id="a-c"
                  />
                </div>
              </div>
            </form>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button type="button" class="btn btn-solid">add card</button>
          </div>
        </div>
      </div>
    </div>
    <!-- edit password modal start -->

    <!-- add card modal start -->
    <div
      class="modal fade edit-profile-modal"
      id="delete-account"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title">Account deletion request</h5>
            <button
              type="button"
              class="btn-close"
              data-bs-dismiss="modal"
              aria-label="Close"
            ></button>
          </div>
          <div class="modal-body">
            <p class="text-dark">
              Before you leave, please tell us why you'd like to delete your
              Rica account. This information will help us improve. (optional)
            </p>
            <form>
              <textarea
                class="form-control"
                id="exampleFormControlTextarea1"
                rows="3"
              ></textarea>
            </form>
          </div>
          <div class="modal-footer">
            <button
              type="button"
              class="btn btn-secondary"
              data-bs-dismiss="modal"
            >
              Close
            </button>
            <button type="button" class="btn btn-solid">
              delete my account
            </button>
          </div>
        </div>
      </div>
    </div>
    <!-- edit password modal start -->

    <!-- latest jquery-->
    <script src="../assets/js/jquery-3.5.1.min.js"></script>

    <!-- slick js-->
    <script src="../assets/js/slick.js"></script>

    <!-- date-time picker js -->
    <script src="../assets/js/date-picker.js"></script>

    <!-- stick section js -->
    <script src="../assets/js/sticky-kit.js"></script>

    <!-- stick section js -->
    <script src="../assets/js/apexcharts.js"></script>
    <script src="../assets/js/chart.js"></script>

    <!-- Bootstrap js-->
    <script src="../assets/js/bootstrap.bundle.min.js"></script>

    <!-- lazyload js-->
    <script src="../assets/js/lazysizes.min.js"></script>
    
    <!-- 휴대폰 영수증 리뷰 앱 관련 js-->
    <script src="../assets/js/moblieApp.js"></script>

    <!-- Theme js-->
    <script src="../assets/js/script.js"></script>

    <!-- 카카오 지도 api 관련-->
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1a31af6306655331640942e32b2f74d3&libraries=services,clusterer"></script>


    <!-- 나의 발자취 (카카오 지도 생성 코드) -->
   
    <script>
      setTimeout(function() {
      var mapContainer = document.getElementById('kakao-map'); // 지도를 표시할 div
      mapContainer.style.display = 'block';
      mapOption = {
          center: new kakao.maps.LatLng(37.5665, 126.9780), // 지도의 중심좌표
          level: 3 // 지도의 확대 레벨
      };

      var map = new kakao.maps.Map(mapContainer, mapOption); // 지도 생성
      
       // 윈도우 크기가 변경될 때 지도 크기를 조정
      window.addEventListener('resize', function() {
          mapContainer.style.height = '400px';
          map.relayout();
      });
        

      // 주소-좌표 변환 객체를 생성
      var geocoder = new kakao.maps.services.Geocoder();

      // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성
      var bounds = new kakao.maps.LatLngBounds();

      // 여러 장소에 대한 정보를 배열로 정의
      var positions = [];

      // 서버에서 데이터 비동기적으로 받아오기
      $.ajax({
          type: 'GET',
          url: '/user/mypage/getReceiptsmarker',
          success: function(data) {
            console.log("data >>> " + JSON.stringify(data));
              positions = data;

              // 받아온 데이터를 이용하여 지도에 마커 찍기
              positions.forEach(function(position) {
                  geocoder.addressSearch(
                      position.address,
                      function(result, status) {
                          if (status === kakao.maps.services.Status.OK) {
                              var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                              var marker = new kakao.maps.Marker({
                                  map: map,
                                  position: coords,
                              });
                              marker.setMap(map);

                              bounds.extend(coords);

                              var infowindow = new kakao.maps.InfoWindow({
                                  content: '<div style="width:150px;text-align:center;padding:6px 0;">' +
                                      position.title + "</div>",
                              });
                              infowindow.open(map, marker);
                              setBounds();
                          }
                      }
                  );
              });
          },
          error: function() {
              console.error('Failed to fetch data.');
          }
      });

              function setBounds() {
                  map.setBounds(bounds);
              }
          }, 1500);
</script>


    <!-- Dropzone | 영수증 리뷰 사진 올리기 --> 
    <script>
      Dropzone.autoDiscover = false; // deprecated 된 옵션. false로 해놓는걸 공식문서에서 명시

      const dropzone = new Dropzone("div.dropzone", {
        url: "https://httpbin.org/post",
      });
    </script>

    <script>
      $("#datepicker").datepicker({
        uiLibrary: "bootstrap4",
        format: "dd mmmm yy",
      });

      $(document).ready(function () {
        if ($(window).width() > 991) {
          $(".product_img_scroll, .pro_sticky_info").stick_in_parent();
        }
      });
    </script>

    <!-- 프로필 이미지 --> 
    <script>
      function previewImage() {
        var input = document.getElementById('profileImage');
        var preview = document.getElementById('imagePreview');

        if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
            preview.src = e.target.result;
            preview.style.display = 'block';
          };

          reader.readAsDataURL(input.files[0]);
        }
      }
    </script>

    <!-- 프로필 수정 -->
    <script>
    function updateProfile() {
    var formData = new FormData(document.getElementById('profileForm'));
    // 파일 업로드가 필요한 경우 formData.append를 사용하여 파일 데이터 추가

    $.ajax({
        url: '/user/mypage/updateProfile', // Spring Controller의 엔드포인트 URL
        type: 'POST',
        data: formData,
        processData: false,  // 필수 옵션: false로 설정
        contentType: false,  // 필수 옵션: false로 설정
        success: function(response) {
            // 업데이트 성공 시 처리
            swal("", "프로필이 업데이트되었습니다.", "success");
            // alert('프로필이 업데이트되었습니다.');
        },
        error: function(xhr, status, error) {
            // 업데이트 실패 시 처리
            swal("", "서버와의 통신 중 오류가 발생했습니다.", "error");
            // alert('업데이트 실패: ' + error);
        }
    });
}


    </script>



    <!-- 채팅..? -->
    <script th:inline="javascript">
        /*<![CDATA[*/
        function submitInquiry() {
            var chatInput = $("#inquiryInput").val();

            if (chatInput) {
                // 사용자가 입력한 채팅을 채팅창에 추가
                $("#chatMessages").append('<div class="chat-bubble chat-user"><p>' + chatInput + '</p></div>');

                // 서버에 문의 제출
                $.ajax({
                    type: "POST",
                    url: "/submitInquiry",
                    data: { inquiryContent: chatInput },
                    success: function () {
                        // 성공적으로 제출되었을 때 처리
                        console.log("Inquiry submitted successfully.");
                    },
                    error: function () {
                        // 오류가 발생했을 때 처리
                        console.error("Failed to submit inquiry.");
                    }
                });

                // 입력 필드 초기화
                $("#inquiryInput").val('');

                // 맨 아래로 스크롤
                var chatMessages = $("#chatMessages");
                chatMessages.scrollTop(chatMessages[0].scrollHeight);
            }
        }
        /*]]>*/
    </script>



    <!-- 작성한 글 - 작성한 여행친구찾기 : 페이징 -->
    <script>
      function loadTouroMateData(pageNum) {
          $.ajax({
              url: '/user/mypage/matePage',
              data: { matePage: pageNum },
              success: function(data) {
                  // 서버로부터 받은 데이터로 게시물 목록 갱신
                  updateTouroMateList(data);
              },
              error: function(xhr, status, error) {
                  // 에러 처리
                  console.error("Error: " + status + " - " + error);
              }
          });
      }
  
      function updateTouroMateList(data) {
          var container = $('#touromate  .dashboard-detail'); // 게시물 목록을 담을 컨테이너
          container.empty(); // 기존 내용을 비웁니다.
  
          // 받은 데이터로 새로운 게시물 목록을 생성합니다.
          data.forEach(function(touromate) {
              var touromateHtml = '<div class="booking-box">' +
                  '<div class="detail-middle">' +
                  '<div class="media">' +
                  '<div class="icon"></div>' +
                  '<div class="media-body">' +
                  '<h6 class="media-heading">' + touromate.touro_mate_title + '</h6>' +
                  '</div>' +
                  '<div class="media-body">' +
                  '<h6 class="media-heading">' + touromate.user_id + '</h6>' +
                  '<p>' + touromate.touro_mate_date + '</p>' +
                  '</div>' +
                  '</div>' +
                  '</div>' +
                  '<div class="detail-last">' +
                  '<a href="/touromate/touromate_detail?touro_mate_num=' + touromate.touro_mate_num + '" class="badge bg-info">게시물 보기</a>' +
                  '</div>' +
                  '</div>';
              container.append(touromateHtml);
          });
  
      }
    </script>

    <!-- 작성한 글 - 작성한 게시물 : 페이징 -->
    <script>
    function loadTouroviewData(pageNum) {
        $.ajax({
            url: '/user/mypage/data',
            data: { page: pageNum },
            success: function(data) {
                // 서버로부터 받은 데이터로 게시물 목록 갱신
                updateTouroviewList(data);
            },
            error: function(xhr, status, error) {
                // 에러 처리
                console.error("Error: " + status + " - " + error);
            }
        });
    }

    function updateTouroviewList(data) {
        var container = $('#touroview .dashboard-detail'); // 게시물 목록을 담을 컨테이너
        container.empty(); // 기존 내용을 비웁니다.

        // 받은 데이터로 새로운 게시물 목록을 생성합니다.
        data.forEach(function(touroview) {
            var touroviewHtml = '<div class="booking-box">' +
                '<div class="detail-middle">' +
                '<div class="media">' +
                '<div class="icon"></div>' +
                '<div class="media-body">' +
                '<h6 class="media-heading">' + touroview.touroview_title + '</h6>' +
                '</div>' +
                '<div class="media-body">' +
                '<h6 class="media-heading">' + touroview.user_id + '</h6>' +
                '<p>' + touroview.touroview_regdate + '</p>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="detail-last">' +
                '<a href="/touroview/touroview_detail?touroview_num=' + touroview.touroview_num + '" class="badge bg-info">게시물 보기</a>' +
                '</div>' +
                '</div>';
            container.append(touroviewHtml);
        });

    }
    </script>

    <!-- 작성한 글 - 작성한 여행후기 댓글 : 페이징 -->
    <script>
        function loadTouroviewReviewData(reviewPageNum) {
        $.ajax({
            url: '/user/mypage/reviewData',
            data: { reviewPage: reviewPageNum },
            success: function(data) {
                updateTouroviewReviewList(data);
            },
            error: function(xhr, status, error) {
                console.error("Error: " + status + " - " + error);
            }
        });
    }

    function updateTouroviewReviewList(data) {
        var container = $('#review .dashboard-detail');
        container.empty();

        data.forEach(function(review) {
            var reviewHtml = '<div class="booking-box">' +
            '<div class="detail-middle">' +
            '<div class="media">' +
            '<div class="icon"></div>' + // icon 부분을 적절히 조정해야 할 수도 있습니다.
            '<div class="media-body">' +
            '<h6 class="media-heading">' + review.touroview_review_content + '</h6>' +
            '</div>' +
            '<div class="media-body">' +
            '<h6 class="media-heading">' + review.user_id + '</h6>' +
            '<p>' + review.touroview_review_register_date + '</p>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '<div class="detail-last">' +
            '<a href="/touroview/touroview_detail?touroview_num=' + touroview.touroview_num + '" class="badge bg-secondary">댓글 보기</a>' +
            '</div>' +
            '</div>';
        container.append(reviewHtml);
        });
    }
    </script>

    <script>
    // "작성한 여행지 댓글" 섹션의 페이징 데이터를 AJAX로 로드하는 함수
    function loadTourReviewData(commentPageNum) {
        $.ajax({
            url: '/user/mypage/commentData',
            data: { commentPage: commentPageNum },
            success: function(data) {
                updateTourReviewList(data);
            },
            error: function(xhr, status, error) {
                console.error("Error: " + status + " - " + error);
            }
        });
    }

    // "작성한 여행지 댓글" 섹션의 UI를 업데이트하는 함수
    function updateTourReviewList(data) {
        var container = $('#comment .dashboard-detail');
        container.empty();

        data.forEach(function(comment) {
            var commentHtml = '<div class="booking-box">' +
                '<div class="detail-middle">' +
                '<div class="media">' +
                '<div class="icon"></div>' + // icon 부분을 적절히 조정해야 할 수도 있습니다.
                '<div class="media-body">' +
                '<h6 class="media-heading">' + comment.tour_review_content + '</h6>' +
                '</div>' +
                '<div class="media-body">' +
                '<h6 class="media-heading">' + comment.user_id + '</h6>' +
                '<p>' + comment.tour_review_star + '</p>' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="detail-last">' +
                '<a href="/touro/' + comment.tour_num + '" class="badge bg-secondary">댓글보기</a>' +
                '</div>' +
                '</div>';
            container.append(commentHtml);
        });
    }
    </script>


    <!-- 여행지 담기 페이징 ajax -->
    <script>
      function createPagination(totalPages, currentPage) {
        var paginationHtml = '';
        for (var i = 1; i <= totalPages; i++) {
          paginationHtml += '<li class="page-item' + (i === currentPage ? ' active' : '') + '">' +
                              '<a class="page-link" href="#" data-page="' + i + '">' + i + '</a>' +
                            '</li>';
        }
        $('#pagination').html(paginationHtml);
      }
  
  
      // 페이지 로드 시 페이지네이션 생성
      $(document).ready(function() {
          var totalWishListPages = ${totalWishListPages}; // 서버 사이드에서 설정한 총 페이지 수
          var wishListCurrentPage = ${wishListCurrentPage}; // 서버 사이드에서 설정한 현재 페이지 번호
  
          createPagination(totalWishListPages, wishListCurrentPage, "wishlistPagination");
  
          // 페이지네이션 링크에 이벤트 리스너 바인딩
          $('#wishlistPagination').off('click').on('click', '.page-link', function(e) {
              e.preventDefault();
              var pageNum = $(this).data('page');
              loadPage(pageNum);
          });
      });
  
      function loadPage(pageNum) {
        $.ajax({
          url: '/user/mypage/wishlist', // 서버의 URL
          type: 'GET',
          data: {
            wishlistPage: pageNum
          },
          success: function(wishLists) {
            var html = '';
            $.each(wishLists, function(i, wishList) {
              html += '<div class="col-xl-4 col-sm-6 grid-item">' +
                        '<div class="special-box">' +
                          '<div class="special-img" style="height: 200px;">' +
                            '<a href="/tourDetail/' + wishList.tour_num + '">' +
                              '<img src="../' + wishList.tour_img1_path + '" class="img-fluid blur-up lazyload" alt="" />' +
                            '</a>' +
                            '<div class="content_inner">' +
                              '<a href="/tourDetail/' + wishList.tour_num + '">' +
                                '<h5>' + wishList.tour_name + '</h5>' +
                              '</a>' +
                            '</div>' +
                            '<div class="top-icon">' +
                              '<a href="#" class="" data-bs-toggle="tooltip" data-placement="top" title="Remove from Wishlist">' +
                                '<i class="fas fa-times"></i>' +
                              '</a>' +
                            '</div>' +
                          '</div>' +
                        '</div>' +
                      '</div>';
            });
            // 게시물 목록만 업데이트
            $('#wishListItems').html(html); // 게시물 목록 업데이트
          },
          error: function(error) {
            // 오류 처리
            console.log(error);
          }
        });
      }
      </script>


    <!-- 문의 내역 -->
    <script>
      // 문의 내용 및 답변 표시 토글 함수
      function toggleInquiryDetails(detailsId) {
      var element = document.getElementById(detailsId);
      if (element.style.display === "none") {
        element.style.display = "block";
      } else {
        element.style.display = "none";
      }
    }
    </script>


    <!-- 문의 내역 페이징 ajax -->
    <script>
      function createPagination(totalPages, currentPage, paginationContainerId) {
        var paginationHtml = '';
        for (var i = 1; i <= totalPages; i++) {
            paginationHtml += '<li class="page-item' + (i === currentPage ? ' active' : '') + '">';
            paginationHtml += '<a class="page-link" href="#" data-page="' + i + '">' + i + '</a></li>';
        }
        $('#' + paginationContainerId).html(paginationHtml);
    }


      // 페이지 로드 시 페이지네이션 생성
      $(document).ready(function() {
        var totalInquiryListPages = ${totalInquiryListPages}; // 수정
        var InquiryCurrentPage = ${InquiryCurrentPage}; // 수정

        createPagination(totalInquiryListPages, InquiryCurrentPage, "inquiryPagination");

        $('#inquiryPagination').off('click').on('click', '.page-link', function(e) {
            e.preventDefault();
            var pageNum = $(this).data('page');
            loadInquiries(pageNum);
        });
      });


    function loadInquiries(pageNum) {
        $.ajax({
            url: '/user/mypage/inquiry',
            type: 'GET',
            data: {
              inquiryPage: pageNum
            },
            success: function(inquiry) {
                var html = '';
                $.each(inquiry, function(i, inquiry) {
                  html += '<div class="col-md-12"><div class="card mb-4"><div class="card-body">';
                    html += '<h5 class="card-title toggle-title inquiry-title" onclick="toggleInquiryDetails(\'details-' + inquiry.inquiry_num + '\')">';
                    html += '제목: ' + inquiry.inquiry_title;
                    html += '<span class="inquiry-date">' + inquiry.inquiry_regdate + '</span>';
                    html += '</h5>';

                    html += '<div id="details-' + inquiry.inquiry_num + '" style="display: none;">';
                    html += '<p class="card-text inquiry-content" style="font-size: 18px;">문의 내용: ' + inquiry.inquiry_content + '</p>';
                    html += '<p class="card-text">답변 여부: ';
                    html += '<span class="' + (inquiry.inquiry_process == 1 ? 'inquiry-answered' : 'inquiry-pending') + '">';
                    html += (inquiry.inquiry_process == 1 ? '답변 완료' : '답변 대기') + '</span></p>';

                    if (inquiry.inquiry_process == 1) {
                        html += '<div class="inquiry-response" style="font-size: 18px;">답변 내용: ' + inquiry.inquiry_review_content + '</div>';
                    }

                    html += '</div></div></div>';
                });
                $('#inquiryItems').html(html); // 문의 내역 업데이트
            },
            error: function(error) {

                console.log('Error:', error);
            }
        });
    }


      </script>
  

  <!-- 발자취 페이징 (영수증)-->
  <script>
    function createPagination(totalPages, currentPage) {
      var paginationHtml = '';
      for (var i = 1; i <= totalPages; i++) {
        paginationHtml += '<li class="page-item' + (i === currentPage ? ' active' : '') + '">' +
                            '<a class="page-link" href="#" data-page="' + i + '">' + i + '</a>' +
                          '</li>';
      }
      $('#receiptPagination').html(paginationHtml); // 수정: 영수증 목록의 페이지네이션 컨테이너 ID
    }

    // 페이지 로드 시 페이지네이션 생성
    $(document).ready(function() {
        var totalReceiptPages = ${totalReceiptPages}; // 수정: 영수증 목록의 총 페이지 수
        var receiptCurrentPage = ${receiptCurrentPage}; // 수정: 영수증 목록의 현재 페이지 번호

        createPagination(totalReceiptPages, receiptCurrentPage);

        // 페이지네이션 링크에 이벤트 리스너 바인딩
        $('#receiptPagination').off('click').on('click', '.page-link', function(e) {
            e.preventDefault();
            var pageNum = $(this).data('page');
            loadReceiptData(pageNum);
        });
    });

    function loadReceiptData(pageNum) {
      $.ajax({
        url: '/user/mypage/receipts', // 수정: 영수증 데이터를 제공하는 서버의 URL
        type: 'GET',
        data: {
          receiptPage: pageNum
        },
        success: function(receipts) {
          var html = '';
          $.each(receipts, function(i, receipt) {
            html += '<div class="col-xl-4 col-sm-6 grid-item">' +
                      '<div class="special-box">' +
                        '<div class="special-img" style="height: 200px;">' +
                          '<a href="/tourDetail/' + receipt.tour_num + '">' +
                            '<img class="img-fluid blur-up lazyload bg-img fixed-size-img" />' + 
                          '</a>' +
                          '<div class="content_inner">' +
                            '<a href="/tourDetail/' + receipt.tour_num + '">' +
                              '<h5>' + receipt.receipt_name + '</h5>' +
                            '</a>' +
                            '<h6>' + receipt.receipt_date + '</h6>' +
                          '</div>' +
                        '</div>' +
                      '</div>' +
                    '</div>';
          });
          // 게시물 목록 업데이트
          $('#receiptItems').html(html); // 수정: 영수증 목록을 담고 있는 요소의 선택자
        },
        error: function(error) {
          // 오류 처리
          console.log(error);
        }
      });
    }
</script>


<!-- 발자취 발걸음 -->
<script>
$(document).ready(function() {
  var receiptCount = ${receiptCount}; // 서버에서 받아온 receiptCount 값
  var footprints = "";
  for (var i = 0; i < receiptCount; i++) {
    // 일반 발자국 아이콘 추가
    footprints += '<i class="fas fa-shoe-prints"></i>';

    // 특정 발걸음 수에 도달했을 때 메시지 추가
    if (i === 24) {
      footprints += '<div class="milestone">25개 돌파!</div>';
    } else if (i === 49) {
      footprints += '<div class="milestone">50개 돌파!</div>';
    } else if (i === 99) {
      footprints += '<div class="milestone">100개 돌파!</div>';
      
    }
  }
  $("#footprints").html(footprints);
});
</script>





</body>
</html>
