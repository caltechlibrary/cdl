<!DOCTYPE html>
<html lang="en">
  <!--
  Thank you for using
     ______          __  __                 __         ____    ____  ____   _____
    / ____/ ____ _  / / / /_  ___   _____  / /_       / __ \  /  _/ / __ ) / ___/
   / /     / __ `/ / / / __/ / _ \ / ___/ / __ \     / / / /  / /  / __  | \__ \ 
  / /___  / /_/ / / / / /_  /  __// /__  / / / /    / /_/ / _/ /  / /_/ /  __/ / 
  \____/  \__,_/ /_/  \__/  \___/ \___/ /_/ /_/    /_____/ /___/ /_____/ /____/  
  
  Please help us to improve this system by reporting problems using the
  GitHub issue system at https://github.com/caltechlibrary/dibs/issues
  or over email at helpdesk@library.caltech.edu
  -->                           
  <head>
    <title>No such item</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
  </head>
  
  <body>
    <div class="container-fluid">
      <div class="alert alert-danger my-3" role="alert">
        <h4 class="alert-heading">No such item</h4>
        %if barcode == 'None':
          <p id="without-barcode">This item does not exist.</p>
        %else:
          <p id="with-barcode">An item with barcode {{barcode}} does not exist.</p>
        %end
      </div>
    </div
  </body>
</html>
