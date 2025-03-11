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

    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/color1.css" />

    <!-- fileupload css-->
    <link
      rel="stylesheet"
      type="text/css"
      href="../assets/css/fileupload.css"
    />
  </head>

  <body>
    <!-- pre-loader start -->
    <!-- <div class="loader-wrapper img-gif">
      <img src="../assets/images/loader.gif" alt="" />
    </div> -->
    <!-- pre-loader end -->

    <!-- header start -->
    <!-- 해더 (로고, 탭메뉴 등 설정) -->
    <%@ include file='../header/header.jsp' %>
<!--  해더 끝 -->
    <!--  header end -->

    <!-- section start -->
    <section class="p-0 center-slide">
      <div class="center-slider no-arrow">
        <div>
          <div class="image-center">
            <div class="center-content">
              <input class="upload-name" value="파일선택" disabled="disabled" />
              <h3>
                <label for="input-file" class="upload">업로드</label>
                <div></div>
              </h3>
              <button for="avcde" class="picture-mix">변환</button>
              <input type="file" id="input-file" class="upload-hidden" />
            </div>
          </div>
        </div>

        <div>
          <div class="image-center">
            <img
              src="../assets/images/portfolio/9.jpg"
              class="img-fluid blur-up lazyload bg-img"
              alt=""
            />
            <div class="center-content"></div>
          </div>
        </div>
        <div></div>
        <div>
          <div class="image-center">
            <img
              src="../assets/images/portfolio/10.jpg"
              class="img-fluid blur-up lazyload bg-img"
              alt=""
            />
            <div class="center-content"></div>
          </div>
        </div>
      </div>
    </section>
    <!-- section end -->

    <!-- 푸터 -->
    <!-- footer start -->
    <!-- <%@ include file='../footer/footer.jsp' %> -->
 <!-- footer end -->

    <!-- tap to top -->
    <div class="tap-top">
      <div>
        <i class="fas fa-angle-up"></i>
      </div>
    </div>
    <!-- tap to top end -->

    <!-- setting start 화면 검정 + 왼쪽 정렬 , 오른쪽 정렬-->
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

    <!-- latest jquery-->
    <script src="../assets/js/jquery-3.5.1.min.js"></script>

    <!-- slick js-->
    <script src="../assets/js/slick.js"></script>

    <!-- Bootstrap js-->
    <script src="../assets/js/bootstrap.bundle.min.js"></script>

    <!-- lazyload js-->
    <script src="../assets/js/lazysizes.min.js"></script>

    <!-- Theme js-->
    <script src="../assets/js/script.js"></script>

    <!-- fileupload js-->
    <script src="../assets/js/fileupload.js"></script>
  </body>
</html>
