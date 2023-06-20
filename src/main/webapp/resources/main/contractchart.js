$(document).ready(function(){ 
	getGraph();

	function getGraph(){

		$.ajax({
			url:'/chart/MainContract',
			type: "GET",
		    dataType: "json",
			success:function(data){
				console.log("수주 차트시작");
				var nameList = [];//사원명 저장 배열
				var numList = [];//수주량 저장 배열
				
				
				for (var i = 0; i<data.length;i++){
					nameList.push(data[i].emp_name);    				  
					numList.push(data[i].cont_qty);    				  
				}
				const ctx = document.getElementById('mainContractChart').getContext('2d');
				const myChart = new Chart(ctx, {
					type: 'bar',
					data: {
						labels: nameList,
						datasets: [{
							data: numList,
							backgroundColor: [
							    '#8BC34A', // Lime Green
							    '#C5E1A5', // Light Green
							    '#81C784', // Dark Green
							    '#E1F5FE', // Pale Blue
							    '#90CAF9'  // Light Blue
							],
							borderColor: [
							    '#8BC34A', // Lime Green
							    '#C5E1A5', // Light Green
							    '#81C784', // Dark Green
							    '#E1F5FE', // Pale Blue
							    '#90CAF9'  // Light Blue
							],
							borderWidth: 1
						}]
					},
					options: {
						scales: {
							xAxes: [{
								ticks: {
									fontSize: 25 // X축 레이블 값의 글자 크기
								}
							}],
							yAxes: [{
								ticks: {
									fontSize: 20, // Y축 레이블 값의 글자 크기
									stepSize: 0.25,
									min: 0
								}
							}]
						}
					}
				});
			},
			error:function(){
				console.log("이달의수주왕 실패");
			}

		}); // ajax
	} //  getGraph
}); //document.ready