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
    <meta charset="UTF-8">
    <meta http-equiv="Pragma" content="no-cache">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <link href="/viewer/uv/uv.css" rel="stylesheet" type="text/css">
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">

    <script src="/viewer/uv/lib/offline.js"></script>
    <script src="/viewer/uv/helpers.js"></script>

    <style>
     html, body { height: 97% }
     #uv {
       min-width: 600px;
       min-height: 600px;
     }
    </style>

    <title>Caltech DIBS</title>
</head>
<body>
    
  <div class="container-fluid h-100 w-100 text-center">

    <div class="row bg-light" style="margin: auto 0px">
      <div class="col-6">
        <div class="float-left my-1"><p>Loan expires at {{endtime.strftime("%I:%M %p %Z on %A, %B %d")}}.</p></div>
      </div>
      <div class="col-6">
        <button type="button" class="btn btn-danger float-right my-1"
                onclick="if(confirm('This will end your loan immediately. The loan policy is that you will have to wait one hour before borrowing this item again.')){window.location='/return/{{barcode}}';}else{return false;}">
          End loan now</button>
      </div>
    </div>

    <div class="row h-100">
      <div id="uv" class="col-12 mb-2"></div>
    </div>

  </div>

  <script>
   var myUV;

   window.addEventListener('uvLoaded', function (e) {
     myUV = createUV('#uv', {
       iiifResourceUri: '/manifests/{{barcode}}',
       configUri: '/viewer/uv-config.json'
     }, new UV.URLDataProvider());

     myUV.on("created", function(obj) {
       console.log('parsed metadata', myUV.extension.helper.manifest.getMetadata());
       console.log('raw jsonld', myUV.extension.helper.manifest.__jsonld);
     });
   }, false);

   window.onpageshow = function (event) {
     if (event.persisted) {
       window.location.reload();
     }
   };
  </script>
  <script src="uv/uv.js"></script>

</body>
</html>
