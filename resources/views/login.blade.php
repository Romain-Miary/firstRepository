<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription et Connexion</title>
    @vite ([ 'resources/sass/app.scss' , 'resources/js/app.js' ] )
</head>
<body>

    <h1>S'inscrire</h1>
    <form action="/register" method="post">
        <label for="username">Nom d'utilisateur :</label>
        <input type="text" id="username" name="username" required>
        <br><br>

        <label for="email">Email :</label>
        <input type="email" id="email" name="email" required>
        <br><br>

        <label for="password">Mot de passe :</label>
        <input type="password" id="password" name="password" required>
        <br><br>

        <label for="confirm_password">Confirmer le mot de passe :</label>
        <input type="password" id="confirm_password" name="confirm_password" required>
        <br><br>

        <button type="submit">S'inscrire</button>
    </form>

    <hr>

    <h1>Se connecter</h1>
    <form action="/login" method="post">
        <label for="login_email">Email :</label>
        <input type="email" id="login_email" name="login_email" required>
        <br><br>

        <label for="login_password">Mot de passe :</label>
        <input type="password" id="login_password" name="login_password" required>
        <br><br>

        <button type="submit">Se connecter</button>
    </form>

</body>
</html>
