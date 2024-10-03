<?php

return [
   

    'paths' => ['api/*'], // Les routes concernées par CORS

    'allowed_methods' => ['GET', 'POST', 'PUT', 'DELETE'],

    'allowed_origins' => ['http://127.0.0.1:3001'], // Autoriser toutes les origines (à ajuster en production)

    'allowed_origins_patterns' => [],

    'allowed_headers' => ['*'],

    'exposed_headers' => [],

    'max_age' => 0,

    'supports_credentials' => false,
];