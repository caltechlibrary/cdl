<!DOCTYPE html>
<html lang="en">

  <head>
    <title>Add or edit a Caltech DIBS entry</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <style>
     ::-webkit-input-placeholder                   { color: #bbb; }
     html .form-control::placeholder               { color: #bbb; }
     html .form-control::-webkit-input-placeholder { color: #bbb; }
     html .form-control:-moz-placeholder           { color: #bbb; }
     html .form-control::-moz-placeholder          { color: #bbb; }
     html .form-control:-ms-input-placeholder      { color: #bbb; }
    </style>

    <script>
     // The following code is based on a 2019-07-17 posting by user Jeff Tian
     // to Stack Overflow at https://stackoverflow.com/a/57069660/743730
     'use strict';
     (() => {
       const modified_inputs = new Set();
       const defaultValue = 'defaultValue';

       // store default values
       addEventListener('beforeinput', evt => {
         const target = evt.target;
         if (!(defaultValue in target.dataset)) {
           target.dataset[defaultValue] = ('' + (target.value || target.textContent)).trim();
         }
       });

       // detect input modifications
       addEventListener('input', evt => {
         const target = evt.target;
         let original = target.dataset[defaultValue];
         let current  = ('' + (target.value || target.textContent)).trim();

         if (original !== current) {
           if (!modified_inputs.has(target)) {
             modified_inputs.add(target);
           }
         } else if (modified_inputs.has(target)) {
           modified_inputs.delete(target);
         }
       });

       addEventListener('saved', evt => { modified_inputs.clear() }, false
       );

       addEventListener('beforeunload', evt => {
         if (modified_inputs.size) {
           const unsaved_changes_warning = 'Changes you made may not be saved.';
           evt.returnValue = unsaved_changes_warning;
           return unsaved_changes_warning;
         }
       });

     })();
    </script>
    
  </head>
  
  <body>
    <div class="container-fluid">
      <h2 class="mx-auto text-center w-100">
        %if action == "add":
        Add a new item to DIBS
        %else:
        Edit {{item.barcode}}
        %end
      </h2>
      <div class="d-grid">

        <div class="jumbotron">
          <form action="/update/{{action}}" method="POST">

            <label for="inputBarcode" class="sr-only">Barcode</label>
            <input type="barcode" name="inputBarcode" class="form-control"
                   placeholder="Barcode"
                   %if item:
                   value="{{item.barcode}}"
                   %end
                   required autofocus>

            <label for="inputTitle" class="sr-only">Title</label>
            <input type="title" name="inputTitle" class="form-control"
                   placeholder="Title"
                   %if item:
                   value="{{item.title}}"
                   %end
                   required>

            <label for="inputAuthor" class="sr-only">Author</label>
            <input type="author" name="inputAuthor" class="form-control"
                   placeholder="Author"
                   %if item:
                   value="{{item.author}}"
                   %end
                   required>

            <label for="inputTindId" class="sr-only">TindId</label>
            <input type="tindId" name="inputTindId" class="form-control"
                   placeholder="TIND Id"
                   %if item:
                   value="{{item.tind_id}}"
                   %end
                   >

            <label for="inputNumCopies" class="sr-only">Copies</label>
            <input type="copies" name="inputNumCopies" class="form-control"
                   placeholder="# copies to be made available"
                   %if item:
                   value="{{item.num_copies}}"
                   %end
                   required>

            <label for="inputDuration" class="sr-only">Loan duration (in hours)</label>
            <input type="duration" name="inputDuration" class="form-control"
                   placeholder="hours per loan"
                   %if item:
                   value="{{item.duration}}"
                   %end
                   required>
            
            <div class="py-4">
              <div class="btn-toolbar mx-auto" style="width: 240px;">
                <input class="btn btn-default mx-2" style="width: 100px"
                       name="cancel" value="Cancel" type="submit" formnovalidate/>
                <input id="btnAdd" class="btn btn-primary mx-2" style="width: 100px"
                       name="add"
                       %if item:
                       value="Save"
                       %else:
                       value="Add"
                       %end
                       type="submit"/>
              </div>
            </div>
          </form>
        </div>


      </div>
    </div>
  </body>

</html>
