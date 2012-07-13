<!DOCTYPE html>
<html lang="it">
  <head>
    <meta charset="utf-8">
    <title>Login, Alpha Immobiliare</title>
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../css/bootstrap.css" rel="stylesheet">
    <style type="text/css">
      /* Override some defaults */
      html, body {
        background-color: #eee;
      }
      body {
        padding-top: 40px; 
      }
      .container {
        width: 300px;
      }

      /* The white background content wrapper */
      .container > .content {
        background-color: #fff;
        padding: 20px;
        margin: 0 -20px; 
        -webkit-border-radius: 10px 10px 10px 10px;
           -moz-border-radius: 10px 10px 10px 10px;
                border-radius: 10px 10px 10px 10px;
        -webkit-box-shadow: 0 1px 2px rgba(0,0,0,.15);
           -moz-box-shadow: 0 1px 2px rgba(0,0,0,.15);
                box-shadow: 0 1px 2px rgba(0,0,0,.15);
      }

    .login-form {
      margin-left: 65px;
    }
  
    legend {
      margin-right: -50px;
      font-weight: bold;
      color: #404040;
    }

    </style>

</head>
<body>
  <div class="container">
      <div class="content">
          <div class="row">
          
              <div class="login-form">
              <ul class="thumbnails">
			  <li class="span3">
			    <a href="#" class="thumbnail">
			      <img src="../images/logo.png" alt="">
			    </a>
			  </li>
 		 </ul>
                  <h2>Login</h2>
                 		<form action='${postUrl}' method='POST' id='loginForm' class='cssform' autocomplete='off'>
                      <fieldset>
                          <div class="clearfix">
                              <input type="text" name='j_username' id='username' placeholder="Username">
                          </div>
                          <div class="clearfix">
                              <input type="password" class='text_' name='j_password' id='password' placeholder="Password">
                          </div>
                          <button class="btn btn-primary" type="submit">Entra</button>
                      </fieldset>
                  </form>
              </div>
          </div>
      </div>
  </div> <!-- /container -->
</body>
</html>


