$(document).ready(function() {
  $.ajax({
    url: "/notice/mainNoticeList",
    type: "GET",
    dataType: "json",
    success: function(data) {
      if (data && data.length > 0) {
        var boardList = data; // NoticeVO 객체의 리스트

        // 데이터를 최신순으로 정렬
        boardList.sort(function(a, b) {
          return new Date(b.notice_regdate) - new Date(a.notice_regdate);
        });

        for (var i = 0; i < Math.min(10, boardList.length); i++) { // 최대 10개까지 출력
            var notice = boardList[i]; // NoticeVO 객체
            var row = $("<tr>");
            row.append($("<td>").text(notice.notice_id));
            row.append($("<td>").html("<a href='/notice/info?notice_id=" + notice.notice_id + "'>" + notice.notice_title + "</a>"));
            row.append($("<td>").text(formatTimestamp(notice.notice_regdate))); // Timestamp 값을 변환하여 추가
            $("table.table-color").append(row);
          }
      } else {
        console.log("메인 공지 AJAX 에러");
      }
    },
    error: function(xhr, status, error) {
      alert("AJAX Error: " + error);
    }
  });
});

//Timestamp 값을 일자 형식으로 변환하는 함수
function formatTimestamp(timestamp) {
  var date = new Date(timestamp);
  var year = date.getFullYear();
  var month = ("0" + (date.getMonth() + 1)).slice(-2);
  var day = ("0" + date.getDate()).slice(-2);
  var hours = ("0" + date.getHours()).slice(-2);
  var minutes = ("0" + date.getMinutes()).slice(-2);
  var formattedDate = year + "-" + month + "-" + day + "-" + hours + ":" + minutes;
  return formattedDate;
}