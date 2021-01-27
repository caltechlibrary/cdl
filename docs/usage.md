# Using DIBS

This page describes how DIBS works from the users' standpoint.  A separate section in this document describes the [system architecture](architecture.html#architecture--page-root) that implements the functionality described here.


## Guiding assumptions

The current design of DIBS is focused on helping instructors and students enrolled in classes.  DIBS provides fairly distinct experiences for patrons on the one hand, and staff on the other; this separation is due to expectations about how different classes of users will interact with the system:

1. We expect patrons to be mainly students enrolled in educational courses at Caltech.  We expect that patrons looking for materials to borrow will be informed about the availability of specific items via course syllabi or similar resources produced by course instructors.  Consequently, DIBS does not currently expose to patrons a catalog of "all things available for digital loan via DIBS"; in part, this is because such a list was not judged to be useful for DIBS's use-cases, and in part to avoid potential decreased availability of titles due to non-students browsing and borrowing items.
2. We expect that library staff need to interact with the system in a quite different way: to add new items to the database of digitized works and control loan parameters.  Thus, staff _do_ see a list of all items available through the system, but access to this list is limited to Library staff.

These considerations explain the front page of DIBS, which (perhaps contrary to expectations), lacks a login interface or a list of titles available in the system:

<figure>
    <img src="_static/media/welcome-page.png">
</figure>


## The patron experience






## The staff experience

The staff entry point to DIBS is located at `/list`.  If the user is not logged in when first visiting the page, they will be redirected to the login page (located at `/login`):

<figure>
    <img src="_static/media/login-page.png">
</figure>

Once logged in, they will be able to see `/list`:

<figure>
    <img src="_static/media/list-page.png">
</figure>

This page is the main interface for staff users.  It lists all of the items known to the system (whether they are ready to be available for digital loans or not), and allows staff to add, edit, or remove items.  It is also the place where staff can get the link to be distributed to patrons to request loans.  In more detail:

* **Barcode**: the barcode identifying the item in the Caltech Library.
* **Title**: the title of the item. This is entered free-form in the DIBS entry form and does not have to match the actual title in TIND.
* **Author**: the author of the item. This is entered free-form in the DIBS entry form and does not have to match the actual author in TIND.
* **Ready to loan?**: when unchecked, the item is not made available for digital loans. This allows staff who scan the items to start making an entry in DIBS and continue scanning. When done, staff can check the item and make it available to digital patrons.
* **Loan duration**: the duration of a loan. The system automatically closes the loan after the loan period and blocks the patron's access.
* **Copies for loans**: how many copies of the item are being made available for simultaneous borrowing?
* **Copies in use**: indicates the current number of copies of the item on loan at the moment.
* <span class="button button-secondary">Copy link</span>: this copies to the user's clipboard a link to the item loan page.  This is what should be communicated to course instructors, so that they can pass on the URLs to their students.
* <span class="button button-info">Edit</span>: edit the entry. This will bring up the same form as was used to add the entry, allowing the user to change the values and save the results.
* <span class="button button-danger">Remove</span>: remove the entry for the item in the DIBS database. (This does not remove the scans or other files, only the database entry.)