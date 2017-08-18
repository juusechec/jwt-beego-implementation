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
    Username: <input type="text" name="username"><br /> password: <input type="text" name="password"><br />
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

  <h2>Repeat with GET action with HEADER:</h2>
  tokenString: <input id="getTokenHeader" type="text" name="tokenString"><br />
  <input type="button" value="Click Me" onclick="xhrToSend();" />

  <h2>Repeat with POST action with HEADER:</h2>
  tokenString: <input id="postTokenHeader" type="text" name="tokenString"><br />
  <input type="button" value="Click Me" onclick="xhrToSendPost();" />

  <script>
    function xhrToSend() {
      var tokenString = document.getElementById('getTokenHeader').value;
      console.log('xhrToSend getTokenHeader', tokenString);
      // Attempt to creat the XHR2 object
      var xhr;
      try {
        xhr = new XMLHttpRequest();
      } catch (e) {
        try {
          xhr = new XDomainRequest();
        } catch (e) {
          try {
            xhr = new ActiveXObject('Msxml2.XMLHTTP');
          } catch (e) {
            try {
              xhr = new ActiveXObject('Microsoft.XMLHTTP');
            } catch (e) {
              statusField('\nYour browser is not' +
                ' compatible with XHR2');
            }
          }
        }
      }
      xhr.open('GET', 'service4', true);
      xhr.setRequestHeader("X-JWTtoken", tokenString);
      xhr.onreadystatechange = function(e) {
        if (xhr.readyState == 4 && xhr.status == 200) {
          console.log('Finish:', xhr.response);
        }
      };
      xhr.send();
    };

    function xhrToSendPost() {
      // Attempt to creat the XHR2 object
      var tokenString = document.getElementById('postTokenHeader').value;
      var xhr;
      try {
        xhr = new XMLHttpRequest();
      } catch (e) {
        try {
          xhr = new XDomainRequest();
        } catch (e) {
          try {
            xhr = new ActiveXObject('Msxml2.XMLHTTP');
          } catch (e) {
            try {
              xhr = new ActiveXObject('Microsoft.XMLHTTP');
            } catch (e) {
              statusField('\nYour browser is not' +
                ' compatible with XHR2');
            }
          }
        }
      }
      xhr.open('POST', 'service4', true);
      xhr.setRequestHeader("X-JWTtoken", tokenString);
      xhr.setRequestHeader("Content-type", "application/json");
      xhr.onreadystatechange = function(e) {
        if (xhr.readyState == 4 && xhr.status == 200) {
          console.log('Finish:', xhr.response);
        }
      };
      var objeto = {
        'myKey': 'myValue2 send from Client'
      }
      xhr.send(JSON.stringify(objeto));
    };
  </script>

  <script src="/static/js/reload.min.js"></script>
</body>

</html>
