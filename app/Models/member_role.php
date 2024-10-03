<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class member_role extends Model
{namespace App\Models;

    use Illuminate\Database\Eloquent\Factories\HasFactory;
    use Illuminate\Database\Eloquent\Model;
    
    class MemberRole extends Model
    {
        use HasFactory;
    
        protected $table = 'member_role';
    }
    php artisan make:middleware CheckRole
    
    use HasFactory;
}
