<?php   // api.php?id=[id to look up]
header('Content-Type: text/json');
if(!isset($_GET['id']) || sizeof($_GET['id'])==0){
    die('{error:"bad parameter"}');
}

$connection = new mysqli("localhost","miscfold_pctapp",")f431cDWo%,+", "miscfold_pctapp-dev");

if($_GET['id']==='*'){
    $results = $connection->query("select * from news");
}elseif(is_numeric($_GET['id'])){
    $results = $connection->query("select * from news where id = " . ((int)$_GET['id']));
}elseif(strpos($_GET['id'],'-') !== false){
    $parts = preg_split('/-/', $_GET['id']);
    if(count($parts) !== 2){
        die('{error:"illegal range"}');
    }
    $start = is_numeric($parts[0]) ? (int)$parts[0] : 0;
    $end = is_numeric($parts[1]) ? (int)$parts[1] : -1;
    if($start === 0 && $end === -1){
        $results = $connection->query("select * from news");
    }elseif($end === -1){
        $results = $connection->query("select * from news where id >= " . $start);
    }elseif($start === 0){
        $results = $connection->query("select * from news where id <= " . $end);
    }else{
        $results = $connection->query("select * from news where id between " . $start . " and " . $end);
    }
}

if(!isset($results)){
    die('{error:"bad statement"}');
}
$results = $results->fetch_assoc();
if(empty($results) || is_null($results)){
    die('{error:"no results"}');
}

$json = json_encode($results, JSON_PRETTY_PRINT);
if(!$json || is_null($json) || strcmp($json, "null") === 0){
    die('{error:"response could not be formatted"}');
}
print $json;