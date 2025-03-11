<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="UTF-8">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="description" content="rica" />
    <meta name="keywords" content="rica" />
    <meta name="author" content="rica" />
    <link rel="icon" href="../assets/images/favicon.png" type="image/x-icon" />
    <title>로그인</title>

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
  </head>

  <body>
    <!-- pre-loader start -->
    <!-- <div class="loader-wrapper img-gif">
      <img src="../assets/images/loader.gif" alt="" />
    </div> -->
    <!-- pre-loader end -->

  <!-- 해더 (로고, 탭메뉴 등 설정) -->
  <%@ include file='../header/header.jsp' %>
  <!--  해더 끝 -->

    <!-- breadcrumb start -->
    <section class="breadcrumb-section pt-0">
      <img
        src="../assets/images/inner-bg.jpg"
        class="bg-img img-fluid blur-up lazyload"
        alt=""
      />
      <div class="breadcrumb-content">
        <div>
          <h2>로그인</h2>
          <nav aria-label="breadcrumb" class="theme-breadcrumb">
            <ol class="breadcrumb">
              <li class="breadcrumb-item"><a href="/touro">Home</a></li>
              <li class="breadcrumb-item active" aria-current="page">login</li>
            </ol>
          </nav>
        </div>
      </div>
      <div class="title-breadcrumb">TOURO</div>
    </section>
    <!-- breadcrumb end -->

    <!-- section start -->
    <section class="section-b-space dark-cls animated-section">
      <img
        src="../assets/images/cab/grey-bg.jpg"
        alt=""
        class="img-fluid blur-up lazyload bg-img"
      />
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
                <h3>로그인</h3>
              </div>
              <div class="login-with">
                <h6>SNS 간편로그인</h6>
                <div class="row g-1 mb-2" style="text-align: center;">
                  <a class="col" href="naverLogin" target="_self">
                    <img class="img-fluid" style="max-height: 80%; " src="../assets/images/naver_login.PNG"/></a>
                  <a class="col" href="googleLogin" target="_self">
                    <img class="img-fluid" style="max-height: 80%; " src="../assets/images/google_login.PNG"/></a>
                </div>
                <div class="divider">
                  <h6>OR</h6>
                </div>
              </div>
              <form action="loginCheck" method="post">
                <div class="form-group">
                  <label for="exampleInputEmail1">아이디</label>
                  <input
                    type="text"
                    class="form-control"
                    id="user_id"
                    name="user_id"
                    aria-describedby="emailHelp"
                    placeholder="ID"
                  />
                  <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with
                                    anyone else.</small> -->
                </div>
                <div class="form-group">
                  <label for="exampleInputPassword1">비밀번호</label>
                  <input
                    type="password"
                    class="form-control"
                    id="user_pass"
                    name="user_pass"
                    placeholder="Password"
                  />
                </div>
                <div class="row find">
                  <a class="col" href="find-id" target="_self">
                    <p style="font-family: NPSfontRegular; font-size: 16px; color:cornflowerblue; text-align: center;">아이디 찾기</p>
                  </a>
                   | 
                  <a class="col" href="find-pw" target="_self">
                    <p style="font-family: NPSfontRegular; font-size: 16px; color:cornflowerblue; text-align: center;">비밀번호 찾기</p>
                  </a>
                </div>
                <div class="button-bottom">
                  <button type="submit" class="w-100 btn btn-solid" >
                    로그인
                  </button>
                </div>
              </form>
               
              <div class="divider">
                <h6>or</h6>
              </div>
              <div class="button-bottom">
                <button  class="w-100 btn btn-solid btn-outline" onclick="window.location.href = 'sign-up' ">
                  회원가입
                </button>
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

  </body>
</html>
