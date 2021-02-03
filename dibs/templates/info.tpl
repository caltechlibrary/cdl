<!DOCTYPE html>
<html lang="en" style="height: 100%">
  %include('static/banner.html')
  <head>
    %include('static/standard-inclusions.html')
    <title>Welcome to DIBS</title>
 </head>

  <body style="height: 100%">
    <div style="position: relative; padding-bottom: 3em; height: 100%">
      %include('static/navbar.html')

      <div class="container">
        <h1 class="mx-auto text-center pt-3" style="color: #FF6C0C">
          Welcome to Caltech DIBS
        </h1>
        <h2 class="mx-auto my-3 text-center text-info font-italic">
          The Caltech Library <strong>Di</strong>gital <strong>B</strong>orrowing <strong>S</strong>ystem
        </h2>
        <p class="my-3"><strong>Caltech DIBS</strong> is an implementation of <a target="_blank" href="https://controlleddigitallending.org">Controlled Digital Lending</a>, allowing members of Caltech to borrow materials that are not otherwise available in e-book or other electronic formats. Access to materials in Caltech DIBS is limited to current Caltech faculty, students and staff.</p>
        <p class="my-3">
          The following policies are implemented by the system:
          <ol>
            <li class="my-2">The number of copies of each item is determined by the number of physical copies of the corresponding printed work that the Caltech Library has pulled from the shelves. (This is typically a very small number.)</li>
            <li class="my-2">Each user may borrow only one item total from the system at any given time.</li>
            <li class="my-2">After returning an item, users cannot borrow that same item again for a period of one hour. They can, however, borrow other items immediately.</li>
          </ol>
        </p>
      </div>

      %include('static/footer.html')
    </div>
  </body>
</html>
