<!DOCTYPE html>
<html lang="en" style="height: 100%">
  %include('static/banner.html')
  <head>
    <title>Thank you</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  </head>
  
  <body style="height: 100%">
    <div style="position: relative; padding-bottom: 3em; height: 100%">
      <div class="container pt-3">
        <h1 class="mx-auto text-center my-3" style="color: #FF6C0C">
          Thank you for using Caltech DIBS!
        </h1>
        <p class="mx-auto col-6 my-5 text-center text-info font-italic">
          If you have any comments or suggestions, please don't hesitate
          to let us know by using our <a href="{{feedback_url}}">
            anonymous feedback form</a>.
        </p>
      </div>
    </div>
      %include('static/footer.html')
    </div>
  </body>
</html>
