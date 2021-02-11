# System architecture

The architecture of DIBS consists of a server written in Python, using the [Bottle](https://bottlepy.org) framework for template-driven web pages, an SQLite database for tracking items and loans, SSO authentication, and a configuration of the JavaScript-based Universal Viewer for displaying materials. For any given item made available via DIBS, the scanned pages of the original are stored on an internal shared file system and identified by a barcode. A workflow written in Python is used to create a [IIIF](https://iiif.io) manifest; this manifest is added to the system, which then makes the scanned contents available via a data endpoint served by DIBS. This allows DIBS to implement the digital loan policies developed by our institution, such as that patrons can only borrow one item at a time.

In designing DIBS, we sought to minimize the amount of patron data requested and stored, to maintain patron privacy and reduce the impact of potential data leaks. DIBS does not store any patron information when a loan is not in effect, and during a loan, it stores only the user's institutional SSO identity combined with the (single) title they have on loan during the loan period. There are no provisions in the software for retaining the information past the loan period, or tracking identities or loan statistics based on users.


## Configuration

Settings are stored in the file [`settings.ini`](../settings.ini).  This file is read at run time by the server and database components.


## Database

The definition of the database is in [`dibs/database.py`](../dibs/database.py).  The interface is defined in terms of high-level objects that are backed by an SQLite database back-end.  The ORM used is [Peewee](http://docs.peewee-orm.com/en/latest/).

Worth knowing: Peewee queries are lazy-executed: they return iterators that must be accessed before the query is actually executed.  Thus, when selecting items, the following returns a Peewee `ModelSelector`, and not a single result or a list of results:

```python
Item.select().where(Item.barcode == barcode)
```

and you can't call something like Python's `next(...)` on this because it's an iterator and not a generator.  You have to either use a `for` loop, or create a list from the above before you can do much with it.  Creating lists in these cases would be inefficient, but we have so few items to deal with that it's not a concern currently.


## Server

## Endpoints

The definition of the service endpoints and the behaviors is in [`dibs/server.py`](../dibs/server.py).  The endpoints are implemented using [Bottle](https://bottlepy.org).  Here is a summary of the endpoints implemented by the system:

| Endpoint                 | Type | Purpose              |
|--------------------------|------|----------------------|
| `/`                      | GET  | General information page about the system |
| `/info`                  | GET  | Same as `/` |
| `/login`                 | GET  | Shows the login page |
| `/login`                 | POST | Accepts form from login page |
| `/logout`                | GET  | Logs out current user |
| `/list`                  | GET  | Show what's available for loan |
| `/add`                   | GET  | Show the page to add an item |
| `/edit/<barcode>`        | GET  | Show the page to edit an item |
| `/update/add`            | POST | Accepts form input from add-item page |
| `/update/edit`           | POST | Accepts form input from edit-item page | 
| `/ready`                 | POST | Handles checkbox in `list` page to make an item ready to loan |
| `/remove`                | POST | Handles button in `list` page to remove an item |
| `/item/<barcode>`        | GET  | Shows item information page for a given item |
| `/loan`                  | POST | Handles Loan button from `/item` page |
| `/view/<barcode>`        | GET  | Show the item in the viewer page |
| `/return/<barcode>`      | GET  | Handles Return button from viewer page |
| `/manifests/<barcode>`   | GET  | Sends manifest to viewer |
| `/thankyou`              | GET  | Destination after user uses Return button |
| `/notauthenticated`      | GET  | Error page for unathenticated users |
| `/nonexistent`           | GET  | Error page for nonexistent items |
| `/nonexistent/<barcode>` | GET  | Error page for nonexistent items |

