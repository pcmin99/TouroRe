// $(function(){

//     // 여행지 후기
//     var userTel = $("#user_tel").val();
//     var userEmail = $("#user_email").val();

//     console.log("asdsadsadsadsadsa");
//     console.log(userTel);
//     console.log(userEmail);

//     var maxLength = 7; // 보여줄 최대 글자 수
//     var maxLengthTel = 5; // 보여줄 최대 글자 수

//     // 작성자 정보 중 전화번호 처리
//     if (userTel.length > maxLengthTel) {
//       userTel = userTel.substring(0, maxLengthTel) + '...'; // 10글자를 넘으면 10글자까지만 표시
//     }
//     $('.fa-phone-alt').append(userTel);

//     // 작성자 정보 중 이메일 처리
//     if (userEmail.length > maxLength) {
//       userEmail = userEmail.substring(0, maxLength) + '...'; // 10글자를 넘으면 10글자까지만 표시
//     }
//     $('.fa-envelope').append(userEmail);

//   });
