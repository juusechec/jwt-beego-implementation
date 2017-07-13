<!DOCTYPE html>

<html>
<head>
  <title>Beego JWT Implementation</title>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>
<body>
  <header>
    <h1 class="logo">Welcome to Beego JWT Implementation</h1>
    <div class="description">
      Beego is a simple & powerful Go web framework which is inspired by tornado and sinatra.
    </div>
  </header>
  <br /><br />

  <h2>First login with "admin" and "mypassword":</h2>
  <form action="/user/getToken" method="post">
   Username: <input type="text" name="username"><br />
   password: <input type="text" name="password"><br />
   <input type="submit" value="Submit">
  </form>
  <br /><br />

  <h2>Then copy ONLY the result tokenString:</h2>
  <form action="/service1" method="get">
   tokenString: <input type="text" name="tokenString"><br />
   <input type="submit" value="Submit">
  </form>
  <br /><br />

  <h2>Repeat with POST action:</h2>
  <form action="/service2" method="post">
   tokenString: <input type="text" name="tokenString"><br />
   <input type="submit" value="Submit">
  </form>

  <script src="/static/js/reload.min.js"></script>
</body>
</html>
