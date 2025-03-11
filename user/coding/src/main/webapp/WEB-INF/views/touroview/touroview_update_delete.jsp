<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="rica">
        <meta name="keywords" content="rica">
        <meta name="author" content="rica">
        <link rel="icon" href="../assets/images/favicon.png" type="image/x-icon" />
        <title>여행을 더욱 특별하게, TOURO</title>

        <!--Google font-->
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&display=swap"
            rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Dancing+Script&display=swap" rel="stylesheet">

        <!-- Icons -->
        <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css">

        <!-- Animation -->
        <link rel="stylesheet" type="text/css" href="../assets/css/animate.css">

        <!-- Date-time picker css -->
        <link rel="stylesheet" type="text/css" href="../assets/css/datepicker.min.css">

        <!-- magnific css -->
        <link rel="stylesheet" href="../assets/css/magnific-popup.css">

        <!--Slick slider css-->
        <link rel="stylesheet" type="text/css" href="../assets/css/slick.css">
        <link rel="stylesheet" type="text/css" href="../assets/css/slick-theme.css">

        <!-- Bootstrap css -->
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css">

        <!-- Theme css -->
        <link rel="stylesheet" type="text/css" href="../assets/css/color1.css">

        <!-- 추가한 css -->
        <link rel="stylesheet" type="text/css" href="../assets/css/fileupload.css">

        <!-- sweetalert.js -->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    </head>

    <body>

        <!-- 해더 (로고, 탭메뉴 등 설정) -->
        <%@ include file='../header/header.jsp' %>
            <!--  해더 끝 -->


            <!-- 각 게시물 이름 및 각 게시물 이미지  -->
            <section class="hotel-single-section pt-0">
                <img src="../assets/images/inner-pages/breadcrumb2.jpg"
                    class="bg-img bg-bottom img-fluid blur-up lazyload" alt="">
                <div class="hotel-title-section">
                    <div class="container ">
                        <div class="row">
                            <div class="col-12">
                                <div class="hotel-name">
                                    <div class="left-part">
                                        <div class="top">
                                            <h2>${touroviewVO.touroview_title}</h2>
                                        </div>
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
                            <form action="${pageContext.request.contextPath}/touroview/touroview_update_delete"
                                method="post" enctype="multipart/form-data">
                                <!-- 이미지만 보여주는 테이블-->
                                <input type="hidden" id="sessionId" value="${sessionScope.loggedInUser.user_id}"
                                    name="user_id" />
                                <input type="hidden" id="touroviewNum" value="${touroviewVO.touroview_num}"
                                    name="touroview_num" />
                                <input type="hidden" name="tour_num" value="${tourVO.tour_num}">

                                <!-- 이미지만 보여주는 테이블-->
                                <div class="image_section ">
                                    <div class="row">
                                        <div class="col-sm-4 d-none d-sm-block">

                                            <div class="row">
                                                <div class="col">
                                                    <input type="file" class="form-control" id="fileUpload" name="files"
                                                        accept="image/*" multiple>
                                                </div>
                                                </br>
                                                <div class="row" style="display: flex; justify-content: center;">
                                                    <div id="imagePreviewContainer1"
                                                        class="col-4 image-preview-container">
                                                    </div>
                                                    <div id="imagePreviewContainer2"
                                                        class="col-4 image-preview-container">
                                                    </div>
                                                    <div id="imagePreviewContainer3"
                                                        class="col-4 image-preview-container">
                                                    </div>
                                                </div>
                                            </div>
                                            <script>
                                                document.getElementById('fileUpload').addEventListener('change', function (e) {
                                                    const previewContainers = document.querySelectorAll('.image-preview-container');
                                                    const files = e.target.files;

                                                    for (let i = 0; i < previewContainers.length; i++) {
                                                        if (files[i]) {
                                                            const reader = new FileReader();

                                                            reader.onload = function (e) {
                                                                const img = document.createElement('img');
                                                                img.src = e.target.result;
                                                                img.alt = 'Image Preview';
                                                                img.style.marginTop = '5px';
                                                                img.style.width = '300px';  // Adjust the image width to fill the container
                                                                img.style.height = '100%'; // Adjust the image height to fill the container
                                                                if (i == 0) img.style.marginLeft = '0px';
                                                                else if (i == 1) img.style.marginLeft = '200px';
                                                                else if (i == 2) img.style.marginLeft = '400px';
                                                                previewContainers[i].innerHTML = '';
                                                                previewContainers[i].appendChild(img);
                                                            };

                                                            reader.readAsDataURL(files[i]);
                                                        } else {
                                                            previewContainers[i].innerHTML = ''; // Clear the preview if no file is selected
                                                        }
                                                    }
                                                });
                                            </script>
                                        </div>
                                    </div>
                                </div>
                                <div class="description-section">
                                    <div class="description-details">
                                        <div class="col-12">
                                            <div class="filter-panel right-filter open-cls">
                                                <div class="left-filter">
                                                </div>
                                                <div class="left-panel">
                                                    <i class="fas fa-search"></i> 여행지 찾기
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-xl-12">
                                            <div class="book-table single-table bg-inner">
                                                <div class="table-form classic-form">

                                                    <div class="row w-100">
                                                        <div class="form-group col-9 p-0">
                                                            <input type="text" class="form-control" id="searchInput"
                                                                oninput="searchDestinations()" placeholder="여행지 검색 ">

                                                            <!-- 여행지 검색 결과를 동적으로 추가할 곳-->
                                                            <ul id="searchResults"
                                                                style="max-height: 200px; overflow-y: auto;">
                                                                <c:forEach var="tour" items="${tourvo}">
                                                                    <li
                                                                        onclick="showDestinationInfo(JSON.stringify(tour))">
                                                                        ${tour.tour_name} - ${tour.tour_addr}
                                                                    </li>
                                                                </c:forEach>
                                                            </ul>
                                                        </div>
                                                        <div class="col-2">
                                                            <button type="button" class="btn btn-rounded color1"
                                                                onclick="searchDestinations()">search</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="menu-part page-section">
                                                <!-- 선택한 여행지 정보 여기에 표시-->
                                                <div id="selectedDestinationInfo">
                                                </div>
                                            </div>
                                        </div>
                                        <br />
                                    </div>
                                </div>
                                <!-- 여행지 사진 업로드 -->
                                <div class="menu-part page-section">
                                    <!-- 선택한 여행지 정보 여기에 표시-->
                                    <div id="selectedDestinationInfo">
                                    </div>
                                </div>

                                <!-- 게시글  -->
                                <div class="description-section">
                                    <div class="description-details">
                                        <div class="desc-box">
                                            <div class="about page-section menu-part" id="about" style="width: 1100px;">
                                                <br />
                                                <br />
                                                <!-- 여행지 이름-->
                                                <input type="text" class="form-control" id="destinationInput"
                                                    name="tour_name" value="${tourVO.tour_name}">
                                                <br /><br />
                                                <!-- 게시글 제목 -->
                                                <input type="text" class="form-control" id="exampleFormControlInput1"
                                                    name="touroview_title" value="${touroviewVO.touroview_title}">
                                                <br />
                                                <!-- 게시글 내용 -->
                                                <textarea class="form-control" id="exampleFormControlInput111"
                                                    name="touroview_content">${touroviewVO.touroview_content}</textarea>
                                                <br />

                                                <div style="text-align: center;">
                                                    <div style="display: inline-block; margin-right: 10px;">
                                                        <input type="submit" id="modi" value=" 수정 "
                                                            class="btn btn-rounded btn-sm color1"
                                                            style="background-color: #4a90e2;">
                                                    </div>
                                                    <div style="display: inline-block;">
                                                        <input type="submit" id="del" value=" 삭제 "
                                                            class="btn btn-rounded btn-sm color1"
                                                            style="background-color: #4a90e2;"
                                                            onclick="deleteTouroview()">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </form>
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

                <!-- fileupload js-->
                <script src="../assets/js/fileupload.js"></script>

                <script>
                    $('#datepicker').datepicker({
                        uiLibrary: 'bootstrap4',
                        format: 'dd mmmm'
                    });
                    $('#datepicker1').datepicker({
                        uiLibrary: 'bootstrap4',
                        format: 'dd mmmm'
                    });
                </script>

                <!-- 여행지 제목 받기 -->

                <!--<script>
        function deleteTouroview(){
            // 삭제 여부 사용자에게 확인
            var isConfirmed = confirm("정말로 삭제하시겠습니까?");
            // 사용자가 확인 선택한 경우 삭제 요청 진행
            if (isConfirmed){
                // 삭제할 후기 번호
                var touroviewNum = "${touroviewVO.touroview_num}";
                // ajax를 사용해서 서버에 삭제 요청
                var xhr = new XMLHttpRequest();
                xhr.open("POST", "${pageContext.request.contextPath}/touroview/deleteTouroview", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                xhr.onreadystatechange = function(){
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            alert("삭제가 완료되었습니다.");
                            window.location.href = "${pageContext.request.contextPath}/touroview/touroview_list";
                    } else {
                        alert("삭제에 실패했습니다. 다시 시도해주세요.");

                    if (xhr.readyState === 4 && xhr.status === 200){
                        // 삭제 성공 시
                        window.location.href = "${pageContext.request.contextPath}/touroview/touroview_list";

                    } else if (xhr.readyState === 4 && xhr.status !== 200){
                        // 삭제 실패 시 사용자에게 알림
                        swal("", "서버와의 통신 중 오류가 발생했습니다.", "error");
                        // alert("삭제에 실패했습니다. 다시 시도해주세요.");
                    }
                }
            };
            xhr.send("touroviewNum=" + touroviewNum);
            }
        }
    </script>-->

                <script>
                    function deleteTouroview() {
                        if (confirm("정말로 삭제하시겠습니까?")) {
                            var form = document.createElement('form');
                            form.method = 'post';
                            form.action = '${pageContext.request.contextPath}/touroview/deleteTouroview';

                            var input = document.createElement('input');
                            input.type = 'hidden';
                            input.name = 'touroviewNum';
                            input.value = '${touroviewVO.touroview_num}';
                            form.appendChild(input);

                            document.body.appendChild(form);
                            form.submit();
                        }
                    }
                </script>


                <!-- 여행지 검색하기 -->
                <script>
                    // 페이지 로드 시 초기 검색 결과 표시
                    $(document).ready(function () {
                        console.log("Document is ready.");

                        $("#searchButton").click(function () {
                            console.log("Search button clicked.");
                            searchDestinations();
                        });
                    });

                    // 여행지 검색 함수
                    function searchDestinations() {
                        var keyword = document.getElementById("searchInput").value;

                        // Ajax 사용해 서버에서 검색 결과 가져오기
                        $.ajax({
                            type: 'GET',
                            url: 'findByKeyword',
                            data: {
                                keyword: keyword
                            },
                            success: function (results) {
                                // 성공 시 검색 결과를 동적으로 추가
                                appendSearchResults(results);
                            },
                            error: function () {
                                console.log("Ajax request failed.");
                                // 오류 처리
                                alert('서버와의 통신 중 오류가 발생했습니다.');
                            }
                        });
                    }

                    // 검색 결과를 동적으로 추가하는 함수
                    function appendSearchResults(results) {
                        var searchResultsList = document.getElementById("searchResults");
                        searchResultsList.innerHTML = ""; // 기존 결과 초기화

                        // 결과 동적 추가
                        results.forEach(function (result) {
                            var resultItem = document.createElement("li");
                            resultItem.textContent = result.tour_name + " - " + result.tour_addr;
                            resultItem.onclick = function () {
                                // 선택한 여행지 이름을 입력란에 표시
                                var destinationInput = document.getElementById("destinationInput");
                                destinationInput.value = result.tour_name;
                            };
                            searchResultsList.appendChild(resultItem);
                        });
                    }



                    // 선택한 여행지 정보를 표시하는 함수
                    function showDestinationInfo(destination) {
                        console.log("Show destination info: ", destination);

                        // 여행지 번호를 hidden 필드에 설정
                        var tourNumInput = document.getElementById("selectedTourNum");
                        tourNumInput.value = destination.tour_num;

                        // 여행지 보이기
                        var selectedDestinationInfo = document.getElementById("selectedDestinationInfo");
                        var destinationInput = document.getElementById("destinationInput");
                        destinationInput.value = destination.tour_name;

                        // 선택한 여행지 정보를 HTML로 구성하여 업데이트
                        selectedDestinationInfo.innerHTML = `
        <table class="rooms-box">
            <tr>
                <td>
                    <h6 class="room-title">여행지 이름</h6>
                    <a href="#">
                        <img src="../${destination.tour_img1_path}" class="img-fluid blur-up lazyload" alt="">
                    </a>
                </td>
                <td>
                    <h5>여행지 이름: ${destination.tour_name}</h5>
                    <h6>주소: ${destination.tour_addr}</h6>
                    <p>여행지 내용: ${destination.tour_content}</p>
                </td>
            </tr>
        </table>
    `;
                    }
                </script>



    </body>

    </html>