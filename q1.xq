for $x in doc('db/books.xml')/biblio/author[name = 'Jeff']/book
for $y in doc('db/books.xml')/biblio/author[name!='Jeff']
where $x/title = $y/book/title
return <book>{$x/title}<name>Jeff</name>{$y/name}</book>

