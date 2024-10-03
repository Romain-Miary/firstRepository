@extends('layouts.app')

@section('content')
    <h1>Détails de l'Activity Field</h1>

    @if (session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
    @endif

    <p>Nom : {{ $activityField['name'] }}</p>
    <p>Description : {{ $activityField['description'] }}</p>
    <!-- Ajouter d'autres champs selon ce qui est disponible dans ton modèle -->
@endsection
