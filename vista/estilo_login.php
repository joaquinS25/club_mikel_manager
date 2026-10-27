<style>

body{
    margin:0;
    padding:0;
    min-height:100vh;

    background:
    linear-gradient(
        rgba(0,0,0,.65),
        rgba(0,0,0,.65)
    ),
    url('img/fondo.jpg');

    background-size:cover;
    background-position:center;
    background-repeat:no-repeat;

    display:flex;
    justify-content:center;
    align-items:center;

    font-family:'Segoe UI', sans-serif;
}

.login-card{
    width:420px;
    background:rgba(255,255,255,.20);
    backdrop-filter: blur(2px);
    -webkit-backdrop-filter: blur(10px);

    border:1px solid rgba(255,255,255,.30);
    border-radius:20px;
    padding:35px;

    box-shadow:0 10px 35px rgba(0,0,0,.30);
}

.logo{
    width:90px;
    margin-bottom:10px;
}

.titulo{
    color:white;
    text-shadow:0 2px 5px rgba(0,0,0,.5);
}

.subtitulo,
.frase,
.footer-text,
.form-label{
    color:white;
}
.btn-login{
    background:#d4af37;
    border:none;
    color:white;
    font-weight:bold;
    height:48px;
}

.btn-login:hover{
    background:#be9b2b;
}

.form-control,
.form-select{
    height:48px;
    background:rgba(255,255,255,.75);
    border:none;
}
.form-control:focus,
.form-select:focus{
    background:rgba(255,255,255,.85);
    box-shadow:none;
}

.password-container{
    position:relative;
}

.toggle-password{
    position:absolute;
    right:15px;
    top:50%;
    transform:translateY(-50%);
    cursor:pointer;
    color:#777;
}

</style>