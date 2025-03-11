<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="rica">
    <meta name="keywords" content="rica">
    <meta name="author" content="rica">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=06fc5245a1f95d2f4b68d45eedf183cd"></script>
    <link rel="icon" href="../assets/images/favicon.png" type="image/x-icon" />
    <title>여행을 더욱 특별하게, TOURO</title>

    <!--Google font-->
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:300,300i,400,400i,600,600i,700,700i,800,800i,900,900i&display=swap"
        rel="stylesheet">

    <!-- Icons -->
    <link rel="stylesheet" type="text/css" href="../assets/css/font-awesome.css">

    <!-- Animation -->
    <link rel="stylesheet" type="text/css" href="../assets/css/animate.css">

    <!-- magnific css -->
    <link rel="stylesheet" href="../assets/css/magnific-popup.css">

    <!-- Date-time picker css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/datepicker.min.css">

    <!--Slick slider css-->
    <link rel="stylesheet" type="text/css" href="../assets/css/slick.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/slick-theme.css">

    <!-- Bootstrap css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.css">

    <!--Drop zon-->
    <link rel="stylesheet" type="text/css" href="../assets/css/dropzone.css">

    <!-- Theme css -->
    <link rel="stylesheet" type="text/css" href="../assets/css/color1.css">

    <!-- kakao api -->
    <!-- <link rel="stylesheet" type="text/css" href="../assets/css/kakaoapi/kakaoapi.css"> -->

    <!-- 파일 업로드 : dropzone -->
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>

    <!-- 카카오 api -->
    <!-- <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b9d3f5257c6a474226de7cc1f6af52eb"></script> -->

    <!-- 카카오 검색 및 목록 -->
    <!-- <script src="../assets/js/kakaoapi/kakaoapi.js"></script> -->

    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0f448b5fdd2891d21a8357bbb07210aa&libraries=services,clusterer"></script>

    <!-- sweetalert.js -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


    <style>
        .map_wrap {position:relative;width:100%;height:350px; display: block;}
        .title {font-weight:bold;display:block;}
        .hAddr {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
        .hAddr-add {position:absolute;left:10px;top:10px;border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
        #centerAddr {display:block;margin-top:2px;font-weight: normal;}
        .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}

        .image-grid {
        display: flex;
        justify-content: center;
    }

        .image-preview-container {
            width: 250px;
            height: 200px;
            background-color: lightblue;
            margin-right: 10px;
            overflow: hidden;  /* Ensure the image does not overflow the container */
        }
    </style>

    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

        
</head>

<body>

    <!-- 해더 (로고, 탭메뉴 등 설정) -->
    <%@ include file='../header/header.jsp' %>
    <!--  해더 끝 -->


    <!-- breadcrumb start -->
    <section class="hotel-single-section parallax-img pt-0">
        <img
          src="../assets/images/inner-pages/breadcrumb2.jpg"
          class="bg-img bg-bottom img-fluid blur-up lazyload"
          alt=""
        />
    </section>
    <!-- breadcrumb end -->

    <form action="/touromate/register-course" method="post" id="youtFormId" enctype="multipart/form-data">
        <!-- section start -->
        <section class="single-section small-section bg-inner">
            <div class="container" data-sticky_parent>
                <div class="row">
                    <div class="col-xl-9 col-lg-8">
                        <div class="checkout-process">
                            <div class="checkout-box">
                                <h4 class="title">여행 코스 등록</h4>
                                <div class="review-section">
                                    <div class="review_box">
                                        <div class="flight_detail payment-gateway">
                                            <div class="accordion" id="accordionExample">
                                                <div class="card">
                                                    <div class="card-header" id="h_one">
                                                        <div class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#one"
                                                            aria-expanded="true" aria-controls="one">
                                                            <label for='r_one'>
                                                                <input class="radio_animated ms-0" type='radio' checked
                                                                    id='r_one' name='occupation' value='Working' required />
                                                                    여행 코스 정보
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div id="one" class="collapse show" aria-labelledby="h_one"
                                                        data-bs-parent="#accordionExample">
                                                        <div class="card-body">
                                                                <div class="form-group">
                                                                    <label for="name">제목</label>
                                                                    <input type="text" class="form-control" id="name" name="touro_mate_title">
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="number">선호 여행 유형</label>
                                                                    <input type="text" class="form-control" id="number" >
                                                                    <!-- <img src="../assets/images/creditcards.png" alt=""
                                                                        class="img-fluid blur-up lazyload"> -->
                                                                </div>
                                                                <div class="form-group">
                                                                    <label for="number">상세 내용</label>
                                                                    <textarea  class="form-control" id="number" name="touro_mate_content" style="height: 300px;"></textarea>
                                                                    <!-- <img src="../assets/images/creditcards.png" alt=""
                                                                        class="img-fluid blur-up lazyload"> -->
                                                                </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card">
                                                    <div class="card-header" id="h_two">
                                                        <div class="btn btn-link" data-bs-toggle="collapse" data-bs-target="#two" aria-expanded="true" aria-controls="two">
                                                            <label for='r_two'>
                                                                <input class="radio_animated ms-0" type='radio' id='r_two' name='occupation' value='Working' required /> 이미지 업로드
                                                            </label>
                                                        </div>
                                                    </div>
                                                    <div id="two" class="collapse" aria-labelledby="h_two" data-bs-parent="#accordionExample">
                                                        <div class="card-body">
                                                            <input type="file" class="form-control" id="fileUpload" name="files" accept="image/*"  multiple>
                                                        </br>
                                                        <div style="display: flex; justify-content: center;">
                                                            <div id="imagePreviewContainer1" class="image-preview-container"></div>
                                                            <div id="imagePreviewContainer2" class="image-preview-container"></div>
                                                            <div id="imagePreviewContainer3" class="image-preview-container"></div>
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
                                                                            img.style.width = '100%';  // Adjust the image width to fill the container
                                                                            img.style.height = '100%'; // Adjust the image height to fill the container
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
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout-box">
                                <h4 class="title">여행 코스 선택(최대 3개):</h4>
                                <div class="sub-title">
                                    <h5>여행 코스</h5>
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#add-address" class="add-new">+ 여행코스 추가</a>
                                </div>
                                <div class="row address-sec" id="travel-courses">
                                    <!-- 여행 코스가 추가되면 동적으로 생성될 영역 -->
                                    
                                </div>
                                
                                <script>
                                    // 여행 코스 정보를 저장할 배열
                                    var travelCourses = [];
                            
                                    // 여행코스 추가 버튼 클릭 시 호출되는 함수
                                    function addNewCourse() {
                                        // 여행코스 추가 모달 초기화 작업 수행 (맵 초기화 등)
                                        initializeMap_add();
                            
                                        // 여행코스 추가 모달 띄우기
                                        $('#add-address').modal('show');
                                    }
                                
                                    // 여행코스 등록 버튼 클릭 시 호출되는 함수
                                    function registerCourse() {
                                        // 선택한 위치의 주소를 가져옵니다.
                                        var selectedAddressElement = document.getElementById('detailAddr_add');
                                        
                                        if (selectedAddressElement) {
                                            var selectedAddress = selectedAddressElement.textContent.trim();
                                            console.log("Selected Address:", selectedAddress);

                                            // 여행 코스 정보를 배열에 추가
                                            var courseInfo = {
                                                name: "여행지", // 여행지명을 적절한 값으로 변경
                                                address: selectedAddress
                                            };

                                            travelCourses.push(courseInfo);

                                        // 모달 닫기
                                        $('#add-address').modal('hide');

                                        // 코스가 추가되었으므로 주소를 표시하는 부분을 업데이트합니다.
                                        var detailAddr = !!selectedAddress ? '<div>' + selectedAddress + '</div>' : '';
                                        $('.address').html(detailAddr);

                                        // 추가된 여행 코스를 동적으로 생성하여 화면에 표시
                                        displayCourses();
                                        } else {
                                            console.error("Error: Cannot find element with ID 'detailAddr_add'");
                                        }

                                    }
                           
                                    // 여행코스를 동적으로 생성하여 화면에 표시하는 함수
                                    function displayCourses() {
                                        var coursesContainer = $('#travel-courses');
                                        coursesContainer.empty(); // 기존 코스 삭제

                                        for (var index = 1; index < 4; index++) {
                                            var course = travelCourses[index];
                                            var selectedAddress = course.address;
                                            var detailAddrId = 'detailAddr_' + (index+1);
                                            var detailAddr = selectedAddress;
                                        // travelCourses.forEach(function (course, index) {
                                        //     var selectedAddress = course.address;
                                        //     var detailAddrId = 'detailAddr_' + index;
                                        //     var detailAddr = !!selectedAddress ? '<div>' + selectedAddress + '</div>' : '';

                                            console.log("selectedAddress:", selectedAddress);
                                            console.log("detailAddrId:", detailAddrId);
                                            console.log("detailAddr:", detailAddr);
                                            console.log("course: ", course);
                                            console.log("1", course[0]);

                                            var courseHtml = `
                                                <div class="select-box active col-xl-4 col-md-6">
                                                    <div class="address-box">
                                                        <div class="top">
                                                            <input type="text" class="form-control" id="detailname_${'${index}'}" name="touro_mate_name${'${index}'}">
                                                        </div>
                                                        <div class="middle">
                                                            <!-- 여기에 도로명 주소 추가 -->
                                                            
                                                            <input type="text" class="form-control" id="detailAddr_${'${index}'}" name="touro_mate_addr${'${index}'}" value="${'${selectedAddress}'}" readonly>
                                                            
                                                        </div>
                                                        <div class="bottom">
                                                            <!-- 여행코스 삭제 버튼 -->
                                                            <a href="javascript:void(0);" onclick="removeCourse(${'${index}'})" class="bottom_btn" style="width:100%">remove</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            `;

                                            coursesContainer.append(courseHtml);

                                            if (selectedAddress) {
                                                $('#' + detailAddrId).html(selectedAddress);
                                            }
                                        };
                                    }

                                    // 여행코스 삭제 버튼 클릭 시 호출되는 함수
                                    function removeCourse(index) {
                                        // 해당 인덱스의 동적 요소 삭제
                                        travelCourses.splice(index, 1); // 배열에서 해당 인덱스의 요소 제거
                                        displayCourses(); // 변경된 여행코스를 다시 화면에 표시
                                    }

                                        // 여행코스 수정 버튼 클릭 시 호출되는 함수
                                        // function editCourse(index) {
                                        //     // 여행코스 수정 모달 띄우기
                                        //     $('#edit-address').modal('show');

                                        //     // 모달에 현재 여행 코스 정보 표시
                                        //     var currentCourse = travelCourses[index];
                                        //     var map_edit = new kakao.maps.Map(document.getElementById('map_edit_' + index), {
                                        //         center: new kakao.maps.LatLng(37.566826, 126.9786567), // 기본 중심 좌표
                                        //         level: 1
                                        //     });

                                        //     // 여행 코스 정보에서 도로명 주소를 가져와서 모달에 표시
                                        //     var detailAddrId = 'detailAddr_' + index; // 고유한 식별자 생성
                                        //     var detailAddr = !!currentCourse.address ? '<div id="' + detailAddrId + '">' + currentCourse.address + '</div>' : '';
                                        //     document.getElementById('centerAddr').innerHTML = detailAddr;

                                        //     // 도로명 주소를 동적으로 생성되는 코스의 address 요소에 할당
                                        //     var selectedAddress = currentCourse.address;
                                        //     if (selectedAddress) {
                                        //         $('#' + detailAddrId).html(selectedAddress);

                                        //         // 수정 모달의 input에 현재 주소를 설정
                                        //         $('#editedAddr').val(selectedAddress);

                                        //         // 카카오 API 모달에서 새로운 주소를 선택하면 업데이트된 주소로 value 설정
                                        //         setTimeout(function () {
                                        //             var updatedAddress = $('#editedAddr').val();
                                        //             $('#' + detailAddrId).html(updatedAddress); // 업데이트된 주소로 화면에 표시
                                        //         }, 0);
                                        //     }
                                        // }
                                </script>
                            </div>
                        </div>
                    </div>
                    <!-- 인원수 설정 -->
                    <div class="col-xl-3 col-lg-4 checkout-cart">
                        <div class="sticky-cls-top">
                            <div class="single-sidebar order-cart-right">
                                <div class="order-cart">
                                    <div class="form-group" name="touro_mate_count">
                                        <input type="hidden" name="touro_mate_count" id="touro_mate_count" value="1">
                                        <h4 class="title">모집인원</h4>
                                    </div>
                                    <div class="cart-items">
                                        <div class="items veg">
                                            <!-- <h6>Veg Cheese Quesadillas</h6> -->
                                            <!-- <h5>$10.00</h5> -->
                                            <div class="qty-box cart_qty">
                                                <div class="input-group">
                                                    <button type="button" class="btn qty-left-minus" data-type="minus"
                                                        data-field="" tabindex="1" onclick="minusQuantity()">
                                                        <i class="fa fa-minus" aria-hidden="true"></i>
                                                    </button>
                                                    <!-- <input type="text" name="quantity"
                                                        class="form-control input-number qty-input" value="1" tabindex="1" id="inputQuantity"> -->
                                                    <span id="inputQuantity" class="form-control input-number qty-input">1</span>
                                                    <button type="button" class="btn qty-right-plus" data-type="plus"
                                                        data-field="" tabindex="1" onclick="plusQuantity()">
                                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="price">
                                                <span  id="quantityValue">1</span>명
                                            </div>
                                            <!-- 카운트 js 코드 -->
                                            <script>
                                                var quantitySpan = document.getElementById('quantityValue');
                                                var hiddenField = document.getElementById('touro_mate_count');
                                                var buttonText = document.getElementById('inputQuantity');
                                            
                                                function plusQuantity() {
                                                    var currentQuantity = parseInt(quantitySpan.innerText, 10);
                                                    currentQuantity += 1;
                                            
                                                    quantitySpan.innerText = currentQuantity;
                                                    buttonText.innerText = currentQuantity;
                                                    hiddenField.value = currentQuantity; // 모집인원을 히든 필드에 설정
                                            
                                                    // 추가: 서버로 모집인원 업데이트 전송 (AJAX 또는 폼 제출 등)
                                                    updateServerWithQuantity(currentQuantity);
                                                }
                                            
                                                function minusQuantity() {
                                                    var currentQuantity = parseInt(quantitySpan.innerText, 10);
                                                    if (currentQuantity > 1) {
                                                        currentQuantity -= 1;
                                                        quantitySpan.innerText = currentQuantity;
                                                        buttonText.innerText = currentQuantity;
                                                        hiddenField.value = currentQuantity; // 모집인원을 히든 필드에 설정
                                            
                                                        // 추가: 서버로 모집인원 업데이트 전송 (AJAX 또는 폼 제출 등)
                                                        updateServerWithQuantity(currentQuantity);
                                                    } else {
                                                        buttonText.innerText = 1;
                                                        hiddenField.value = 1; // 최소값일 때도 설정
                                                    }
                                                }
                                            </script>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="single-sidebar p-0">
                                <div class="newsletter-sec">
                                    <div>
                                        <h4 class="title">등록 전 확인</h4>
                                        <p>Check your contents!</p>
                                            <div class="button">
                                                <input class="btn btn-solid" type="submit" value="등록" style="width: 60px;"/>
                                            </div>
                                    </div>
                                </div>
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

        <!-- 여행코스 수정 모달 -->
        <!-- add card modal start -->
        <!-- <div class="modal fade edit-profile-modal" id="edit-address" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">여행 코스 장소 찍어주세요</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body"> -->
                        <!-- 카카오 api -->
                        <!-- <div class="map_wrap">
                            <div id="map_edit" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                            <div class="hAddr">
                                <span class="title">지도중심기준 행정동 주소정보</span>
                                <span id="centerAddr_edit"></span>
                            </div>
                        </div> -->
                        
                        <!-- <script>
                            var mapContainer = document.getElementById('map_edit'), // 지도를 표시할 div 
                                mapOption = {
                                    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                    level: 1 // 지도의 확대 레벨
                                };  
                            
                            // 지도를 생성합니다    
                            var map = new kakao.maps.Map(mapContainer, mapOption); 
                            
                            // 주소-좌표 변환 객체를 생성합니다
                            var geocoder = new kakao.maps.services.Geocoder();
                            
                            var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
                                infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
                            
                            // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
                            searchAddrFromCoords(map.getCenter(), displayCenterInfo);
                            
                            // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
                            kakao.maps.event.addListener(map, 'click', function(mouseEvent) {                  
                                searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                                    if (status === kakao.maps.services.Status.OK) {
                                        var detailAddr = !!result[0].road_address ? '<div>' + result[0].road_address.address_name + '</div>' : '';
                                        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
 
                                        console.log(detailAddr);
                                        
                                        var content = '<div class="bAddr">' +
                                                        '<span class="title">법정동 주소정보</span>' + 
                                                        detailAddr + 
                                                    '</div>';
                            
                                        // 마커를 클릭한 위치에 표시합니다 
                                        marker.setPosition(mouseEvent.latLng);
                                        marker.setMap(map);
                            
                                        // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
                                        infowindow.setContent(content);
                                        infowindow.open(map, marker);
                                    }   
                                });
                            });
                            
                            // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
                            kakao.maps.event.addListener(map, 'idle', function() {
                                searchAddrFromCoords(map.getCenter(), displayCenterInfo);
                            });
                            
                            function searchAddrFromCoords(coords, callback) {
                                // 좌표로 행정동 주소 정보를 요청합니다
                                geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
                            }
                            
                            function searchDetailAddrFromCoords(coords, callback) {
                                // 좌표로 법정동 상세 주소 정보를 요청합니다
                                geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
                            }
                            
                            // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
                            function displayCenterInfo(result, status) {
                                if (status === kakao.maps.services.Status.OK) {
                                    var infoDiv = document.getElementById('centerAddr');
                            
                                    for(var i = 0; i < result.length; i++) {
                                        // 행정동의 region_type 값은 'H' 이므로
                                        if (result[i].region_type === 'H') {
                                            infoDiv.innerHTML = result[i].address_name;
                                            break;
                                        }
                                    }
                                }    
                            }
                        </script> -->

                    <!-- </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-solid">코스 수정</button>
                    </div>
                </div>
            </div>
        </div> -->
        <!-- edit password modal start -->

        <!-- 여행코스 추가 모달 -->
        <!-- add card modal start -->
        <div class="modal fade edit-profile-modal" id="add-address" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">여행 코스 장소 찍어주세요</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- 카카오 api -->
                        <div class="map_wrap">
                            <div id="map_add" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                            <div class="hAddr">
                                <span class="title">지도중심기준 행정동 주소정보</span>
                                <span id="centerAddr_add"></span>
                            </div>
                        </div>
                        
                        <script>
                        setTimeout(function(){    
                            var mapContainer_add = document.getElementById('map_add'), // 지도를 표시할 div
                                mapOption_add = {
                                    center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
                                    level: 1 // 지도의 확대 레벨
                                };  
                            // 지도를 생성합니다    
                            var map_add = new kakao.maps.Map(mapContainer_add, mapOption_add);
                            
                            
                            // 주소-좌표 변환 객체를 생성
                            var geocoder_add = new kakao.maps.services.Geocoder();
                            
                            var marker_add = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커
                                infowindow_add = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소 표시 윈도우
                            
                            // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시
                            searchAddrFromCoords_add(map_add.getCenter(), displayCenterInfo_add);
                            
                            // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록
                            kakao.maps.event.addListener(map_add, 'click', function(mouseEvent) {
                                searchDetailAddrFromCoords_add(mouseEvent.latLng, function(result, status) {
                                    if (status === kakao.maps.services.Status.OK) {
                                        var detailAddr_add = !!result[0].road_address ? '<div id="detailAddr_add">' + result[0].road_address.address_name + '</div>' : '';
                                        detailAddr_add += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
                                        
                                        var content_add = '<div class="bAddr">' +
                                                        '<span class="title">법정동 주소정보</span>' + 
                                                        detailAddr_add + 
                                                    '</div>';
                            
                                        // 마커를 클릭한 위치에 표시
                                        marker_add.setPosition(mouseEvent.latLng);
                                        marker_add.setMap(map_add);
                            
                                        infowindow_add.setContent(content_add);
                                        infowindow_add.open(map_add, marker_add);
                                    }   
                                });
                            });
                            
                            // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시
                            kakao.maps.event.addListener(map_add, 'idle', function() {
                                searchAddrFromCoords_add(map_add.getCenter(), displayCenterInfo_add);
                            });
                            
                            function searchAddrFromCoords_add(coords, callback) {
                                // 좌표로 행정동 주소 정보를 요청합니다
                                geocoder_add.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
                            }
                            
                            function searchDetailAddrFromCoords_add(coords, callback) {
                                // 좌표로 법정동 상세 주소 정보를 요청합니다
                                geocoder_add.coord2Address(coords.getLng(), coords.getLat(), callback);
                            }
                            
                            // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
                            function displayCenterInfo_add(result, status) {
                                if (status === kakao.maps.services.Status.OK) {
                                    var infoDiv_add = document.getElementById('centerAddr_add');
                            
                                    for(var i = 0; i < result.length; i++) {
                                        if (result[i].region_type === 'H') {
                                            infoDiv_add.innerHTML = result[i].address_name;
                                            break;
                                        }
                                    }
                                }    
                            }
                        }, 1500);
                        </script>

                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-solid" data-bs-dismiss="modal" onclick="registerCourse()">코스 등록</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- edit password modal start -->

    </form>


    <!-- tap to top -->
    <div class="tap-top">
        <div>
            <i class="fas fa-angle-up"></i>
        </div>
    </div>
    <!-- tap to top end -->


    <!-- latest jquery-->
    <script src="../assets/js/jquery-3.5.1.min.js"></script>

    <!-- zoom gallery js -->
    <script src="../assets/js/jquery.magnific-popup.js"></script>
    <script src="../assets/js/zoom-gallery.js"></script>

    <!-- date-time picker js -->
    <script src="../assets/js/date-picker.js"></script>

    <!-- stick section js -->
    <script src='../assets/js/sticky-kit.js'></script>

    <!-- slick js-->
    <script src="../assets/js/slick.js"></script>

    <!-- Bootstrap js-->
    <script src="../assets/js/bootstrap.bundle.min.js"></script>

    <!-- lazyload js-->
    <script src="../assets/js/lazysizes.min.js"></script>

    <!-- Theme js-->
    <script src="../assets/js/script.js"></script>

    <!-- 카카오 맵 띄우기 -->
    <!-- <script src="../assets/js/kakaoapi/kakaomap.js"></script> -->

    <!-- 카카오 지오(내위치) 띄우기 -->
    <!-- <script src="../assets/js/kakaoapi/kakaogeo.js"></script> -->

    <script>
        $('#datetimepicker').datetimepicker({
            uiLibrary: 'bootstrap4',
        });
    </script>

    <script>
        Dropzone.autoDiscover = false; // deprecated 된 옵션. false로 해놓는걸 공식문서에서 명시
    
        const dropzone = new Dropzone("div.dropzone", {
        url: "https://httpbin.org/post",
        });
  </script>

</body>

</html>
