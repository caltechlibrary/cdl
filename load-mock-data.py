from datetime import datetime, timedelta
from decouple import config
from peewee import SqliteDatabase

from dibs.database import Item, Loan, Recent
from dibs.people import Person

db = SqliteDatabase(config('DATABASE_FILE', default='dibs.db'))

# Peewee autoconnects to the database if doing queries but not other ops.
db.connect()
db.create_tables([Item, Loan, Recent, Person])

# This next one is a demo item.  We provide a manifest in ./manifests/ and
# it references an open copy of the book at the Wellcome Collection in the UK.
Item.create(barcode    = '350470000363458',
            title      = 'The Biocrats',
            author     = 'Gerald Leach',
            tind_id    = '514607',
            year       = '1970',
            edition    = 'First',
            thumbnail  = 'https://dlcs.io/thumbs/wellcome/5/b18035978_0001.JP2/full/69,100/0/default.jpg',
            num_copies = 1,
            duration   = 6,
            ready      = True
)

print('-'*50)
print('Now use people-manager to add users')
print('-'*50)
