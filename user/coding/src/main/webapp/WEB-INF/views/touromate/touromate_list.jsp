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
      <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet" />

      <!-- Icons -->
      <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css" />

      <!-- Animation -->
      <link rel="stylesheet" type="text/css" href="../assets/css/animate.css" />

      <!-- Date-time picker css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/datepicker.min.css" />

      <!-- price range css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/price-range.css" />

      <!--Slick slider css-->
      <link rel="stylesheet" type="text/css" href="../assets/css/slick.css" />
      <link rel="stylesheet" type="text/css" href="../assets/css/slick-theme.css" />

      <!-- Bootstrap css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />

      <!-- Theme css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/color1.css" />
      <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

      <%-- <!-- 추가한 css 파일-->
        <link rel="stylesheet" type="text/css" href="../assets/css/fileupload.css" /> --%>

        <script>
          $(function () {
            const sessionId = $("#sessionId").val();

            // If sessionId is available, continue with your logic
            $('#findFriend').click((e) => {
              e.preventDefault();
              if (!sessionId) {
                swal('', "로그인 후 이용해주세요.", 'error').then(() => {
                  window.location.href = "/user/login";
                });
              } else {
                window.location.href = "/touromate/touromate_insert";
              }
              // Add your logic here for the click event when sessionId is available
            });

          }) // end script
          $('#seeDetail').click((e) => {
            e.preventDefault();
            if (!sessionId) {
              swal('', "로그인 후 이용해주세요.", 'error').then(() => {
                window.location.href = "/user/login";
              });
            }
          })
        </script>
        <!-- 게시물 보기 권한 - 로그인 시 가능 -->



    </head>

    <body>

      <!-- 해더 (로고, 탭메뉴 등 설정) -->
      <%@ include file='../header/header.jsp' %>
        <!--  해더 끝 -->

        <input type="hidden" value="${sessionScope.loggedInUser.user_id}" id="sessionId" />

        <!-- breadcrumb start -->
        <section class="breadcrumb-section parallax-img pt-0">
          <img src="../assets/images/inner-pages/breadcrumb1.jpg" class="bg-img img-fluid blur-up lazyload" alt="" />
          <div class="breadcrumb-content overlay-black">
            <div>
              <h2>여행 친구 찾기</h2>
              <nav aria-label="breadcrumb" class="theme-breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/touro">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">
                    여행 친구 찾기
                  </li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="bird-animation">
            <div class="bird-container bird-container--one">
              <div class="bird bird--one"></div>
            </div>
            <div class="bird-container bird-container--two">
              <div class="bird bird--two"></div>
            </div>
            <div class="bird-container bird-container--three">
              <div class="bird bird--three"></div>
            </div>
            <div class="bird-container bird-container--four">
              <div class="bird bird--four"></div>
            </div>
          </div>
        </section>
        <!-- breadcrumb end -->

        <!-- section start -->
        <section class="xs-section bg-inner">
          <div class="container">
            <div class="row">
              <div class="col-12">
                <div class="filter-panel right-filter open-cls">
                  <div class="left-filter">
                    <div class="respon-filter-btn">
                      <h6>filter <i class="fas fa-sort-down"></i></h6>
                      <span class="according-menu"></span>
                    </div>
                    <div class="filters respon-filter-content filter-button-group">
                      <ul>
                        <li class="active" data-filter="*">All</li>
                      </ul>
                    </div>
                  </div>
                  <div class="right-panel">
                    <a href="javascript:void(0)" class="view-map me-0"><i class="fas fa-search"></i> 친구 찾기</a>
                    <div class="collection-grid-view">
                      <a href="/touromate/touromate_insert" class="btn btn-rounded color1" id="findFriend">친구 찾기 쓰기</a>
                    </div>

                  </div>
                </div>
              </div>
              <div class="col-xl-12 onclick-map">
                <div class="book-table single-table bg-inner">
                  <div class="table-form classic-form">
                    <form>
                      <div class="row w-100">
                        <div class="form-group col p-0">
                          <input type="text" class="form-control" id="exampleFormControlInput1" name="searchKeyword"
                            placeholder="찾고싶은 게시글 제목 2글자 이상 입력하세요." onkeypress="checkEnter(event)" />
                        </div>
                      </div>
                      <a href="#" class="btn btn-rounded color1" onclick="checkEnter(event)">search</a>
                    </form>
                  </div>
                </div>
              </div>

              <script>
                function checkEnter(event) {
                  // Enter 키 코드는 13
                  if (event.keyCode === 13 || event.type === 'click') {
                    var searchKeyword = document.getElementById('exampleFormControlInput1').value;

                    // 검색어의 길이를 확인하고 2글자 이상이 아니면 alert 창 띄우기
                    if (searchKeyword.length < 2 || searchKeyword.trim() === '') {
                      swal('', '2글자 이상 입력하세요.', 'error');
                      event.preventDefault();  // 이벤트의 기본 동작을 막아서 엔터 키에 의한 폼 제출을 막음
                      // 검색어를 초기화하거나 다른 조치를 취할 수 있음
                    }
                  }
                }
              </script>

              <div class="col-lg-12 ratio3_2">
                <div class="container">

                  <!-- 여행 친구 매칭 게시글 반복적으로 출력하는 부분 -->
                  <c:forEach var="touromate" items="${touromates}">
                    <div class="list-view row content grid">
                      <div class="list-box col-12 popular grid-item wow fadeInUp">
                        <!-- 게시글 이미지-->
                        <!-- <div class="list-img">
                            <a href="touromate_detail/${touromate.touro_mate_num}"> -->
                        <!-- 이미지 출력 부분 -->
                        <!-- </a> -->
                        <!-- </div> -->
                        <div class="list-content col">
                          <div>
                            <!-- 게시글 제목과 링크 -->
                            <a href="touromate_detail?touro_mate_num=${touromate.touro_mate_num}">
                              <h5>${touromate.touro_mate_title}</h5>
                            </a>
                            <br />
                            <!-- 게시글 작성 일자 -->
                            <p>${touromate.touro_mate_date}</p>
                            <!-- 게시글 작성자 (사용자 ID) -->
                            <div class="price">${touromate.user_id}</div> <!-- 게시글 보기 버튼 -->
                            <a href="touromate_detail?touro_mate_num=${touromate.touro_mate_num}"
                              class="btn btn-solid color1 book-now" id="seeDetail">게시글 보기</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </c:forEach>

                  <!-- 페이지 네이션 -->
                  <nav aria-label="Page navigation example" class="pagination-section">
                    <ul class="pagination">
                      <!-- 이전 페이지 이동 버튼-->
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true">&laquo;</span>
                          <span class="sr-only">Previous</span>
                        </a>
                      </li>
                      <!-- 페이지 번호를 출력하는 forEach -->
                      <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                        <!-- 현재 페이지에 해당하는 경우 활성화된 스타일을 적용하는 부분 -->
                        <li class="page-item ${pageNumber eq currentPage ? 'active' : ''}">
                          <a class="page-link" href="?page=${pageNumber}">${pageNumber}</a>
                        </li>
                      </c:forEach>
                      <!-- 다음 페이지 이동 버튼-->
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true">&raquo;</span>
                          <span class="sr-only">Next</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- section End -->

        <!-- 푸터 (로고, 탭메뉴 등 설정) -->
        <%@ include file='../footer/footer.jsp' %>
          <!--  푸더 끝 -->

          <!-- tap to top -->
          <div class="tap-top">
            <div>
              <i class="fas fa-angle-up"></i>
            </div>
          </div>
          <!-- tap to top end -->


          <!-- latest jquery-->
          <script src="../assets/js/jquery-3.5.1.min.js"></script>

          <!-- filter js -->
          <script src="../assets/js/filter.js"></script>
          <script src="../assets/js/isotope.min.js"></script>

          <!-- tilt effect js-->
          <script src="../assets/js/tilt.jquery.js"></script>

          <!-- price range js -->
          <script src="../assets/js/price-range.js"></script>

          <!-- wow js-->
          <script src="../assets/js/wow.min.js"></script>

          <!-- date-time picker js -->
          <script src="../assets/js/date-picker.js"></script>

          <!-- slick js-->
          <script src="../assets/js/slick.js"></script>

          <!-- Bootstrap js-->
          <script src="../assets/js/bootstrap.bundle.min.js"></script>

          <!-- lazyload js-->
          <script src="../assets/js/lazysizes.min.js"></script>

          <!-- Theme js-->
          <script src="../assets/js/script.js"></script>

          <script>
            $("#datepicker").datepicker({
              uiLibrary: "bootstrap4",
              format: "dd mmmm",
            });
            $("#datepicker1").datepicker({
              uiLibrary: "bootstrap4",
              format: "dd mmmm",
            });
            new WOW().init();
          </script>
    </body>

    </html>