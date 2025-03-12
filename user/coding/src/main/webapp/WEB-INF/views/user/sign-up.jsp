<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <html lang="UTF-8">

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0" />
      <meta name="description"
        content="Cuba admin is super flexible, powerful, clean &amp; modern responsive bootstrap 5 admin template with unlimited possibilities." />
      <meta name="keywords"
        content="admin template, Cuba admin template, dashboard template, flat admin template, responsive admin template, web app" />
      <meta name="author" content="pixelstrap" />
      <link rel="icon" href="../assets/images/favicon.png" type="image/x-icon" />
      <link rel="shortcut icon" href="../assets/images/favicon.png" type="image/x-icon" />
      <title>TOURO - 회원가입</title>
      <!-- Google font-->
      <!-- <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@200&family=Nunito:ital,wght@0,200;0,300;0,400;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet" />
    
    <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css" /> -->
      <!-- Themify icon-->
      <!-- <link rel="stylesheet" type="text/css" href="../assets/css/vendors/themify.css" /> -->
      <!-- Feather icon-->
      <!-- <link rel="stylesheet" type="text/css" href="../assets/css/vendors/feather-icon.css" /> -->
      <!-- Plugins css start-->
      <!-- Plugins css Ends-->
      <!-- Bootstrap css-->
      <!-- <link rel="stylesheet" type="text/css" href="../assets/css/vendors/bootstrap.css" /> -->
      <!-- App css-->
      <!-- <link rel="stylesheet" type="text/css" href="../assets/css/style.css" /> -->
      <!-- Responsive css-->
      <!-- <link rel="stylesheet" type="text/css" href="../assets/css/responsive.css" /> -->

      <!--Google font-->
      <link
        href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&display=swap"
        rel="stylesheet" />
      <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet" />

      <!-- Icons -->
      <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css" />

      <!-- Animation -->
      <link rel="stylesheet" type="text/css" href="../assets/css/animate.css" />

      <!--Slick slider css-->
      <link rel="stylesheet" type="text/css" href="../assets/css/slick.css" />
      <link rel="stylesheet" type="text/css" href="../assets/css/slick-theme.css" />

      <!-- Bootstrap css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />

      <!-- Theme css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/color1.css" />
    </head>

    <!-- 카카오 주소 찾기 -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    
    <!-- sweetalert.js -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <body>
      <!-- 해더 (로고, 탭메뉴 등 설정) -->
      <%@ include file='../header/header.jsp' %>
        <!--  해더 끝 -->

        <!-- breadcrumb start -->
        <section class="breadcrumb-section pt-0">
          <img src="../assets/images/inner-bg.jpg" class="bg-img img-fluid lazyload" alt="">
          <div class="breadcrumb-content">
            <div>
              <h2>회원가입</h2>
              <nav aria-label="breadcrumb" class="theme-breadcrumb">
                <ol class="breadcrumb">
                  <li class="breadcrumb-item"><a href="/touro">Home</a></li>
                  <li class="breadcrumb-item active" aria-current="page">회원가입</li>
                </ol>
              </nav>
            </div>
          </div>
          <div class="title-breadcrumb">TOURO</div>
        </section>
        <!-- breadcrumb end -->

        <!-- sign-up section start -->
        <section class="section-b-space animated-section dark-cls">
          <img src="../assets/images/cab/grey-bg.jpg" alt="" class="img-fluid lazyload bg-img">
          <div class="animation-section">
            <div class="cross po-1"></div>
            <div class="cross po-2"></div>
            <div class="round po-4"></div>
            <div class="round po-5"></div>
            <div class="round r-y po-8"></div>
            <div class="square po-10"></div>
            <div class="square po-11"></div>
          </div>
          <div class="container">
            <div class="row">
              <div class="offset-lg-3 col-lg-6 offset-sm-2 col-sm-8 col-12">
                <div class="account-sign-in">
                  <div class="title">
                    <h3>회원가입</h3>
                  </div>
                  <div class="login-with">
                    <h6>회원 정보를 입력해주세요.</h6>
                  </div>
                  <form class="theme-form" action="insertUser" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                      <label class="col-form-label form-label-title">이름</label>
                      <!-- <span id="required" class="required">(필수입력사항)</span> -->
                      <div class="input-group">
                        <input class="form-control" type="text" id="user_name" name="user_name" placeholder="한글 5자 이내"
                          required />
                      </div>
                      <div>
                        <span id="nameError" class="validateError"></span>
                      </div>
                    </div>
                    <!-- 아이디 -->
                    <div class="form-group">
                      <label class="col-form-label form-label-title">아이디</label>
                      <!-- <span id="required" class="required">(필수입력사항)</span> -->
                      <div class="row g-2 align-items-center">
                        <div class="col">
                          <div class="form-input position-relative">
                            <input class="form-control" type="text" id="user_id" name="user_id"
                              placeholder="5자~10자 영어와 숫자조합" required />
                          </div>
                        </div>
                        <div class="col-auto">
                          <input type="button" id="id_chk" class="btn btn-primary" value="중복확인">
                          <!-- <button class="btn btn-primary" id="id_chk">중복확인</button> -->
                        </div>
                        <div>
                          <span id="idError" class="validateError"></span>
                        </div>
                      </div>
                    </div>

                    <!-- 비밀번호 -->
                    <div class="form-group">
                      <label class="col-form-label form-label-title">비밀번호</label>
                      <!-- <span id="required" class="required">(필수입력사항)</span> -->
                      <div class="form-input position-relative">
                        <input class="form-control" type="password" id="user_pass" name="user_pass"
                          placeholder="4자이상 영어와 숫자조합" required />
                        <span id="passError" class="validateError"></span>
                      </div>
                    </div>

                    <!-- 주소 -->
                    <div class="form-group">
                      <label class="col-form-label form-label-title">주소</label>
                      <!-- <span id="required" class="required">(필수입력사항)</span> -->
                      <div class="row g-2 align-items-center">
                        <div class="col">
                          <div class="form-input position-relative">
                            <input class="form-control" type="text" id="sample6_postcode" name="postcode" readonly>
                          </div>
                        </div>
                        <div class="col-auto">
                          <input type="button" onclick="sample6_execDaumPostcode()" class="btn btn-primary"
                            value="우편번호검색" onclick="checkPost()">
                        </div>
                        <input class="form-control" type="text" id="sample6_address" name="address" placeholder="주소"
                          readonly><br />
                        <input class="form-control" type="text" id="sample6_detailAddress" name="detailaddr"
                          placeholder="상세주소">
                        <input type="text" id="sample6_extraAddress" name="user_addr" style="display:none;">
                      </div>
                    </div>

                    <!-- 전화번호 -->
                    <div class="form-group">
                      <label class="col-form-label form-label-title">전화번호</label>
                      <!-- <span id="required" class="required">(필수입력사항)</span> -->
                      <div class="form-input position-relative">
                        <input class="form-control" type="text" id="user_tel" name="user_tel" placeholder="-없이 숫자조합"
                          required />
                        <span id="telError" class="validateError"></span>
                      </div>
                    </div>

                    <!-- 메일주소 -->
                    <div class="form-group">
                      <label class="col-form-label form-label-title">메일주소</label>
                      <!-- <span id="required" class="required">(필수입력사항)</span> -->
                      <input class="form-control" type="email" id="user_email" name="user_email"
                        placeholder="touro@gmail.com" required />
                    </div>

                    <!-- 성별 -->
                    <div class="form-group">
                      <label class="col-form-label form-label-title">성별</label>
                      <!-- <span id="required" class="required">(필수입력사항)</span> -->
                      <div class="btn-group" data-toggle="buttons">
                        <input type="radio" class="btn-check" name="user_gender" id="user_gender_F" value="여성"
                          autocomplete="off" checked>
                        <label class="btn btn-outline-primary" for="user_gender_F">여성</label>

                        <input type="radio" class="btn-check" name="user_gender" id="user_gender_M" value="남성"
                          autocomplete="off">
                        <label class="btn btn-outline-primary" for="user_gender_M">남성</label>
                      </div>
                    </div>

                    <!-- 생년월일 -->
                    <div class="form-group" style="display: flex; gap: 10px;">
                      <div>
                        <label class="col-form-label form-label-title">생년월일</label>
                        <!-- <span id="required" class="required">(필수입력사항)</span> -->
                        <div class="form-input position-relative">
                          <input class="form-control" type="date" id="birthdate" name="birthdate" placeholder="생년월일"
                            style="width: 250px;" />
                          <span id="birthdateError" class="validateError"></span>
                        </div>
                      </div>
                      <div>
                        <label class="col-form-label form-label-title">나이</label>
                        <div class="form-input position-relative">
                          <input class="form-control" type="text" id="user_age" name="user_age" style="width: 100px;"
                            readonly required />
                        </div>
                      </div>
                    </div>

                    <!-- 여행지 취향 -->
                    <div class="form-group">
                      <label class="col-form-label form-label-title">선호 여행유형</label>

                      <div class="row g-2 mb-3">
                        <!-- 1순위 -->
                        <div class="col">
                          <label class="col-form-label form-label-title">1순위</label>
                          <select class="form-select" name="user_prefer_type1">
                            <option value="" disabled selected hidden>선택</option>
                            <option value="관광지">관광지 위주</option>
                            <option value="음식">맛집 위주</option>
                            <option value="숙박">숙소 위주</option>
                          </select>
                        </div>

                        <!-- 2순위 -->
                        <div class="col">
                          <label class="col-form-label form-label-title">2순위</label>
                          <select class="form-select" name="user_prefer_type2" disabled>
                            <option value="" disabled selected hidden>선택</option>
                            <option value="관광지">관광지 위주</option>
                            <option value="음식">맛집 위주</option>
                            <option value="숙박">숙소 위주</option>
                          </select>
                        </div>

                        <!-- 3순위 -->
                        <div class="col">
                          <label class="col-form-label form-label-title">3순위</label>
                          <select class="form-select" name="user_prefer_type3" disabled>
                            <option value="" disabled selected hidden>선택</option>
                            <option value="관광지">관광지 위주</option>
                            <option value="음식">맛집 위주</option>
                            <option value="숙박">숙소 위주</option>
                          </select>
                        </div>
                      </div>
                      <span id="travelPreferencesError" class="validateError"></span>
                    </div>

                    <!-- 선호 지역 -->
                    <div class="form-group">
                      <label class="col-form-label form-label-title">선호 지역</label>

                      <div class="row g-2 mb-3">
                        <!-- 1순위 -->
                        <div class="col">
                          <label class="col-form-label form-label-title">1순위</label>
                          <select class="form-select" name="user_prefer_loc1">
                            <option value="" disabled selected hidden>선택</option>
                            <option value="1.0">서울</option>
                            <option value="2.0">인천</option>
                            <option value="3.0">대전</option>
                            <option value="4.0">대구</option>
                            <option value="5.0">광주</option>
                            <option value="6.0">부산</option>
                            <option value="7.0">울산</option>
                            <option value="8.0">세종특별자치시</option>
                            <option value="31.0">경기도</option>
                            <option value="32.0">강원특별자치도</option>
                            <option value="33.0">충청북도</option>
                            <option value="34.0">충청남도</option>
                            <option value="35.0">경상북도</option>
                            <option value="36.0">경상북도</option>
                            <option value="37.0">전라북도</option>
                            <option value="38.0">전라남도</option>
                            <option value="39.0">제주도</option>
                          </select>
                        </div>

                        <!-- 2순위 -->
                        <div class="col">
                          <label class="col-form-label form-label-title">2순위</label>
                          <select class="form-select" name="user_prefer_loc2">
                            <option value="" disabled selected hidden>선택</option>
                            <option value="1.0">서울</option>
                            <option value="2.0">인천</option>
                            <option value="3.0">대전</option>
                            <option value="4.0">대구</option>
                            <option value="5.0">광주</option>
                            <option value="6.0">부산</option>
                            <option value="7.0">울산</option>
                            <option value="8.0">세종특별자치시</option>
                            <option value="31.0">경기도</option>
                            <option value="32.0">강원특별자치도</option>
                            <option value="33.0">충청북도</option>
                            <option value="34.0">충청남도</option>
                            <option value="35.0">경상북도</option>
                            <option value="36.0">경상북도</option>
                            <option value="37.0">전라북도</option>
                            <option value="38.0">전라남도</option>
                            <option value="39.0">제주도</option>
                          </select>
                        </div>

                        <!-- 3순위 -->
                        <div class="col">
                          <label class="col-form-label form-label-title">3순위</label>
                          <select class="form-select" name="user_prefer_loc3">
                            <option value="" disabled selected hidden>선택</option>
                            <option value="1.0">서울</option>
                            <option value="2.0">인천</option>
                            <option value="3.0">대전</option>
                            <option value="4.0">대구</option>
                            <option value="5.0">광주</option>
                            <option value="6.0">부산</option>
                            <option value="7.0">울산</option>
                            <option value="8.0">세종특별자치시</option>
                            <option value="31.0">경기도</option>
                            <option value="32.0">강원특별자치도</option>
                            <option value="33.0">충청북도</option>
                            <option value="34.0">충청남도</option>
                            <option value="35.0">경상북도</option>
                            <option value="36.0">경상북도</option>
                            <option value="37.0">전라북도</option>
                            <option value="38.0">전라남도</option>
                            <option value="39.0">제주도</option>
                          </select>
                        </div>
                      </div>
                      <span id="preferredLocationsError" class="validateError"></span>
                    </div>


                    <div class="form-group">
                      <label class="col-form-label form-label-title">프로필 사진</label>

                      <!-- 프로필 사진 왼쪽 박스 -->
                      <div class="profile-picture-container ">
                        <!-- 사진 미리보기 -->
                        <div class="profile-picture-box row g-2">
                          <img class="profile-picture col-4" id="profilePicturePreview"
                            src="../assets/images/profile/default_profile.png" alt="프로필 사진"
                            style="height: 20%; width: 20%;">
                          <input class="form-control-sm col-8" type="file" id="profilePictureUpload" name="file"
                            accept="image/*" onchange="previewProfilePicture()" />
                        </div>
                      </div>
                    </div>

                    <div class="form-group mb-0">
                      <div class="checkbox p-0">
                        <input id="agreeCheckbox" type="checkbox" />
                        <label class="text-muted" for="agreeCheckbox">개인정보 수집에 동의하시면 체크해주세요.</label>
                        <span id="checkboxError" class="validateError"></span>
                      </div>
                      <button class="btn btn-primary btn-block w-100" type="submit" id="submitBtn"
                        style="height: 50px;">회원가입</button>
                    </div>

                  </form>

                  <p class="mt-4 mb-0 text-center">
                    이미 계정이 있으신가요?
                    <a class="ms-2" href="login">로그인</a>
                  </p>

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

          <!-- latest jquery-->
          <script src="../assets/js/jquery-3.5.1.min.js"></script>
          <!-- Bootstrap js-->
          <script src="../assets/js/bootstrap/bootstrap.bundle.min.js"></script>
          <!-- feather icon js-->
          <script src="../assets/js/icons/feather-icon/feather.min.js"></script>
          <script src="../assets/js/icons/feather-icon/feather-icon.js"></script>
          <!-- scrollbar js-->

          <!-- date-time picker js -->
          <script src="../assets/js/date-picker.js"></script>
          <!-- Sidebar jquery-->
          <script src="../assets/js/config.js"></script>
          <!-- Plugins JS start-->
          <!-- Plugins JS Ends-->
          <!-- Theme js-->
          <script src="../assets/js/script.js"></script>
          <!-- login js-->
          <!-- Plugin used-->

          <!-- 생년월일을 나이로 변환 -->
          <script>
            $(document).ready(function () {
              // 생년월일 입력 시 나이 계산 함수
              function calculateAge(birthdate) {
                var today = new Date();
                var birthDate = new Date(birthdate);
                var age = today.getFullYear() - birthDate.getFullYear();

                // 생일이 지났는지 체크
                var monthDiff = today.getMonth() - birthDate.getMonth();
                if (monthDiff < 0 || (monthDiff === 0 && today.getDate() < birthDate.getDate())) {
                  age--;
                }

                return age;
              }

              // 생년월일 입력이 변경되면 나이 계산 후 '나이' 칸에 값 설정
              $('#birthdate').change(function () {
                var birthdate = $(this).val();
                var age = calculateAge(birthdate);

                // '나이' 칸에 값을 설정
                $('#user_age').val(age);
              });
            });
          </script>

          <!-- 여행지 취향 중복 선택 제거 자바스크립트 코드-->
          <script>
            $(document).ready(function () {
              // 다른 select 박스에서 선택된 값을 비활성화하는 함수
              function disableSelectedValue(selectedValue, selectBoxes) {
                selectBoxes.each(function () {
                  $(this).find('option').prop('disabled', false);
                  $(this).find('option[value="' + selectedValue + '"]').prop('disabled', true);
                });
              }

              // user_prefer_type select 박스 처리
              $('select[name="user_prefer_type1"]').change(function () {
                var selectedValue = $(this).val();
                var selectBoxes = $('select[name^="user_prefer_type"]').not(this);
                disableSelectedValue(selectedValue, selectBoxes);
                $('select[name="user_prefer_type2"]').prop('disabled', false);
              });

              $('select[name="user_prefer_type2"]').change(function () {
                var selectedValue = $(this).val();
                var selectBoxes = $('select[name^="user_prefer_type"]').not(this);
                disableSelectedValue(selectedValue, selectBoxes);
                $('select[name="user_prefer_type3"]').prop('disabled', false);
                $('select[name="user_prefer_type3"]').prop('disabled', false);
              });

              // user_prefer_loc select 박스 처리
              $('select[name^="user_prefer_loc"]').change(function () {
                var selectedValue = $(this).val();
                var selectBoxes = $('select[name^="user_prefer_loc"]').not(this);
                disableSelectedValue(selectedValue, selectBoxes);
              });
            });
          </script>

          <!-- 다음 주소찾기 API -->
          <script>
            function sample6_execDaumPostcode() {
              new daum.Postcode({
                oncomplete: function (data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수

                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                  }

                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if (data.userSelectedType === 'R') {
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                      extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                      extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if (extraAddr !== '') {
                      extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;

                  } else {
                    document.getElementById("sample6_extraAddress").value = '';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample6_postcode').value = data.zonecode;
                  document.getElementById("sample6_address").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  document.getElementById("sample6_detailAddress").focus();
                }
              }).open();
            }

            // 상세주소 입력이 완료되면 주소 정보를 hidden 필드에 저장
            $("#sample6_detailAddress").on("change", function () {
              var addr = $("#sample6_address").val();
              var detailaddr = $(this).val();
              var fullAddress = addr + "," + detailaddr;
              $("#sample6_extraAddress").val(fullAddress);
            });
          </script>

          <!-- 이미지 미리보기 -->
          <script>
            function previewProfilePicture() {
              var input = document.getElementById('profilePictureUpload');
              var preview = document.getElementById('profilePicturePreview');

              if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                  preview.src = e.target.result;
                };

                reader.readAsDataURL(input.files[0]);
              }
            }
          </script>


          <!-- 유효성 검사 -->
          <script>
            $(function () {
              function validateId() {
                var id = $("#user_id").val();
                var idPattern = /^[a-zA-Z0-9]{5,10}$/;
                if (!id.match(idPattern)) {
                  $("#idError").text("아이디는 5자~10자의 영어와 숫자 조합이어야 합니다.");
                } else {
                  $("#idError").text("");
                }
              }

              function validatePassword() {
                var pwd = $("#user_pass").val();
                var pwdPattern = /^[a-zA-Z0-9]{4,}$/;
                if (!pwd.match(pwdPattern)) {
                  $("#passError").text("비밀번호는 4자 이상의 영어와 숫자 조합이어야 합니다.");
                } else {
                  $("#passError").text("");
                }
              }

              function validateName() {
                var name = $("#user_name").val();
                var namePattern = /^[가-힣]{1,5}$/;
                if (!name.match(namePattern)) {
                  $("#nameError").text("이름은 한글로 5자 이내여야 합니다.");
                } else {
                  $("#nameError").text("");
                }
              }

              function validatePhone() {
                var phone = $("#user_tel").val();
                var phonePattern = /^[0-9]*$/;
                if (!phone.match(phonePattern)) {
                  $("#telError").text("전화번호는 숫자만 입력해야 합니다.");
                } else {
                  $("#telError").text("");
                }
              }

              function validateBirthdate() {
                var birthdate = $("#birthdate").val();
                if (!birthdate) {
                  $("#birthdateError").text("생년월일을 입력해주세요.");
                } else {
                  $("#birthdateError").text("");
                }
              }

              function validateCheckbox() {
                var agreeCheckbox = $("#agreeCheckbox");
                if (!agreeCheckbox.prop("checked")) {
                  $("#checkboxError").text("개인정보 수집에 동의해야 합니다.");
                } else {
                  $("#checkboxError").text("");
                }
              }

              function validateTravelPreferences() {
                var preferType1 = $("select[name='user_prefer_type1']").val();
                var preferType2 = $("select[name='user_prefer_type2']").val();
                var preferType3 = $("select[name='user_prefer_type3']").val();

                if (!preferType1 || !preferType2 || !preferType3) {
                  $("#travelPreferencesError").text("여행 유형을 모두 선택해주세요.");
                } else {
                  $("#travelPreferencesError").text("");
                }
              }

              function validatePreferredLocations() {
                var preferLoc1 = $("select[name='user_prefer_loc1']").val();
                var preferLoc2 = $("select[name='user_prefer_loc2']").val();
                var preferLoc3 = $("select[name='user_prefer_loc3']").val();

                if (!preferLoc1 || !preferLoc2 || !preferLoc3) {
                  $("#preferredLocationsError").text("선호 지역을 모두 선택해주세요.");
                } else {
                  $("#preferredLocationsError").text("");
                }
              }

              //아이디 중복체크
              $("#id_chk").click(function () {
                var user_id = $('#user_id').val();
                //alert(id);
                if (user_id != "") {
                  // AJAX를 사용하여 서버로 중복 체크 요청 보내기
                  $.ajax({
                    type: "POST",
                    url: "idCheck", // 서버의 중복 체크 컨트롤러 주소
                    data: { user_id: user_id }, // 아이디를 서버로 보내기
                    success: function (response) {
                      //console.log(id);
                      if (response === "1") {
                        swal("", "이미 존재하는 아이디입니다.", "error");
                        // alert("이미 존재하는 아이디입니다.");
                        $("#submitBtn").prop('disabled', true);

                      } else if (response === "0") {
                        swal("", "사용 가능한 아이디입니다.", "success");
                        // alert("사용 가능한 아이디입니다.");
                        // 아이디 중복 확인이 성공했으므로 제출 버튼을 활성화합니다.
                        $("#submitBtn").prop('disabled', false);
                      }
                    },
                    error: function () {
                      // 오류 처리
                      swal("", "오류가 발생했습니다.", "error");
                      // alert("오류가 발생했습니다.");
                    }
                  });
                } else {
                  swal("", "아이디를 입력해주세요.", "warning");
                  // alert("아이디를 입력해주세요.")
                }

              });        
              
              // 아이디,비밀번호,이름,전화번호 유효성 검사
              $("#user_id").blur(validateId);
              $("#user_pass").blur(validatePassword);
              $("#user_name").blur(validateName);
              $("#user_tel").blur(validatePhone);
              $("#birthdate").blur(validateBirthdate);
              $("select[name='user_prefer_type1'], select[name='user_prefer_type2'], select[name='user_prefer_type3']").change(validateTravelPreferences);
              $("select[name^='user_prefer_loc']").change(validatePreferredLocations);
              // 체크박스 상태 변화 감지
              $("#agreeCheckbox").change(validateCheckbox);

              $("form").submit(function (event) {
                // 각 필드의 유효성 검사 함수 호출
                validateId();
                validatePassword();
                validateName();
                validatePhone();
                validateCheckbox();
                validateBirthdate();
                validateTravelPreferences();
                validatePreferredLocations();

                if ($("#idError").text() !== "") {
                  event.preventDefault(); // 양식 제출 방지
                  swal("", "아이디 중복 확인을 해주세요.", "error");
                } else if ($("#birthdateError").text() !== "") {
                  event.preventDefault(); // 양식 제출 방지
                  swal("", "생년월일을 입력 해주세요.", "error");
                } else if ($("#travelPreferencesError").text() !== "") {
                  event.preventDefault(); // 양식 제출 방지
                  swal("", "선호 여행유형 우선순위를 정해주세요", "error");
                } else if ($("#preferredLocationsError").text() !== "") {
                  event.preventDefault(); // 양식 제출 방지
                  swal("", "선호 지역 우선순위를 정해주세요.", "error");
                } else if ($("#checkboxError").text() !== "") {
                  event.preventDefault(); // 양식 제출 방지
                  swal("", "개인정보 수집에 동의해주세요.", "error");
                } else {
                  // 모든 검사가 통과하면 성공 알림을 표시하고 양식을 제출합니다.
                  event.preventDefault();
                  showSuccessAlert();
                }
              });

              function showSuccessAlert() {
                swal("회원가입이 완료되었습니다!", "환영합니다!", "success")
                  .then((value) => {
                    if (value) {
                      $("form").off("submit").submit();
                    }
                  });
              }

            });
          </script>

    </body>

    </html>