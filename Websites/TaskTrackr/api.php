<?php
  header('Content-type: application/json');
  session_start();
  switch($_REQUEST['action']){
    // Public functions
    case "register":
      if(isset($_REQUEST['username']) &&
          isset($_REQUEST['first_name']) && isset($_REQUEST['last_name']) &&
          isset($_REQUEST['password0']) && isset($_REQUEST['password1']) &&
          $_REQUEST['password0'] === $_REQUEST['password1']){
        try{
          require_once('public.php');
          $registered = create_account($_REQUEST['username'], $_REQUEST['first_name'], $_REQUEST['last_name'], $_REQUEST['password0']);
          echo '{"action":"register","result":' . ($registered ? "true" : "false") . '}';
        }catch(Exception $exception){
          echo '{"action":"register","result":false,"reason":"' . $exception->getMessage() . '"}';
        }
      }else{
        echo '{"action":"register","result":false,"reason":"Invalid parameters."}';
      }
      break;

    case "login":
      if(isset($_REQUEST['username']) && isset($_REQUEST['password'])){
        try{
          require_once('public.php');
          $logged_in = login($_REQUEST['username'], $_REQUEST['password']);
          echo '{"action":"login","result":' . ($logged_in ? "true" : "false") . '}';
        }catch(Exception $exception){
          echo '{"action":"login","result":false,"reason":"' . $exception->getMessage() . '"}';
        }
      }else{
        echo '{"action":"login","result":false,"reason":"Invalid parameters."}';
      }
      break;

    // Privileged functions
    case "logout":
      try{
        require_once('privileged.php');
        $logged_out = logout();
        echo '{"action":"logout","result":' . ($logged_out ? "true" : "false") . '}';
      }catch(Exception $exception){
        echo '{"action":"logout","result":false,"reason":"' . $exception->getMessage() .'"}';
      }
      break;

    case "modify_account":
      if(isset($_REQUEST['username']) &&
          isset($_REQUEST['first_name']) && isset($_REQUEST['last_name']) &&
          isset($_REQUEST['password0']) && isset($_REQUEST['password1']) &&
          $_REQUEST['password0'] === $_REQUEST['password1']){
        try{
          require_once('privileged.php');
          $modified = modify_account($_REQUEST['username'], $_REQUEST['first_name'], $_REQUEST['last_name'], $_REQUEST['password0']);
          echo '{"action":"modify_account","result":' . ($nodified ? "true" : "false") . '}';
        }catch(Exception $exception){
          echo '{"action":"modify_account","result":false,"reason":"' . $exception->getMessage() . '"}';
        }
      }else{
        echo '{"action":"modify_account","result":false,"reason":"Invalid parameters."}';
      }
      break;

    case "get_tasks":
      try{
        require_once('privileged.php');
        $tasks = get_tasks();
        echo $tasks;
      }catch(Exception $exception){
        echo '{"action":"get_tasks","result":false,"reason":"' . $exception->getMessage() . '"}';
      }
      break;

    case "add_task":
      if(isset($_REQUEST['name']) && isset($_REQUEST['latitude']) && isset($_REQUEST['longitude'])){
        try{
          require_once('privileged.php');
          $added = add_task($_REQUEST['name'], $_REQUEST['latitude'], $_REQUEST['longitude']);
          echo '{"action":"add_task","result":' . ($added ? "true" : "false") . '}';
        }catch(Exception $exception){
          echo '{"action":"add_task","result":false,"reason":"' . $exception->getMessage() . '"}';
        }
      }else{
        echo '{"action":"add_task","result":false,"reason":"Invalid parameters."}';
      }
      break;

    // Default
    default:
      echo '{"action":"'.trim(strip_tags($_REQUEST['action'], FILTER_SANITIZE_STRING)).'","result":false,"reason":"Unrecognized action"}';
      break;
  }
