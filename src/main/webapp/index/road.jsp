<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ã�ƿ��ô� ��</title>
</head>
<style>
	.map_wrap {
		margin-top: 50px;
		margin-bottom: 50px;
	}
	
	.map1 {
		text-align: left;
	}
</style>
<body>
	<h1>Cafe</h1>
	<div class="map_wrap">
		<table class="map1">
			<tbody>
				<tr>
					<th>�ּ�</th>
					<td>����Ư���� ���ϱ� ȭ����13�� 60 (�Ͽ�� 23-1)</td>
				</tr>
				<tr>
					<th>����ö</th>
					<td>6ȣ�� ���</td>
				</tr>
				<tr>
					<th>TEL</th>
					<td>02-940-4000</td>
				</tr>
			</tbody>
		</table>
	</div>
	<!-- * Daum ���� - �����۰��� -->
	<!-- 1. ���� ��� -->
	<div id="daumRoughmapContainer1526641937116" class="root_daum_roughmap root_daum_roughmap_landing" style="width: 100%; margin-bottom: 210px;"></div>

	<!--2. ��ġ ��ũ��Ʈ * ���� �۰��� ���񽺸� 2�� �̻� ���� ���, ��ġ ��ũ��Ʈ�� �ϳ��� �����մϴ�.-->
	<script charset="UTF-8" class="daum_roughmap_loader_script"
		src="//ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

	<!-- 3. ���� ��ũ��Ʈ -->
	<script charset="UTF-8">
		new daum.roughmap.Lander({
			"timestamp" : "1526641937116",
			"key" : "o8ba",
			"mapWidth" : "",
			"mapHeight" : ""
		}).render();
	</script>
</body>
</html>