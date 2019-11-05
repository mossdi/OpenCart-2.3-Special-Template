<?php

$city = $_POST['city'];

$response_test = [
    'title' => 'Тест',
    'delivery' => '9999 руб.',
    'points' => '9999 руб.',
    'post' => '9999 руб.',
    'postamat' => '9999 руб.'
];

$response_default = [
    'title' => 'Архангельск',
    'delivery' => '1000 руб.',
    'points' => 'от 199 руб.',
    'post' => 'от 199 руб.',
    'postamat' => 'от 199 руб.'
];

switch ($city) {
    case 'Тест':
        echo json_encode($response_test);
        break;

    default:
        echo json_encode($response_default);
}

?>