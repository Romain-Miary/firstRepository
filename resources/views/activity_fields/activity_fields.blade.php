@extends('layouts.app')

@section('content')
    <h1>Liste des Activity Fields</h1>

    @if (session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
    @endif

    <ul>
        @foreach ($activityFields as $activityField)
            <li>
                {{ $activityField['name'] }} - 
                <a href="{{ route('activityFields.show', $activityField['id']) }}">Voir les détails</a>
            </li>
        @endforeach
    </ul>
@endsection
