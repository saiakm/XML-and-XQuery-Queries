let $books := doc('db/books.xml')
let $xml := for $x in $books/biblio/author
for $y in $x/book
group by $n := $y/title
return <book year = "{$y[1]/@year}">{$y[1]/title}{$y[1]/category}{$y[1]/rating}{$y[1]/price}<author>{$x/name}</author></book>
return <biblio>{$xml}</biblio>