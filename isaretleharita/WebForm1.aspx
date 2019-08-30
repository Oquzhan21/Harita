<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="isaretleharita.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
      #map {
          float:left;
        width: 565px;
        height: 600px;
        background-color: grey;
      }
    </style>
    <script type="text/javascript">
    function initialize()
      {
          var myLatlng = new google.maps.LatLng(40.775146501143766, 30.384921661376946);
          var myOptions = {zoom: 15, center: myLatlng, mapTypeId: google.maps.MapTypeId.ROADMAP}
          var map = new google.maps.Map(document.getElementById("map"), myOptions);
          var marker = new google.maps.Marker({ position: myLatlng, draggable: true, flat: false, map: map, title: "Lütfen imleci işaretlemek istediğiniz noktaya taşıyınız." });
          document.forms[0].txtLat.value = 40.775146501143766;
          document.forms[0].txtLng.value = 30.384921661376946;
          google.maps.event.addListener(marker, "drag", function () {
              var latlng = marker.getPosition();
              document.forms[0].txtLat.value = latlng.lat();
              document.forms[0].txtLng.value = latlng.lng();
          });
      }
</script>
</head>
<body>
    <form id="form1" runat="server">
<div id="map"></div>
        <script>
            
     
            function initMap() {
                var uluru = { lat: 41.0356961, lng: 28.9121032 };
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 10,
                    center: uluru
                });
                var marker = new google.maps.Marker({
                    position: uluru,
                    map: map,
                    draggable: true
                });
                function updateMarkerPosition(latLng) {
                    document.getElementById('txtLat').value = latLng.lat() ,document.getElementById('txtLng').value= latLng.lng();
                }
                google.maps.event.addListener(marker, 'dragstart', function () {
                    updateMarkerAddress('Dragging...');
                });

                google.maps.event.addListener(marker, 'drag', function () {
                    updateMarkerPosition(marker.getPosition());
                });

                google.maps.event.addListener(marker, 'dragend', function () {
                    geocodePosition(marker.getPosition());
                });
               }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBF39Bshl70E5qaXulGhyTdtzrMCULnD5w&callback=initMap">
    </script>
        <div>
            <asp:Label ID="Label1" runat="server" Text="Koordinat1"></asp:Label>
            <asp:TextBox ID="txtLat" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label2" runat="server" Text="Koordinat2"></asp:Label>
            <asp:TextBox ID="txtLng" runat="server"></asp:TextBox><br />
            <asp:Label ID="Label3" runat="server" Text="Açıklama"></asp:Label>
            &nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox><br />
            <asp:Button ID="btnSave" runat="server" Text="Kaydet" OnClick="btnSave_Click" />
            
            </div>
    </form>
</body>
</html>
