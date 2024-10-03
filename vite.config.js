import { defineConfig } from  'vite' ; 
import laravel from  'laravel-vite-plugin' ; 

export  default  defineConfig ({ 
    plugins : [ 
        laravel ({ 
            input : [ 
                'resources/sass/app.scss' , // Notre nouvelle ligne vous permet de changer app.scss en whatever.scss 
                'resources/js/app.js' , 
            ], 
            refresh : true , 
        }), 
    ], 
});