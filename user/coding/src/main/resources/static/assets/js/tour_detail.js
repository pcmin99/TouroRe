$(function () {
    // 소개문 글자 수 제한
    var tourContent = $('#num222 > p').text(); // jQuery 객체에서 텍스트 가져오기
    var maxLength = 90;

    console.log()
    // 변수 값이 제한보다 길면 제한된 길이만큼 자르고 "..."을 추가
    if (tourContent.length > maxLength) {
        tourContent = tourContent.substring(0, maxLength) + "...";
    }

    // 소개문 추가 (30자로 제한)
    $('#num123').html(
        `<h6>소개문</h6>` +
        `<p>` + tourContent + `</p>`
    );
});
