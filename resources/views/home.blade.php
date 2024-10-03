@extends('layouts.app')

@section('content')
<div class="container">
    <h1>Bienvenue sur la page de test des permissions</h1>

    <div id="role-info">
        Chargement des informations sur votre rôle...
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            fetch('/api/check-role', {
                method: 'GET',
                headers: {
                    'Content-Type': 'application/json',
                    'Authorization': 'Bearer ' + document.querySelector('meta[name="api-token"]').getAttribute('content')
                }
            })
            .then(response => response.json())
            .then(data => {
                const roleInfoDiv = document.getElementById('role-info');
                if (data.role === 'admin') {
                    roleInfoDiv.innerHTML = '<p>Vous êtes un <strong>administrateur</strong>.</p>';
                } else {
                    roleInfoDiv.innerHTML = '<p>Vous êtes un <strong>utilisateur</strong>.</p>';
                }
            })
            .catch(error => {
                console.error('Erreur:', error);
                document.getElementById('role-info').innerHTML = 'Erreur lors de la récupération des informations.';
            });
        });
    </script>
@endsection
<?php 
$user = Auth::user();
$token = $user->createToken('API Token')->plainTextToken;
?>
<meta name="api-token" content="{{ $token }}">
