<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    <%@page import="com.example.coding.domain.UserVO" %>

      <% Object loggedIdAttribute=session.getAttribute("loggedId"); UserVO user=(UserVO)
        session.getAttribute("loggedInUser"); if (loggedIdAttribute instanceof UserVO) {user=(UserVO)
        loggedIdAttribute;} %>

        <script>
          function sendSessionValueToAndroid(sessionValue) {
            if (typeof Android !== 'undefined' && Android !== null) {
              Android.setSessionValue(sessionValue);
            } else {
              //console.error('Android 객체가 정의되지 않았습니다.');
            }
          }

          // 특정 페이지 로딩 시 세션 값을 전달하도록 설정
          window.onload = function () {
            console.log("11111")
            triggerSessionValueTransfer();
          };

          function triggerSessionValueTransfer() {
            var sessionValue = "<%= loggedIdAttribute %>";
            sendSessionValueToAndroid(sessionValue);
            console.log(sessionValue);

            // 트러블슈팅을 위한 추가 코드
            console.log("triggerSessionValueTransfer executed");
          }

          function confirmLogout() {
            // SweetAlert를 사용하여 로그아웃 여부를 묻는 알림창 띄우기
            swal({
              title: "로그아웃 하시겠습니까?",
              icon: "warning",
              buttons: ["취소", "확인"],
            }).then((willLogout) => {
              if (willLogout) {
                // 사용자가 확인을 눌렀을 때 로그아웃 처리
                window.location.href = "/user/logout";
              }
            });
          }
        </script>



        <body>
          <!-- 해더 (로고, 탭메뉴 등 설정) -->
          <header class="tour-header">
            <div class="container">
              <div class="row">
                <div class="col">
                  <div class="menu">
                    <div class="brand-logo">
                      <a href="/touro">
                        <img src="../assets/images/icon/header-logo.png" alt="" class="img-fluid blur-up lazyload" />
                      </a>
                    </div>
                    <nav>
                      <div class="main-navbar">
                        <div id="mainnav">
                          <div class="toggle-nav">
                            <i class="fa fa-bars sidebar-bar"></i>
                          </div>
                          <div class="menu-overlay"></div>
                          <ul class="nav-menu">
                            <li class="back-btn">
                              <div class="mobile-back text-end">
                                <span>Back</span>
                                <i aria-hidden="true" class="fa fa-angle-right ps-2"></i>
                              </div>
                            </li>
                            <li class="nav-submenu">
                              <!-- 리스트 테스트 -->
                              <a href="/touro/tour" class="nav-link">여행지</a>
                            </li>
                            <li class="nav-submenu">
                              <a href="/touromate/touromate_list" class="nav-link">여행친구찾기</a>
                            </li>
                            <li class="nav-submenu">
                              <a href="/touroview/touroview_list" class="nav-link">여행후기</a>
                            </li>
                            <li class="nav-submenu">
                              <!-- <a href="/user/img_change" class="nav-link">
                          <a href="#" class="nav-link">
                          ImgChange</a
                        > -->
                              <a class="nav-link" data-bs-toggle="modal" data-bs-target="#image-change" href="#"
                                class="btn btn-rounded btn-sm color1"
                                data-touro-mate-num="${touroMate.touro_mate_num}">이미지변환</a>
                            </li>
                          </ul>
                        </div>
                      </div>
                    </nav>
                    <ul class="header-right">
                      <!-- 세션이 비어 있으면 로그인 버튼으로 -->
                      <c:if test="${empty sessionScope.loggedInUser}">
                        <li class="user user-light rounded5">
                          <a href="/user/login">
                            <i class="fas fa-user"></i>
                            로그인
                          </a>
                      </c:if>
                      <!-- 세션이 비어 있지 않으면 로그아웃 버튼으로 -->
                      <c:if test="${not empty sessionScope.loggedInUser}">
                        <li class="user user-light rounded5">
                          <a href="/user/mypage">
                            <i class="fas fa-user"></i>${sessionScope.loggedInUser.user_name}님
                          </a>
                        </li>
                        <li class="user user-light rounded5">
                          <a href="#" onclick="confirmLogout();">
                            <i class="fas fa-sign-out-alt"></i>로그아웃
                          </a>
                      </c:if>

                      </li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </header>
          <!--  해더 끝 -->

          <!-- 이미지 변환 (Modal) 구성 시작-->
          <div class="modal fade edit-profile-modal" id="image-change" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl modal-dialog-centered" role="document">
              <div class="modal-content" style="width: 80vw; max-width: 1800px; height: 80vh; max-height: 1000px;">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLabel">ImageChange!</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body dashboard-section d-flex justify-content-center align-items-center">
                  <section class="w-400" style="padding-top: 0px;">
                    <div class="image-section">
                      <!-- 내용이 중앙에 오도록 수정 -->
                      <div class="image-container row">
                        <h2 class="col-12">선택한 이미지</h2>
                        <div class="col-12"
                          style="background-color: lightblue; height: 300px; display: flex; align-items: center; justify-content: center;">
                          <img src="" alt="Select Image" id="selected-image" style="max-height: 100%; max-width: 100%;">
                        </div>
                      </div>

                      <form action="/upload" method="post" enctype="multipart/form-data" id="upload-form">
                        <div class="image-section row">
                          <div class="image-container col-12 col-md-8">
                            <label for="image">이미지 선택:</label>
                            <input type="file" name="image" accept="image/*" id="image" onchange="previewImage()"
                              class="form-control">
                          </div>

                          <div class="image-container col-12 col-md-8">
                            <label for="style">스타일 선택:</label>
                            <select name="style" id="style" class="form-control">
                              <option value="Hayao">Hayao</option>
                              <option value="Hosoda">Hosoda</option>
                              <option value="Paprika">Paprika</option>
                              <option value="Shinkai">Shinkai</option>
                            </select>
                          </div>

                          <div class="button-section col-12 col-md-8" style="text-align: center;">
                            <button type="submit" class="btn btn-primary">변환</button>
                          </div>
                        </div>

                      </form>

                      <div class="image-container row">
                        <h2 class="col-12">변환된 이미지</h2>
                        <div class="col-12"
                          style="background-color: lightblue; height: 300px; display: flex; align-items: center; justify-content: center;">
                          <img src="" alt="Cartoonized Image" id="result-image"
                            style="max-height: 100%; max-width: 100%;">
                        </div>
                      </div>
                    </div>
                </div>
                </section>

                <!-- Axios 스크립트 -->
                <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>

                <!-- 파일 선택 후 미리보기 기능을 위한 스크립트 -->
                <script>
                  function previewImage() {
                    var selectedImage = document.getElementById("selected-image");
                    var imageInput = document.getElementById("image");

                    var file = imageInput.files[0];
                    if (file) {
                      var reader = new FileReader();
                      reader.onload = function (e) {
                        selectedImage.src = e.target.result;
                      };
                      reader.readAsDataURL(file);
                    }
                  }
                </script>

                <!-- 파일 업로드 및 이미지 표시를 위한 스크립트 -->
                <script>
                  document.addEventListener("DOMContentLoaded", function () {
                    document
                      .getElementById("upload-form")
                      .addEventListener("submit", function (e) {
                        e.preventDefault();

                        var imageFile = document.getElementById("image").files[0];
                        var selectedStyle = document.getElementById("style").value;

                        var formData = new FormData();
                        formData.append("image", imageFile);
                        formData.append("style", selectedStyle);

                        axios
                          .post("http://175.114.130.19:5050/upload", formData)
                          .then(function (response) {
                            var resultImageData = response.data.result_image;
                            var resultImageElement =
                              document.getElementById("result-image");
                            resultImageElement.src =
                              "data:image/jpeg;base64," + resultImageData;
                            resultImageElement.style.display = "block";
                          })
                          .catch(function (error) {
                            console.error("Error during image upload:", error);
                          });
                      });
                  });
                </script>
              </div>
            </div>
          </div>
          </div>

          <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

          <style>
            /* 기본 스타일 */
            section.image-section {
              padding: 10px;
              /* 예시로 패딩을 추가하였습니다. 필요에 따라 수정하세요. */
            }

            /* 미디어 쿼리: 768px 이상의 화면 크기일 때 */
            @media screen and (min-width: 768px) {
              section.image-section {
                height: 600px;
                /* 원하는 크기로 설정하세요. */
              }
            }

            /* 미디어 쿼리: 1200px 이상의 화면 크기일 때 */
            @media screen and (min-width: 1200px) {
              section.image-section {
                height: 800px;
                /* 다른 크기로 설정하세요. */
              }
            }

            .image-section {
              display: flex;
              flex-direction: row;
              justify-content: space-around;
            }

            .image-container {
              text-align: center;
            }

            h2 {
              margin-bottom: 10px;
            }

            #selected-image,
            #result-image {
              width: 300px;
              height: 200px;
              background-color: lightblue;
            }

            #upload-form {
              display: flex;
              align-items: center;
            }

            .button-section {
              margin-top: 10px;
            }
          </style>


          <!-- 이미지 양식 끝 -->

        </body>