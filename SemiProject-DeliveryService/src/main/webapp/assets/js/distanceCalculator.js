//        function getCoordinates(startaddress, arriveaddress) {
////            var startaddress = document.getElementById("addressStart").value;
////            var arriveaddress = document.getElementById("addressArrive").value;
//            var geocoder = new kakao.maps.services.Geocoder();
//
//            var polyline = null;
//            var startlatitude = null;
//            var startlongitude = null;
//            var arrivelatitude = null;
//            var arrivelongitude = null;
//
//            geocoder.addressSearch(startaddress, function(result, status) {
//                if (status === kakao.maps.services.Status.OK) {
//                    startlatitude = result[0].y;
//                    startlongitude = result[0].x;
//                    console.log(startlatitude);
//                    console.log(startlongitude);
//
//                    if (startlatitude && startlongitude && arrivelatitude && arrivelongitude) {
//                        calculateDistance();
//                    }
//                } else {
//                    alert("출발 주소를 찾을 수 없습니다.");
//                }
//            });
//            
//            geocoder.addressSearch(arriveaddress, function(result, status) {
//                if (status === kakao.maps.services.Status.OK) {
//                    arrivelatitude = result[0].y;
//                    arrivelongitude = result[0].x;
//                    console.log(arrivelatitude);
//                    console.log(arrivelongitude);
//
//                    if (startlatitude && startlongitude && arrivelatitude && arrivelongitude) {
//                        calculateDistance();
//                    }
//                } else {
//                    alert("도착 주소를 찾을 수 없습니다.");
//                }
//            });
//
//            function calculateDistance() {
//                polyline = new daum.maps.Polyline({
//                    path: [
//                        new daum.maps.LatLng(startlatitude, startlongitude),
//                        new daum.maps.LatLng(arrivelatitude, arrivelongitude)
//                    ],
//                    strokeWeight: 2,
//                    strokeColor: '#FF00FF',
//                    strokeOpacity: 0.8,
//                    strokeStyle: 'dashed'
//                });
//
//                var distance = polyline.getLength();
//                document.getElementById("result").innerHTML = "두 지점 사이의 거리는 " + distance/1000 + "km입니다.";
//            }	
//        }
