<?php 

session_start();
require 'vendor/autoload.php';
require 'conn.php';

/*$loader = new \Twig\Loader\FilesystemLoader('views');
//$twig = new \Twig\Environment($loader);
$twig = new \Twig\Environment($loader, [
    'autoescape' => false
]);*/

// $blacklist = ['{', '/', '}', '.', 'system' , 'flag','exec',' ']; // Danh sách đen chứa các ký tự không an toàn

function isBlacklisted($string, $blacklist) {
    foreach ($blacklist as $char) {
        if (str_contains($string, $char)) {
            return true; // Chuỗi chứa ký tự trong danh sách đen
        }
    }
    return false; // Chuỗi không chứa ký tự trong danh sách đen
}


if(empty($_GET)){
	$data = file_get_contents('views/index.html');
	$loader = new Twig\Loader\ArrayLoader([
		'a.php' => $data
	]);
	$twig = new \Twig\Environment($loader);
	$sql = "SELECT * FROM meo";
	$result = mysqli_query($connect, $sql);
	$meoArray = array();
	if(mysqli_num_rows($result) > 0) {
		while($row = mysqli_fetch_assoc($result)){
			$meo = array(
				'ID' => $row['ID'],
				'name' => $row['name'],
				'content' => $row['content'],
				'link' => $row['link']
			);
			$meoArray[] = $meo;
		}
	}
	echo $twig->render('a.php', [
		'meoArray' => $meoArray
	]);
}

if(isset($_GET['ID'])){
	if(isBlacklisted($_GET['ID'], $blacklist)){
		$_GET['ID'] = "Đừng hack web tôi";
	}
	$data = file_get_contents('views/thongtin.html');
	$data = $data.$_GET['ID'];
	$data1 = file_get_contents('views/thongtin2.html');
	$data1 = $data1.$_GET['ID'];
	$data2 = file_get_contents('views/thongtin3.html');
	$data3 = $data.$data1.$data2;
	$name = $_GET['ID'];
	$stmt = $connect->prepare("SELECT * FROM `meo` WHERE (`name` = ?)");
    $stmt->bind_param("s", $name);
    $stmt->execute();
    $result = $stmt->get_result();
	$num = mysqli_num_rows($result);
	if($num > 0){
		$_SESSION['name'] = $name;
		$each = mysqli_fetch_assoc($result);
	}else {
		$name = $_SESSION['name'];
		$stmt = $connect->prepare("SELECT * FROM `meo` WHERE (`name` = ?)");
        $stmt->bind_param("s", $name);
        $stmt->execute();
        $result = $stmt->get_result();
        $each = $result->fetch_assoc();
	}
	$loader = new Twig\Loader\ArrayLoader([
		'a.html' => $data3
	]);
	$twig = new \Twig\Environment($loader);
	echo $twig->render('a.html', [
		'link' => $each['link'],
		'content' => $each['content']
	]);
}
?>