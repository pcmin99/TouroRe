$(function(){

    function isMobileDevice() {
        return (typeof window.orientation !== "undefined") || (navigator.userAgent.indexOf('IEMobile') !== -1);
    }

    // 페이지 로드 시 실행되는 함수
    function checkDeviceType() {
        var reviewMenuItem = document.querySelector(".dashboard-title a[href='user/appReview']");
        
        // 영수증 리뷰 메뉴를 모바일 디바이스가 아닌 경우 비활성화
        if (reviewMenuItem && !isMobileDevice()) {
            reviewMenuItem.onclick = function (event) {
                event.preventDefault();
                swal("", "모바일만 가능한 메뉴입니다.", "info");
                // alert("모바일만 가능한 메뉴입니다.");
            };
        }
    }

    // 페이지 로드 시 디바이스 체크 함수 호출
    window.onload = checkDeviceType;


})