<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <html>

    <head lang="ko">
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
      <link href="https://fonts.googleapis.com/css?family=Work+Sans:400,500,600,700,800,900&display=swap"
        rel="stylesheet" />
      <link href="https://fonts.googleapis.com/css?family=Vampiro+One&display=swap" rel="stylesheet" />

      <!-- Icons -->
      <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css" />

      <!-- Themify icon -->
      <link rel="stylesheet" type="text/css" href="../assets/css/themify-icons.css" />

      <!-- Animation -->
      <link rel="stylesheet" type="text/css" href="../assets/css/animate.css" />

      <!-- Date-time picker css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/datepicker.min.css" />

      <!--Slick slider css-->
      <link rel="stylesheet" type="text/css" href="../assets/css/slick.css" />
      <link rel="stylesheet" type="text/css" href="../assets/css/slick-theme.css" />

      <!-- Bootstrap css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css" />

      <!-- Theme css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/color5.css" />

      <!-- chatBot css -->
      <link rel="stylesheet" type="text/css" href="../assets/css/chatBot.css" />

      <!-- footer용 js -->
      <script src="https://code.jquery.com/jquery-3.7.1.min.js"
        integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo=" crossorigin="anonymous"></script>

      <!-- 사용자 선호 여행 타입에 따른 지역별 추천 -->
      <script>
        $(function () {
          const socket = new WebSocket("ws://175.114.130.25:8765");
          const sessionId = $("#loggedInUser").val();
          console.log(sessionId);

          // Connection opened
          socket.addEventListener("open", (event) => {
            console.log("Connected to server");
            socket.send(sessionId);
          });

          // Listen for messages
          socket.addEventListener("message", (event) => {
            const recommendedResults = JSON.parse(event.data);
            console.log("Received recommended results1:", recommendedResults);
            // 여기서 받은 결과를 화면에 표시하거나 추가 로직 수행
            const info1 = JSON.parse(recommendedResults["info1"]);
            const info2 = JSON.parse(recommendedResults["info2"]);
            const info3 = JSON.parse(recommendedResults["info3"]);
            console.log("info1", info1.length);
            console.log("info2", info2);
            console.log("info3", info3.length);
            var tour_num1 = [];
            var tour_num2 = [];
            var tour_num3 = [];
            for (var i = 0; i < info1.length; i++) {
              tour_num1.push(info1[i]["tour_num"]);
            }
            for (var i = 0; i < info2.length; i++) {
              tour_num2.push(info2[i]["tour_num"]);
            }
            for (var i = 0; i < info3.length; i++) {
              tour_num3.push(info3[i]["tour_num"]);
            }
            console.log("1tour_num1", tour_num1);
            console.log("2tour_num2", tour_num2.length);
            console.log("3tour_num3", tour_num3);
            // 동적으로 구성될 데이터 객체
            var data1 = {};

            // tour_num2 배열에 있는 각 값을 tour_num1, tour_num2, ..., tour_numN으로 매핑하여 객체에 추가
            for (var i = 0; i < tour_num1.length; i++) {
              var key = "tour_num" + (i + 1);
              data1[key] = tour_num1[i];
            }
            // 1순위
            $.ajax({
              type: "GET",
              url: "preferLoc1Reco",
              contentType: "json",
              data: data1,
              success: function (res) {
                console.log("success");
                console.log("1순위", res);
                // 동적으로 menu-bar 추가
                const bottomBar = $("#reco1Box");
                let array = new Set();

                while (array.size < 3) {
                  array.add(Math.trunc(Math.random() * tour_num1.length));
                }
                array = [...array];
                console.log(array);

                for (let i = 0; i < 3; i++) {
                  const reco1 = {
                    tour_num: res[array[i]].tour_num,
                    tour_name: res[array[i]].tour_name,
                    address: res[array[i]].tour_addr,
                    imgPath: res[array[i]].tour_img1_path,
                  };
                  // menu-bar를 나타내는 HTML 문자열 생성
                  const menuBarHTML = `
                          <div class="menu-bar">
                              <a href="touro/${"${reco1.tour_num}"}">
                                  <img src="../${"${reco1.imgPath}"}" class="img-fluid blur-up lazyload" alt=""/>
                              </a>
                              <div class="content">
                                  <a href="touro/${"${reco1.tour_num}"}">
                                      <h5>${"${reco1.tour_name}"}</h5>
                                  </a>
                                  <p>${"${reco1.address}"}</p>
                              </div>
                          </div>
                      `;

                  // 생성한 HTML 문자열을 bottom-bar에 추가
                  bottomBar.append(menuBarHTML);
                }
              },
            }); // end ajax

            // 동적으로 구성될 데이터 객체
            var data2 = {};

            // tour_num2 배열에 있는 각 값을 tour_num1, tour_num2, ..., tour_numN으로 매핑하여 객체에 추가
            for (var i = 0; i < tour_num2.length; i++) {
              var key = "tour_num" + (i + 1);
              data2[key] = tour_num2[i];
            }
            // 2순위
            $.ajax({
              type: "GET",
              url: "preferLoc2Reco",
              contentType: "json",
              data: data2,
              success: function (res) {
                console.log("2순위success");
                console.log("2순위", res);
                // 동적으로 menu-bar 추가
                const bottomBar = $("#reco2Box");
                let array = new Set();

                while (array.size < 3) {
                  array.add(Math.trunc(Math.random() * tour_num2.length));
                }
                array = [...array];
                console.log("Array2", array[2]);
                for (let i = 0; i < 3; i++) {
                  const reco2 = {
                    tour_num: res[array[i]].tour_num,
                    tour_name: res[array[i]].tour_name,
                    address: res[array[i]].tour_addr,
                    imgPath: res[array[i]].tour_img1_path,
                  };
                  // menu-bar를 나타내는 HTML 문자열 생성
                  const menuBarHTML = `
                          <div class="menu-bar">
                              <a href="touro/${"${reco2.tour_num}"}">
                                  <img src="../${"${reco2.imgPath}"}" class="img-fluid blur-up lazyload" alt=""/>
                              </a>
                              <div class="content">
                                  <a href="touro/${"${reco2.tour_num}"}">
                                      <h5>${"${reco2.tour_name}"}</h5>
                                  </a>
                                  <p>${"${reco2.address}"}</p>
                              </div>
                          </div>
                      `;

                  // 생성한 HTML 문자열을 bottom-bar에 추가
                  bottomBar.append(menuBarHTML);
                }
              },
            }); // end ajax

            // 동적으로 구성될 데이터 객체
            var data3 = {};

            // tour_num2 배열에 있는 각 값을 tour_num1, tour_num2, ..., tour_numN으로 매핑하여 객체에 추가
            for (var i = 0; i < tour_num3.length; i++) {
              var key = "tour_num" + (i + 1);
              data3[key] = tour_num3[i];
            }
            // 3순위
            $.ajax({
              type: "GET",
              url: "preferLoc3Reco",
              contentType: "json",
              data: data3,
              success: function (res) {
                console.log("success");
                console.log("3순위", res);
                // 동적으로 menu-bar 추가
                const bottomBar = $("#reco3Box");
                let array = new Set();

                while (array.size < 3) {
                  array.add(Math.trunc(Math.random() * tour_num3.length));
                }
                array = [...array];
                for (let i = 0; i < 3; i++) {
                  const reco3 = {
                    tour_num: res[array[i]].tour_num,
                    tour_name: res[array[i]].tour_name,
                    address: res[array[i]].tour_addr,
                    imgPath: res[array[i]].tour_img1_path,
                  };
                  // menu-bar를 나타내는 HTML 문자열 생성
                  const menuBarHTML = `
                          <div class="menu-bar">
                              <a href="touro/${"${reco3.tour_num}"}">
                                  <img src="../${"${reco3.imgPath}"}" class="img-fluid blur-up lazyload" alt=""/>
                              </a>
                              <div class="content">
                                  <a href="touro/${"${reco3.tour_num}"}">
                                      <h5>${"${reco3.tour_name}"}</h5>
                                  </a>
                                  <p>${"${reco3.address}"}</p>
                              </div>
                          </div>
                      `;

                  // 생성한 HTML 문자열을 bottom-bar에 추가
                  bottomBar.append(menuBarHTML);
                }
              },
            }); // end ajax
          });

          // Connection closed
          socket.addEventListener("close", (event) => {
            console.log("Server closed connection");
          });
        }); // end script
      </script>

      <!-- 사용자 선호 지역에 따른 여행지 타입별 추천 -->
      <script>
        $(function () {
          const socket = new WebSocket("ws://175.114.130.25:8854");
          const sessionId = $("#loggedInUser").val();
          console.log(sessionId);

          // Connection opened
          socket.addEventListener("open", (event) => {
            console.log("Connected to server");
            socket.send(sessionId);
          });

          // Listen for messages
          socket.addEventListener("message", (event) => {
            const recommendedResults = JSON.parse(event.data);
            console.log("Received recommended results2:", recommendedResults);
            // 여기서 받은 결과를 화면에 표시하거나 추가 로직 수행
            const info1 = JSON.parse(recommendedResults["info1"]);
            const info2 = JSON.parse(recommendedResults["info2"]);
            const info3 = JSON.parse(recommendedResults["info3"]);
            console.log(info1);
            console.log(info2);
            console.log(info3);
            var tour_num1 = [];
            var tour_num2 = [];
            var tour_num3 = [];
            for (var i = 0; i < info1.length; i++) {
              tour_num1.push(info1[i]["tour_num"]); // 9
            }
            for (var i = 0; i < info2.length; i++) {
              tour_num2.push(info2[i]["tour_num"]); // 10
            }
            for (var i = 0; i < info3.length; i++) {
              tour_num3.push(info3[i]["tour_num"]); // 10
            }
            console.log("type", tour_num1);
            // 1순위
            $.ajax({
              type: "GET",
              url: "preferType1Reco",
              contentType: "json",
              data: {
                tour_num1: tour_num1[0],
                tour_num2: tour_num1[1],
                tour_num3: tour_num1[2],
                tour_num4: tour_num1[3],
                tour_num5: tour_num1[4],
                tour_num6: tour_num1[5],
                tour_num7: tour_num1[6],
                tour_num8: tour_num1[7],
                tour_num9: tour_num1[8],
              },
              success: function (res) {
                console.log("success");
                console.log(res[0]);
                // 동적으로 menu-bar 추가
                const bottomBar = $("#recoType1");
                let array = new Set();

                while (array.size < 3) {
                  array.add(Math.trunc(Math.random() * info1.length));
                }
                array = [...array];
                for (let i = 0; i < 3; i++) {
                  const reco1 = {
                    tour_num: res[array[i]].tour_num,
                    tour_name: res[array[i]].tour_name,
                    address: res[array[i]].tour_addr,
                    imgPath: res[array[i]].tour_img1_path,
                  };
                  // menu-bar를 나타내는 HTML 문자열 생성
                  const menuBarHTML = `
                        <div class="grid-item">
                          <div class="special-box p-0">
                              <div class="special-img">
                                <a href="/touro/${"${reco1.tour_num}"}">
                                  <img
                                    src="../${"${reco1.imgPath}"}"
                                    class="img-fluid blur-up lazyload bg-img"
                                    alt=""
                                    style="width:440px; height:300px;"
                                  />
                                </a>
                                <div class="content-inner">
                                  <a href="/touro/${"${reco1.tour_num}"}">
                                    <h5>${"${reco1.tour_name}"}</h5>
                                  </a>
                                  <h6>${"${reco1.address}"}</h6>
                                </div>
                              </div>
                            </div>
                          </div>
                        `;

                  // 생성한 HTML 문자열을 bottom-bar에 추가
                  bottomBar.append(menuBarHTML);
                }
              },
            }); // end ajax

            // 2순위
            $.ajax({
              type: "GET",
              url: "preferType2Reco",
              contentType: "json",
              data: {
                tour_num1: tour_num2[0],
                tour_num2: tour_num2[1],
                tour_num3: tour_num2[2],
                tour_num4: tour_num2[3],
                tour_num5: tour_num2[4],
                tour_num6: tour_num2[5],
                tour_num7: tour_num2[6],
                tour_num8: tour_num2[7],
                tour_num9: tour_num2[8],
              },
              success: function (res) {
                console.log("success");
                console.log(res[0]);
                // 동적으로 menu-bar 추가
                const bottomBar = $("#recoType2");
                let array = new Set();

                while (array.size < 3) {
                  array.add(Math.trunc(Math.random() * info2.length));
                }
                array = [...array];
                for (let i = 0; i < 3; i++) {
                  const reco2 = {
                    tour_num: res[array[i]].tour_num,
                    tour_name: res[array[i]].tour_name,
                    address: res[array[i]].tour_addr,
                    imgPath: res[array[i]].tour_img1_path,
                  };
                  // menu-bar를 나타내는 HTML 문자열 생성
                  const menuBarHTML = `

                      <div class="grid-item">
                        <div class="special-box p-0">
                            <div class="special-img">
                              <a href="/touro/${"${reco2.tour_num}"}">
                                <img
                                  src="../${"${reco2.imgPath}"}"
                                  class="img-fluid blur-up lazyload bg-img"
                                  alt=""
                                  style="width:440px; height:300px;"
                                />
                              </a>
                              <div class="content-inner">
                                <a href="/touro/${"${reco2.tour_num}"}">
                                  <h5>${"${reco2.tour_name}"}</h5>
                                </a>
                                <h6>${"${reco2.address}"}</h6>
                              </div>
                            </div>
                          </div>
                        </div>
                      `;

                  // 생성한 HTML 문자열을 bottom-bar에 추가
                  bottomBar.append(menuBarHTML);
                }
              },
            }); // end ajax

            // 3순위
            $.ajax({
              type: "GET",
              url: "preferType3Reco",
              contentType: "json",
              data: {
                tour_num1: tour_num3[0],
                tour_num2: tour_num3[1],
                tour_num3: tour_num3[2],
                tour_num4: tour_num3[3],
                tour_num5: tour_num3[4],
                tour_num6: tour_num3[5],
                tour_num7: tour_num3[6],
                tour_num8: tour_num3[7],
                tour_num9: tour_num3[8],
              },
              success: function (res) {
                console.log("success");
                console.log(res[0]);
                // 동적으로 menu-bar 추가
                const bottomBar = $("#recoType3");
                let array = new Set();

                while (array.size < 3) {
                  array.add(Math.trunc(Math.random() * info3.length));
                }
                array = [...array];
                for (let i = 0; i < 3; i++) {
                  const reco3 = {
                    tour_num: res[array[i]].tour_num,
                    tour_name: res[array[i]].tour_name,
                    address: res[array[i]].tour_addr,
                    imgPath: res[array[i]].tour_img1_path,
                  };
                  // menu-bar를 나타내는 HTML 문자열 생성
                  const menuBarHTML = `

                      <div class="grid-item">
                        <div class="special-box p-0">
                            <div class="special-img">
                              <a href="/touro/${"${reco3.tour_num}"}">
                                <img
                                  src="../${"${reco3.imgPath}"}"
                                  class="img-fluid blur-up lazyload bg-img"
                                  alt=""
                                  style="width:440px; height:300px;"
                                />
                              </a>
                              <div class="content-inner">
                                <a href="/touro/${"${reco3.tour_num}"}">
                                  <h5>${"${reco3.tour_name}"}</h5>
                                </a>
                                <h6>${"${reco3.address}"}</h6>
                              </div>
                            </div>
                          </div>
                        </div>
                      `;

                  // 생성한 HTML 문자열을 bottom-bar에 추가
                  bottomBar.append(menuBarHTML);
                }
              },
            }); // end ajax
          });

          // Connection closed
          socket.addEventListener("close", (event) => {
            console.log("Server closed connection");
          });
        }); // end script
      </script>

      <!-- 사용자 기반 필터링 추천 -->
      <script>
        $(function () {
          const socket = new WebSocket("ws://175.114.130.25:8432");
          const sessionId = $("#loggedInUser").val();
          console.log(sessionId);

          // Connection opened
          socket.addEventListener("open", (event) => {
            console.log("Connected to server");
            socket.send(sessionId);
          });

          // Listen for messages
          socket.addEventListener("message", (event) => {
            const recommendedResults = JSON.parse(event.data);
            console.log("Received recommended results1:", recommendedResults);
            // 여기서 받은 결과를 화면에 표시하거나 추가 로직 수행
            console.log(recommendedResults.length);

            // 동적으로 구성될 데이터 객체
            var data = {};

            // recommendedResults 배열에 있는 각 값을 tour_num1, tour_num2, ..., tour_numN으로 매핑하여 객체에 추가
            for (var i = 0; i < recommendedResults.length; i++) {
              var key = "tour_num" + (i + 1);
              data[key] = recommendedResults[i];
            }
            console.log("data", data);
            // 긍정 게시물 추천 여행지 - 사용자 선호 지역 중에서
            $.ajax({
              type: "GET",
              url: "yesResult",
              contentType: "json",
              data: data,
              success: function (res) {
                console.log("success");
                console.log("res", res);
                console.log("res length", res.length);
                // 동적으로 menu-bar 추가
                const bottomBar = $("#yesResult");
                let array = new Set();

                for (let i = 0; i < 4; i++) {
                  const reco3 = {
                    tour_num: res[i].tour_num,
                    tour_name: res[i].tour_name,
                    address: res[i].tour_addr,
                    imgPath: res[i].tour_img1_path,
                  };
                  // menu-bar를 나타내는 HTML 문자열 생성
                  const menuBarHTML = `
                          <div class="col-lg-3 col-sm-6">
                            <div class="step-box">
                                <div class="popular-box">
                                  <a href="touro/${"${reco3.tour_num}"}">
                                    <div class="popular_img">
                                        <img src="../${"${reco3.imgPath}"}" alt=""
                                            class="img-fluid blur-up lazyload bg-img"
                                            style="width:440px; height:300px;">
                                    </div>
                                    </a>
                                    <div class="special-content">
                                        <a href="touro/${"${reco3.tour_num}"}">
                                            <h5>${"${reco3.tour_name}"}</h5>
                                        </a>
                                        <div class="bottom-section">
                                            <div class="rating">
                                                <span>${"${reco3.address}"}</span>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                      </div>
                      `;

                  // 생성한 HTML 문자열을 bottom-bar에 추가
                  bottomBar.append(menuBarHTML);
                }
              },
            }); // end ajax
          });

          // Connection closed
          socket.addEventListener("close", (event) => {
            console.log("Server closed connection");
          });
        }); // end script
      </script>
    </head>

    <body>
      <!-- 해더 (로고, 탭메뉴 등 설정) -->
      <%@ include file='./header/header.jsp' %>
        <!--  해더 끝 -->

        <!-- <input type="hidden" value="${sessionScope.loggedInUser}" id="loggedInUser"/> -->
        <!-- 세션이 비어 있지 않으면 로그인 값으로 -->
        <c:if test="${not empty sessionScope.loggedInUser}">
          <input type="hidden" value="${sessionScope.loggedInUser.user_id}" id="loggedInUser" />
        </c:if>

        <!-- 세션이 비어있으면 병곤 아이디로  -->
        <c:if test="${empty sessionScope.loggedInUser}">
          <input type="hidden" value="dlwldus" id="loggedInUser" />
        </c:if>

        <!-- 로고, 배경 설정 (home_effect)-->
        <section class="home_effect effect-cls pt-0">
          <div class="snow" count="30"></div>
          <div class="effect_image">
            <img src="../assets/images/tour/background/2.png" alt="" />
            <div class="effect_content">
              <div>
                <h1>
                  여행을 더욱 특별하게, <br />
                  TOURO와 함께!
                </h1>
                <h3>취향 저격 여행지 AI 추천과 여행 이야기를 공유하세요</h3>
              </div>
            </div>
          </div>
        </section>
        <!-- 로고, 배경 설정 끝 -->

        <!-- 검색창 설정 -->
        <section class="section-b-space pt-5" style="padding-bottom: 60px">
          <div class="container">
            <div class="row">
              <div class="col-12">
                <div class="search_section">
                  <div class="title-3 detail-title">
                    <span class="title-label">AI Chatbot</span>
                    <h2>어디로 떠날지 고민이라면?</h2>
                    <h5>
                      여행을 떠나고 싶지만 어디로 가야할지 막막하다면?
                      <span style="color: #fd6668">AI 챗봇</span>에게 물어보세요!
                    </h5>
                  </div>
                  <div class="book-table single-table input-radius-cls">
                    <div class="table-form classic-form p-0">
                      <form id="notuse" onSubmit="return false;">
                        <div class="row w-100">
                          <div class="form-group col p-0">
                            <input id="mainInput" type="text" class="form-control"
                              placeholder="오늘따라 울적한데 바닷가로 떠나고 싶어" />
                            <img src="../assets/images/icon/chatbot_r.png" class="img-fluid blur-up lazyloaded"
                              id="btnCb" alt="" style="cursor: pointer" />
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- 검색창 설정 끝 -->

        <!-- 회원 맞춤 여행지 설정 -->
        <section class="effect-cls effect-cls-up padding-cls full-banner parallax-img">
          <img src="../assets/images/tour/background/3.jpg" class="img-fluid blur-up lazyload bg-img" alt="" />
          <div class="menu-section">
            <div class="container">
              <div class="title-3">
                <span class="title-label">touro</span>
                <c:if test="${empty sessionScope.loggedInUser}">
                  <h2>
                    게스트님의
                    <span class="point" style="color: #fd6668">AI 추천</span> 여행지
                  </h2>
                  <h5>마음에 쏙 들 여행지를 추천해 드릴게요!</h5>
                </c:if>
                <c:if test="${not empty sessionScope.loggedInUser}">
                  <h2>
                    ${sessionScope.loggedInUser.user_name}님의
                    <span class="point" style="color: #fd6668">AI 추천</span> 여행지
                  </h2>
                  <h5>
                    ${sessionScope.loggedInUser.user_name}님의 취향 분석 완료!
                    마음에 쏙 들 여행지를 추천해 드릴게요!
                  </h5>
                </c:if>
              </div>
              <div class="row">
                <div class="col">
                  <div class="slide-3 no-arrow">
                    <div>
                      <div class="menu-box">
                        <div class="top-bar">
                          <img src="../assets/images/tour/category/3.jpg" class="img-fluid blur-up lazyload" alt="" />
                          <h2>여행지 추천</h2>
                          <!-- <div class="decorate">제주도</div> -->
                        </div>
                        <div class="bottom-bar" id="reco1Box">
                          <!-- 추가추가 -->
                        </div>
                      </div>
                    </div>
                    <div>
                      <div class="menu-box">
                        <div class="top-bar">
                          <a href="#"><img src="../assets/images/tour/category/4.jpg" class="img-fluid blur-up lazyload"
                              alt="" /></a>
                          <h2>여행지 추천</h2>
                          <div class="decorate"></div>
                        </div>
                        <div class="bottom-bar" id="reco2Box">
                          <!-- 추가추가 -->
                        </div>
                      </div>
                    </div>
                    <div>
                      <div class="menu-box">
                        <div class="top-bar">
                          <a href="#"><img src="../assets/images/tour/category/5.jpg" class="img-fluid blur-up lazyload"
                              alt="" /></a>
                          <h2>여행지 추천</h2>
                          <div class="decorate"></div>
                        </div>
                        <div class="bottom-bar" id="reco3Box">
                          <!-- 추가추가  -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- 회원 맞춤 여행지 끝 -->

        <!-- 후기 게시글의 긍정 부정 판단으로 사용자 선호 지역 중에 여행지 추천 -->
        <section class="process-steps section-b-space bg-white">
          <div class="container">
            <div class="title-3">
              <span class="title-label">touro</span>
              <h2>소문난 여행지 추천</h2>
              <h5>회원님들의 긍정적인 후기로 소문난 여행지를 골라 담았습니다!</h5>
            </div>
            <div class="step-bg ratio_square">
              <div class="row popular-section" id="yesResult"></div>
            </div>
          </div>
        </section>
        <!-- 연령대별 추천 끝 -->

        <!-- 계절에 따른 추천 설정 -->
        <section class="effect-cls effect-cls-up padding-cls full-banner parallax-img">
          <img src="../assets/images/tour/background/3.jpg" class="img-fluid blur-up lazyload bg-img" alt="" />
          <div class="tourSection ratio_90">
            <div class="container">
              <div class="row">
                <div class="col-12">
                  <div class="title-3">
                    <span class="title-label">Touro</span>
                    <h2>계절에 따른 추천 여행지</h2>
                    <h5>계절의 정취를 가득 담은 여행지를 골라 담았습니다!</h5>
                  </div>
                  <div class="slider-4 no-arrow">
                    <c:forEach var="winter" items="${winter}">
                      <div>
                        <div class="tourBox">
                          <a href="touro/${winter.tour_num}">
                            <div class="tourImg winter-div">
                              <img src="../${winter.tour_img1_path}" class="img-fluid blur-up lazyload" id="winter-img"
                                alt="img" />
                            </div>
                          </a>
                          <a href="touro/${winter.tour_num}">
                            <div class="tourContent">
                              <h3 class="winter-h3">${winter.tour_name}</h3>
                              <h6 class="winter-h6">${winter.tour_addr}</h6>
                            </div>
                          </a>
                        </div>
                      </div>
                    </c:forEach>
                    <!-- <div>
                  <div class="tourBox">
                    <a href="">
                    <div class="tourImg spring-div">
                      <img
                        src="../assets/images/tour/background/6.jpg"
                        class="img-fluid blur-up lazyload bg-img"
                        alt=""
                      />
                    </div>
                    </a>
                    <a href="">
                    <div class="tourContent">
                      <h3 class="spring-h3"></h3>
                      <h6 class="spring-h6"></h6>
                    </div>
                    </a>
                  </div>
                </div> -->
                    <!-- <div>
                  <div class="tourBox">
                    <a href="">
                    <div class="tourImg summer-div">
                      <img
                        src="../assets/images/tour/background/5.jpg"
                        class="img-fluid blur-up lazyload bg-img"
                        alt=""
                      />
                    </div>
                  </a>
                  <a href="">
                    <div class="tourContent">
                      <h3 class="summer-h3"></h3>
                      <h6 class="summer-h6"></h6>
                    </div>
                  </a>
                  </div>
                </div> -->
                    <!-- <div>
                  <div class="tourBox">
                    <a href="">
                    <div class="tourImg fall-div">
                      <img
                        src="../assets/images/tour/background/7.jpg"
                        class="img-fluid blur-up lazyload bg-img"
                        alt=""
                      />
                    </div>
                  </a>
                  <a href="">
                    <div class="tourContent">
                      <h3 class="fall-h3"></h3>
                      <h6 class="fall-h6"></h6>
                    </div>
                  </a>
                  </div>
                </div> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- 계절에 따른 추천 끝 -->

        <!-- 회원 선호 지역 여행지 설정 -->
        <section class="effect-cls effect-cls-up padding-cls full-banner parallax-img">
          <img src="../assets/images/tour/background/3.jpg" class="img-fluid blur-up lazyload bg-img" alt="" />

          <div class="menu-section">
            <div class="container">
              <div class="title-3">
                <span class="title-label">touro</span>
                <c:if test="${empty sessionScope.loggedInUser}">
                  <h2>게스트님의 최애 지역 여행지</h2>
                  <h5>선호 지역에 관한 여행지를 골라 담았습니다!</h5>
                </c:if>
                <c:if test="${not empty sessionScope.loggedInUser}">
                  <h2>
                    ${sessionScope.loggedInUser.user_name}님의 최애 지역 여행지
                  </h2>
                  <h5>
                    ${sessionScope.loggedInUser.user_name}님의 1순위 선호 지역에
                    관한 여행지를 골라 담았습니다!
                  </h5>
                </c:if>
              </div>
              <div class="row">
                <div class="col">
                  <div class="slide-3 no-arrow">
                    <div>
                      <div class="menu-box">
                        <div class="top-bar">
                          <img src="../assets/images/tour/category/3.jpg" class="img-fluid blur-up lazyload" alt="" />
                          <h2>여행지 추천</h2>
                          <div class="decorate"></div>
                        </div>
                        <div class="product-wrapper-grid special-section grid-box ratio3_2" id="recoType1">
                          <!-- 추가 -->
                        </div>
                      </div>
                    </div>

                    <div>
                      <div class="menu-box">
                        <div class="top-bar">
                          <a href="#"><img src="../assets/images/tour/category/4.jpg" class="img-fluid blur-up lazyload"
                              alt="" /></a>
                          <h2>여행지 추천</h2>
                          <div class="decorate"></div>
                        </div>
                        <div class="product-wrapper-grid special-section grid-box ratio3_2" id="recoType2">
                          <!-- 추가 -->
                        </div>
                      </div>
                    </div>

                    <div>
                      <div class="menu-box">
                        <div class="top-bar">
                          <a href="#"><img src="../assets/images/tour/category/5.jpg" class="img-fluid blur-up lazyload"
                              alt="" /></a>
                          <h2>여행지 추천</h2>
                          <div class="decorate"></div>
                        </div>
                        <div class="product-wrapper-grid special-section grid-box ratio3_2" id="recoType3">
                          <!-- 추가 -->
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="special-section p-0">
            <div class="special-box"></div>
          </div>
        </section>
        <!-- 회원 선호 지역 여행지 끝 -->

        <!-- 리뷰어 설정 -->
        <section class="testimonial-section">
          <div class="container">
            <div class="title-3">
              <span class="title-label"> Touro </span>
              <h2>베스트 리뷰어</h2>
              <h5></h5>
            </div>

            <div>
              <div class="row">
                <div class="testimonial_section offset-xl-2">
                  <div class="testimonial">
                    <c:forEach items="${bestReview}" var="best" begin="0" end="0">
                      <div class="left-part col-2">
                        <a id="userInfo_${best.user_id}" data-bs-toggle="modal" data-bs-target="#profile" href="#">
                          <img src="../assets/images/avtar/1.jpg" class="img-fluid blur-up lazyload" alt="" />
                          <div class="bottom-part">
                            <h3>사용자 아이디</h3>
                          </div>
                        </a>
                      </div>
                    </c:forEach>
                    <c:forEach items="${bestReview}" var="best" begin="1" end="1">
                      <div class="left-part col-2">
                        <a id="userInfo_${best.user_id}" data-bs-toggle="modal" data-bs-target="#profile" href="#">
                          <img src="../assets/images/avtar/1.jpg" class="img-fluid blur-up lazyload" alt="" />
                          <div class="bottom-part">
                            <h3>사용자 아이디</h3>
                          </div>
                        </a>
                      </div>
                    </c:forEach>
                    <c:forEach items="${bestReview}" var="best" begin="2" end="2">
                      <div class="left-part col-2">
                        <a id="userInfo_${best.user_id}" data-bs-toggle="modal" data-bs-target="#profile" href="#">
                          <img src="../assets/images/avtar/1.jpg" class="img-fluid blur-up lazyload" alt="" />
                          <div class="bottom-part">
                            <h3>사용자 아이디</h3>
                          </div>
                        </a>
                      </div>
                    </c:forEach>
                    <c:forEach items="${bestReview}" var="best" begin="3" end="3">
                      <div class="left-part col-2">
                        <a id="userInfo_${best.user_id}" data-bs-toggle="modal" data-bs-target="#profile" href="#">
                          <img src="../assets/images/avtar/1.jpg" class="img-fluid blur-up lazyload" alt="" />
                          <div class="bottom-part">
                            <h3>사용자 아이디</h3>
                          </div>
                        </a>
                      </div>
                    </c:forEach>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>
        <!-- 리뷰어 설정 끝 -->

        <!-- 사용자 페이지(Modal) 창 구성 시작 -->
        <div class="modal fade edit-profile-modal" id="profile" tabindex="-1" role="dialog"
          aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">사용자 프로필</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body dashboard-section">
                <div class="pro_sticky_info" data-sticky_column="">
                  <div class="dashboard-sidebar">
                    <div class="profile-top">
                      <div class="profile-image">
                        <img id="modalProfileImg" src="../assets/images/profile/default_profile.png"
                          class="img-fluid blur-up lazyloaded" alt="" />
                      </div>
                      <div class="profile-detail">
                        <h5 id="user_age">사용자 연령대</h5>
                        <h6 id="user_email">mark.enderess@mail.com</h6>
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
                                <h6 class="media-heading" id="user_id">
                                  사용자 아이디
                                </h6>
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
                                <h6 class="media-heading" id="user_prefer_type1">
                                  유형
                                </h6>
                                <p>1 순위</p>
                              </div>
                              <div class="media-body">
                                <h6 class="media-heading" id="user_prefer_type2">
                                  유형
                                </h6>
                                <p>2 순위</p>
                              </div>
                              <div class="media-body">
                                <h6 class="media-heading" id="user_prefer_type3">
                                  유형
                                </h6>
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
                                <h6 class="media-heading" id="user_prefer_loc1">
                                  지역
                                </h6>
                                <p>1 순위</p>
                              </div>
                              <div class="media-body">
                                <h6 class="media-heading" id="user_prefer_loc2">
                                  지역
                                </h6>
                                <p>2 순위</p>
                              </div>
                              <div class="media-body">
                                <h6 class="media-heading" id="user_prefer_loc3">
                                  지역
                                </h6>
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

        <!-- footer start -->
        <%@ include file='./footer/footer.jsp' %>
          <!-- footer end -->

          <!-- tap to top -->
          <div class="tap-top">
            <div>
              <i class="fas fa-angle-up"></i>
            </div>
          </div>
          <!-- tap to top end -->

          <!-- 챗봇 구역 시작 -->
          <button id="chatButton">
            <img src="../assets/images/icon/chatbot_r_lg.png" class="img-fluid blur-up lazyloaded bg-img" alt="" />
          </button>

          <div class="testimonial-section row" id="chatContainer">
            <div class="enquiry-modal modal-header">
              <button type="button" class="btn-close forCb" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="ratio_square" id="chatContent">
              <!-- 여기에 챗봇 대화 내용이 들어갈 부분 -->
            </div>
            <input type="text" id="chatInput" placeholder="챗봇 입력창" />
          </div>
          <!-- 챗봇 구역 끝 -->

          <!-- latest jquery-->
          <script src="../assets/js/jquery-3.5.1.min.js"></script>

          <!-- slick js-->
          <script src="../assets/js/slick.js"></script>

          <!-- Bootstrap js-->
          <script src="../assets/js/bootstrap.bundle.min.js"></script>

          <!-- date-time picker js -->
          <script src="../assets/js/date-picker.js"></script>

          <!-- lazyload js-->
          <script src="../assets/js/lazysizes.min.js"></script>

          <!-- Theme js-->
          <script src="../assets/js/script.js"></script>
          <script src="../assets/js/snow.js"></script>

          <!-- 메인 이펙트 이미지 스크롤시 크기 변경 스크립트 -->
          <script>
            var scrollPos;
            $(window).on("scroll", function () {
              scrollPos = $(window).scrollTop();
              $(".effect_image").css(
                "background-size",
                100 + parseInt(scrollPos / 10, 0) + "% "
              );
              $(".effect_content h1").css(
                "font-size",
                400 - parseInt(scrollPos / 1.5, 0) + "% "
              );
              $(".effect_content h3").css(
                "font-size",
                120 - parseInt(scrollPos / 4, 0) + "% "
              );
              $(".effect_content").css(
                "top",
                14 + parseInt(scrollPos / 10, 0) + "% "
              );
            });
          </script>

          <!-- 사용자 정보 가져오는 ajax -->
          <script src="../assets/js/userModal.js"></script>

          <!-- 날씨 가져오기 -->
          <script src="../assets/js/weather.js"></script>

          <!-- 동작 가져오기 -->
          <script src="../assets/js/chatBot.js"></script>

          <!-- 추천 1 -->
          <!-- <script src="../assets/js/reco1.js"></script> -->
          <script>
            $(function () { });
            $("#datepicker").datepicker({
              uiLibrary: "bootstrap4",
              format: "dd mmmm",
            });
            $("#datepicker1").datepicker({
              uiLibrary: "bootstrap4",
              format: "dd mmmm",
            });
          </script>
    </body>

    </html>