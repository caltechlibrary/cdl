<!DOCTYPE html>
<html lang="en">

  <head>
    <title>List of items currently available in the Caltech Digital Loan system</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="https://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">

  </head>
  
  <body>
    <div class="container-fluid">
      <h2 class="mx-auto" style="width: 400px; text-align: center">List of available items</h2>
      <div class="d-grid gap-3">

        <div class="mb-3">
          <table class="table">
            <thead class="thead-light">
              <tr>
                <th scope="col">Barcode</th>
                <th scope="col">Title</th>
                <th scope="col">Author</th>
                <th scope="col">TIND Record</th>
                <th scope="col">Loan copies</th>
              </tr>
            </thead>
            <tbody>
            %for item in items:
              <tr scope="row">
                <td>{{item.barcode}}</td>
                <td>{{item.title}}</td>
                <td>{{item.author}}</td>
                <td><a href="https://caltech.tind.io/admin2/bibcirculation/get_item_details?ln=en&recid={{item.tind_id}}">{{item.tind_id}}</a></td>
                <td>{{item.num_copies}}</td>
              </tr>
            %end
            </tbody>
          </table>
        </div>

        <div class="py-3 mx-auto" style="width: 150px">
          <a href="/add"><button type="button" class="btn btn-primary m-0">Add new item</button></a>
        </div>
      </div>
    </div>
  </body>

</html>
