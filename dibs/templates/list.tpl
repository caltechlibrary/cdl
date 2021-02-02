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
    <meta http-equiv="Pragma" content="no-cache">

    <title>List of items currently in Caltech DIBS</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/clipboard.js/2.0.6/clipboard.min.js"></script>
  </head>

  <script>
   // This next function is based in part on the posting by user Alvaro Montoro
   // to Stack Overflow 2015-06-18, https://stackoverflow.com/a/30905277/743730
   function copyToClipboard(button, text) {
     var aux = document.createElement("input");
     aux.setAttribute("value", text);
     document.body.appendChild(aux);
     aux.select();
     document.execCommand("copy");
     document.body.removeChild(aux);

     // The following code is based in part on a 2016-09-21 posting to Stack
     // Overflow by user Nina Scholz: https://stackoverflow.com/a/39610851/743730
     var last = button.innerHTML;
     button.innerHTML = 'Copied!';
     clicked = true;
     setTimeout(function () {
       button.innerHTML = last;
       clicked = false;
     }.bind(button), 800);
   }
  </script>
  
  <body>
    <div class="container-fluid">
      <h1 class="mx-auto text-center my-2" style="color: #FF6C0C">
        Caltech DIBS <img src="dibs-icon.svg" height="40rem" style="padding-left: 1rem; vertical-align: top">
      </h1>
      <h2 class="mx-auto text-center w-75 pb-2">
        There are {{len(items)}} items in the system
      </h2>
      <div class="d-grid gap-3">

        <div class="mb-3">
          <table class="table">
            <thead class="thead-light">
              <tr>
                <th>Barcode</th>
                <th>Title</th>
                <th>Author</th>
                <th class="text-center">Ready<br>to<br>loan?</th>
                <th class="text-center">Loan<br>duration<br>(hrs)</th>
                <th class="text-center">Copies<br>for<br>loans</th>
                <th class="text-center">Copies<br>in use</th>
                <th></th>
                <th></th>
                <th></th>
              </tr>
            </thead>
            <tbody>
            %for item in items:
              <tr scope="row">
                <td>{{item.barcode}}</td>
                <td>
                  %if item.tind_id != '':
                  <a target="_blank" href="https://caltech.tind.io/record/{{item.tind_id}}">{{item.title}}</a>
                  %else:
                  {{item.title}}
                  %end
                <td>{{item.author}}</td>
                <td class="text-center">
                  <form action="/ready" method="POST">
                    <input type="hidden" name="barcode" value="{{item.barcode}}">
                    <input type="hidden" name="ready" value="{{item.ready}}">
                    <input type="checkbox" class="checkbox"
                           onChange="this.form.submit()"
                           {{'checked="checked"' if item.ready else ''}}/>
                  </form>
                </td>
                <td class="text-center">{{item.duration}}</td>
                <td class="text-center">{{item.num_copies}}</td>
                <td class="text-center">{{len([x for x in loans if x.item.barcode == item.barcode])}}</td>

                <td><button id="copyBtn" type="button" class="btn btn-secondary btn-sm"
                            onclick="copyToClipboard(this, 'http://localhost:8080/item/{{item.barcode}}');">
                  Copy link</button>
                </td>

                <td>
                  <form action="/edit/{{item.barcode}}" method="GET">
                    <input type="hidden" name="barcode" value="{{item.barcode}}"/>
                    <input type="submit" name="edit" value="Edit"
                            class="btn btn-info btn-sm"/>
                  </form>
                </td>

                <td>
                  <form action="/remove" method="POST"
                        onSubmit="return confirm('Remove entry for {{item.barcode}} (&#8220;{{item.title}}&#8221; by {{item.author}})? This will not delete the files from storage, but will remove the entry from the loan database.');">
                    <input type="hidden" name="barcode" value="{{item.barcode}}"/>
                    <input type="submit" name="remove" value="Remove"
                           class="btn btn-danger btn-sm"/>
                  </form>
                </td>
              </tr>
            %end
            </tbody>
          </table>
        </div>

        <div class="py-3 mx-auto" style="width: 150px">
          <a href="/add"}} class="btn btn-primary m-0">Add a new item</a>
        </div>
      </div>
    </div>

    <script>
       // Refresh the page automatically, so that if the user has it open
       // and someone else takes out a loan, the user has a better chance of
       // finding out as soon as possible.  This is not as good as using a
       // framework like React, but it's simpler.  This approach doesn't
       // flash the page like a meta refresh tag does.

       var refresher;
       $(document).ready(function(e) {
         refresher = setInterval("update_content();", 5000);
       })

       function update_content() {
         $.ajax({
           type: "GET",
           url: "/list",
           cache: false,
         })
          .done(function(page_html) {
            window.clearInterval(refresher);
            var newDoc = document.open("text/html");
            newDoc.write(page_html);
            newDoc.close();
          });   
       }
      </script>
  </body>

</html>
