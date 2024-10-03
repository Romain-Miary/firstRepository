<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\activityFields;

// Route pour afficher la liste des activityFields
Route::get('/activityFields', [activityFields::class, 'Get_info'])->name('activityFields.Get_info');

// Route pour afficher un activityField par son ID
Route::get('/activityFields/{id}', [activityFields::class, 'show'])->name('activityFields.show');
