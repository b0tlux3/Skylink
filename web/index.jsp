
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>LOGIN PAGE</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <script src="js/bootstrap.min.js"></script>
    </head>
    <body>
        <form method="POST" action="loginServlet2">
            <div class="container">
                <div class="row">
                    <div class="col-md-offset-5 col-md-3">
                        <div class="form-login">
                            
                            <h4><span style="font-size:48px;" class="text-center glyphicon glyphicon-user"></span></h4>
                            
                            <input type="text" name="uname" required class="form-control input-sm chat-input" placeholder="Ingrese usuario...">
                            </br>
                            <input type="password" name="pass" autocomplete="off" required class="form-control input-sm chat-input" placeholder="Ingrese contraseña...">
                            </br>
                            <div class="wrapper">
                                <tr>
                                <button colspan="2" align="center" type="submit" value="Ingresar" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-log-in"></span> Ingresar</button>                           
                                &nbsp;&nbsp;
                                <button colspan="2" align="center" type="reset" value="Limpiar" class="btn btn-primary btn-md"><span class="glyphicon glyphicon-refresh"></span> Limpiar</button>                               
                                        
                                        
                                    </td>
                                </tr>
                            </div>        
                        </div>    
                    </div>
                </div>
            </div>
        </form>

    </body>
</html>

<style>
        
        body {
            
            background: url(https://s9.postimg.cc/f56pi94wv/skylinkhome2.jpg) no-repeat fixed;
            
           -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
        }

        .container {
            padding: 50px;
            position: relative;
            top:300px;
            left:-10px;
            padding-top: 40px;
            padding-bottom: 40px;
            padding-left: 20px;
            padding-right: 20px;
            opacity:0.8;

        }

        .form-login {
            background-color: #b3ecff;
            padding-top: 40px;
            padding-bottom: 40px;
            padding-left: 20px;
            padding-right: 20px;
            border-radius: 15px;
            border-color:#d2d2d2;
            border-width: 5px;
            box-shadow:0 1px 0 #cfcfcf;
        }

        h4 { 
            border:0 solid #fff; 
            border-bottom-width:1px;
            padding-bottom:10px;
            text-align: center;
        }

        .form-control {
            border-radius: 10px;
        }

        .wrapper {
            text-align: center;
        }

    </style>